const dbConnect = require('../config/db')

module.exports = {

  createDiscount: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
          INSERT INTO discount
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

  getAllDiscount: () => {
    return new Promise((resolve, reject) => {
      const query = `
            SELECT *
              FROM discount
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

  getDiscountByDcId: (dcId) => {
    return new Promise((resolve, reject) => {
      const query = `
            SELECT *
              FROM discount
              WHERE dc_id = '${dcId}'
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

  updateDiscount: (dcId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
          UPDATE discount
             SET ?
           WHERE dc_id = '${dcId}'
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

  deleteDiscount: (dcId) => {
    return new Promise((resolve, reject) => {
      const query = `
          DELETE 
          FROM discount
           WHERE dc_id = '${dcId}'
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