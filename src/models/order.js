const dbConnect = require('../config/db')

module.exports = {
  createOrder: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO order_tb
                SET ?
      `

      dbConnect.query(query, data, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getAllOrder: () => {
    return new Promise((resolve, reject) => {
      const query = `
          SELECT *
            FROM order_tb
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

  getOrderByIdCostumer: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM order_tb or
          JOIN customer cs
            ON cs.cs_id = or.cs_id
         WHERE cs.?
      `

      dbConnect.query(query, { cs_id: csId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  updateOrder: (orId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE order_tb
           SET ?
         WHERE or_id = ${orId}
      `

      dbConnect.query(query, data, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },
  deleteOrder: (orId) => {
    return new Promise((resolve, reject) => {
      const query = `
        DELETE order_tb
         WHERE ?
      `

      dbConnect.query(query, { or_id : orId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
