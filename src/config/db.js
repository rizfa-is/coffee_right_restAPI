require('dotenv').config()
const mysql = require('mysql2/promise')

const insertIntoDB = async () => {
  const conn = await mysql.createConnection({
    host: "sql4.freesqldatabase.com",
    user: "sql4458514",
    password: "fb89HRcPMx",
    database: "sql4458514",
    port: 3306,
  })

  try {
    await conn.query(
      "SELECT * FROM account"
    )

    console.log('Database Coffee Right connected')
  } catch (error) {
    console.log(error)
  }
}

insertIntoDB()


module.exports = insertIntoDB.conn
