const bcrypt = require("bcrypt");
const express = require("express");
const session = require("express-session");
const db = require("./dbconfig");

const app = express();
const PORT = 3000;

app.set("view engine", "ejs");
app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));

app.use(
  session({
    secret: "salainenavain",
    resave: false,
    saveUninitialized: false,
  }),
);

function auth(req, res, next) {
  if (!req.session.user) {
    return res.redirect("/login");
  }

  next();
}

app.get("/", (req, res) => {
  if (!req.session.user) {
    return res.redirect("/login");
  }

  res.redirect("/customers");
});

app.get("/login", (req, res) => {
  res.render("login", {
    error: null,
  });
});

app.post("/login", async (req, res) => {
  const login = req.body.login;
  const password = req.body.password;

  const [rows] = await db.query(
    `
    SELECT id, fullname, email, admin, password
    FROM system_user
    WHERE admin = 1 AND (id = ? OR email = ?)
    `,
    [login, login],
  );

  if (rows.length === 0) {
    return res.render("login", {
      error: "Väärä tunnus tai salasana",
    });
  }

  const user = rows[0];
  const ok = await bcrypt.compare(password, user.password);

  if (!ok) {
    return res.render("login", {
      error: "Väärä tunnus tai salasana",
    });
  }

  req.session.user = user;
  res.redirect("/customers");
});

app.get("/logout", (req, res) => {
  req.session.destroy(() => {
    res.redirect("/login");
  });
});

app.post("/logout", (req, res) => {
  req.session.destroy(() => {
    res.redirect("/login");
  });
});

app.get("/customers", auth, async (req, res) => {
  const [rows] = await db.query(`
    SELECT c.name AS customer_name, u.id, u.fullname, u.email, u.admin
    FROM customer c
    LEFT JOIN system_user u ON u.customer_id = c.id
    ORDER BY c.name
  `);

  res.render("customers", {
    title: "Asiakkaat",
    activePage: "customers",
    rows,
  });
});

app.get("/tickets", auth, async (req, res) => {
  const [rows] = await db.query(`
    SELECT 
      support_ticket.id,
      support_ticket.arrived,
      support_ticket.handled,
      customer.name AS customer_name,
      support_ticket.description,
      ticket_status.description AS status,
      COUNT(support_message.id) AS message_count
    FROM support_ticket
    LEFT JOIN customer ON support_ticket.customer_id = customer.id
    LEFT JOIN ticket_status ON support_ticket.status = ticket_status.id
    LEFT JOIN support_message ON support_message.ticket_id = support_ticket.id
    GROUP BY 
      support_ticket.id,
      support_ticket.arrived,
      support_ticket.handled,
      customer.name,
      support_ticket.description,
      ticket_status.description
    ORDER BY support_ticket.arrived DESC
  `);

  res.render("tickets", {
    title: "Tukipyynnöt",
    activePage: "tickets",
    rows,
  });
});

app.get("/tickets/single", auth, async (req, res) => {
  const id = req.query.id;

  const [tickets] = await db.query(
    `
    SELECT 
      support_ticket.id,
      support_ticket.arrived,
      support_ticket.description,
      support_ticket.status,
      support_ticket.handled,
      customer.name AS customer_name
    FROM support_ticket
    LEFT JOIN customer ON support_ticket.customer_id = customer.id
    WHERE support_ticket.id = ?
    `,
    [id],
  );

  const [messages] = await db.query(
    `
    SELECT support_message.created_at, system_user.fullname AS sender, support_message.body
    FROM support_message
    LEFT JOIN system_user ON support_message.from_user = system_user.id
    WHERE support_message.ticket_id = ?
    ORDER BY support_message.created_at
    `,
    [id],
  );

  const [statuses] = await db.query("SELECT * FROM ticket_status");

  res.render("ticket-single", {
    title: "Tukipyyntö",
    activePage: "tickets",
    ticket: tickets[0],
    messages,
    statuses,
  });
});

app.post("/tickets/single/status", auth, async (req, res) => {
  const ticket_id = req.body.ticket_id;
  const status_id = req.body.status_id;

  if (Number(status_id) === 4) {
    await db.query(
      "UPDATE support_ticket SET status = ?, handled = NOW() WHERE id = ?",
      [status_id, ticket_id],
    );
  } else {
    await db.query(
      "UPDATE support_ticket SET status = ?, handled = NULL WHERE id = ?",
      [status_id, ticket_id],
    );
  }

  res.redirect("/tickets/single?id=" + ticket_id);
});

app.post("/tickets/single", auth, async (req, res) => {
  const ticket_id = req.body.ticket_id;
  const message = req.body.message;

  if (message != "") {
    await db.query(
      "INSERT INTO support_message (ticket_id, from_user, body) VALUES (?, 1, ?)",
      [ticket_id, message],
    );
  }

  res.redirect("/tickets/single?id=" + ticket_id);
});

app.get("/feedback", auth, async (req, res) => {
  const [rows] = await db.query(`
    SELECT f.id, f.arrived, c.name AS customer_name, u.fullname AS user_name, u.email, f.guest_name, f.guest_email, f.feedback, f.handled
    FROM feedback f
    LEFT JOIN system_user u ON f.from_user = u.id
    LEFT JOIN customer c ON u.customer_id = c.id
    ORDER BY f.arrived DESC
  `);

  res.render("feedback", {
    title: "Palautteet",
    activePage: "feedback",
    rows,
  });
});

app.get("/users/single", auth, async (req, res) => {
  const id = req.query.id;

  const [rows] = await db.query(
    "SELECT id, fullname, email, admin FROM system_user WHERE id = ?",
    [id],
  );

  res.render("user-single", {
    title: "Käyttäjä",
    activePage: "customers",
    user: rows[0],
  });
});

app.post("/users/single", auth, async (req, res) => {
  const id = req.body.id;
  const fullname = req.body.fullname;
  const email = req.body.email;
  const admin = req.body.admin ? 1 : 0;
  const password = req.body.password;

  if (password && password.trim() !== "") {
    const hash = await bcrypt.hash(password, 10);

    await db.query(
      "UPDATE system_user SET fullname=?, email=?, admin=?, password=? WHERE id=?",
      [fullname, email, admin, hash, id],
    );
  } else {
    await db.query(
      "UPDATE system_user SET fullname=?, email=?, admin=? WHERE id=?",
      [fullname, email, admin, id],
    );
  }

  res.redirect("/users/single?id=" + id);
});

app.listen(PORT, () => {
  console.log("Server running: http://localhost:" + PORT);
});
