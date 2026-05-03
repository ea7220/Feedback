const mysql = require("mysql2/promise");

const db = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "B0p4oqz9",
  database: "feedback",
});

module.exports = db;
