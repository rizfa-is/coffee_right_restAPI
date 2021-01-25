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

  getAllOrderByIdCustomer: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * FROM order_tb WHERE cs_id = '${data}'
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

  getOrderByIdOrder: (orId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM order_tb
        WHERE or_id = '${orId}'
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

  updateOrder: (orId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE order_tb
           SET ?
         WHERE or_id = '${orId}'
      `

      dbConnect.query(query, data, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          console.log(error);
          reject(error)
        }

      })
    })
  },

  deleteOrder: (orId) => {
    return new Promise((resolve, reject) => {
      const query = `
        DELETE 
        FROM order_tb
         WHERE or_id = '${orId}'
      `

      dbConnect.query(query, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }

}