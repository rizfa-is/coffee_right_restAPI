const dbConnect = require('../config/db')
const date = require('../helpers/date')

const { createCustomer } = require('./customer')
const { createAdmin } = require('./admin')

module.exports = {
  createAccount: (data) => {
    return new Promise((resolve, reject) => {
      const dataAcc = {
        ac_name: data.ac_name,
        ac_email: data.ac_email,
        ac_phone: data.ac_phone,
        ac_password: data.ac_password,
        ac_level: data.ac_level,
        ac_created_at: date.nowDate()
      }

      const query = `
        INSERT INTO account
                SET ?
      `

      dbConnect.query(query, dataAcc, async (err, res, _fields) => {
        if (!err) {
          if (parseInt(data.ac_level) === 0) {
            await createCustomer(res.insertId)
          } else {
            await createAdmin({
              ac_id: res.insertId
            })
          }

          resolve(res)
        } else {
          reject(err)
        }
      })
    })
  },

  updateAccount: (acId, data) => {
    return new Promise((resolve, reject) => {
      const dataUpdate = {
        ...data,
        ac_updated_at: date.nowDate()
      }
      const query = `
        UPDATE account
           SET ?
         WHERE ac_id = ${acId}
      `

      dbConnect.query(query, dataUpdate, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getAccountById: (acId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM account
         WHERE ?
      `

      dbConnect.query(query, { ac_id: acId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getAccountByEmail: (acEmail) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM account ac
         WHERE ?
      `

      dbConnect.query(query, { ac_email: acEmail }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getAccountByPassword: (acId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM account 
         WHERE ac_id = ${acId}
      `

      dbConnect.query(query, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  deleteAccount: (acId) => {
    return new Promise((resolve, reject) => {
      const query = `
        DELETE FROM account
         WHERE ?
      `

      dbConnect.query(query, { ac_id: acId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
