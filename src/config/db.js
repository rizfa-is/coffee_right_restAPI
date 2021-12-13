require('dotenv').config()
const mysql = require('mysql')

const conn = mysql.createConnection({
  host: "sql4.freesqldatabase.com",
  user: "sql4458514",
  password: "fb89HRcPMx",
  database: "sql4458514",
  port: 3306,
})

conn.connect(err => {
  if (err) {
    console.error(err)
  } else {
    console.log('Database Coffee Right connected')
  }
})

module.exports = conn
