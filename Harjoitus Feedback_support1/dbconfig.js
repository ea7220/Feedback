const mysql = require("mysql2/promise");

const db = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "sun ei mun",
  database: "feedback",
});

module.exports = db;
