const express = require("express");
const mysql = require("mysql2/promise");
const dotenv = require("dotenv");

dotenv.config();

const app = express();
const PORT = 3000;

app.set("view engine", "ejs");
app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));

const db = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  database: "feedback_support",
});

app.get("/", (req, res) => {
  res.redirect("/customers");
});

app.get("/customers", async (req, res) => {
  const [rows] = await db.query(`
    SELECT c.name AS customer_name, u.fullname, u.email, u.admin
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

app.get("/tickets", async (req, res) => {
  const [rows] = await db.query(`
    SELECT 
      support_ticket.id,
      support_ticket.arrived,
      customer.name AS customer_name,
      support_ticket.description,
      ticket_status.description AS status
    FROM support_ticket
    LEFT JOIN customer ON support_ticket.customer_id = customer.id
    LEFT JOIN ticket_status ON support_ticket.status = ticket_status.id
    ORDER BY support_ticket.arrived DESC
  `);

  res.render("tickets", {
    title: "Tukipyynnöt",
    activePage: "tickets",
    rows,
  });
});

app.get("/tickets/single", async (req, res) => {
  const id = req.query.id;

  const [tickets] = await db.query(
    `
    SELECT 
      support_ticket.id,
      support_ticket.arrived,
      support_ticket.description,
      support_ticket.status,
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

app.post("/tickets/single/status", async (req, res) => {
  const ticket_id = req.body.ticket_id;
  const status = req.body.status;

  await db.query("UPDATE support_ticket SET status = ? WHERE id = ?", [
    status,
    ticket_id,
  ]);

  res.redirect("/tickets/single?id=" + ticket_id);
});

app.post("/tickets/single", async (req, res) => {
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

app.get("/feedback", async (req, res) => {
  const [rows] = await db.query(`
    SELECT f.id, f.arrived, c.name AS customer_name, u.fullname AS user_name, f.feedback
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

app.listen(PORT, () => {
  console.log("Server running: http://localhost:" + PORT);
});
