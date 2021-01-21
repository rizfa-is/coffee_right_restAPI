const db = require('../config/db')

module.exports = {
  getByIdCart: (caId) => {
    return new Promise((resolve, reject) => {
      const query = `SELECT * FROM cart WHERE ca_id = ${caId}`

      db.query(query, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },

  getByIdProduct: (prId) => {
    return new Promise((resolve, reject) => {
      const query = `SELECT * FROM cart WHERE pr_id = ${prId}`

      db.query(query, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },

  getAllByIdCustomer: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `SELECT * FROM cart WHERE cs_id = ${csId}`

      db.query(query, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },

  addCart: (data) => {
    return new Promise((resolve, reject) => {
      const query = 'INSERT INTO cart SET ?'

      db.query(query, data, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },

  updateByIdProduct: (data, prId) => {
    return new Promise((resolve, reject) => {
      const query = `UPDATE cart SET ? WHERE pr_id = ${prId}`

      db.query(query, data, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },

  deleteByIdProduct: (prId) => {
    return new Promise((resolve, reject) => {
      const query = `DELETE FROM cart WHERE pr_id = ${prId}`

      db.query(query, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  }
}
