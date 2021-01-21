const dbConnect = require('../config/db')

module.exports = {
  createOrderDetail: (odId) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO customer
                SET ?
      `

      dbConnect.query(query, { od_id: odId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getAllOrderDetail: () => {
    return new Promise((resolve, reject) => {
      const query = `
          SELECT *
            FROM customer cs
            JOIN account ac
              ON ac.od_id = cs.od_id
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

  getOrderDetailByIdAc: (odId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT cs.cs_id,
               ac.od_id,
               ac.ac_name,
               cs.cs_address,
               cs.cs_image
          FROM customer cs
          JOIN account ac
            ON ac.od_id = cs.od_id
         WHERE ac.?
      `

      dbConnect.query(query, { od_id: odId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getOrderDetailById: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT cs.cs_id,
               ac.od_id,
               ac.ac_name,
               cs.cs_address,
               cs.cs_image
          FROM customer cs
          JOIN account ac
            ON ac.od_id = cs.od_id
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

  updateOrderDetail: (csId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE customer
           SET ?
         WHERE cs_id = ${csId}
      `

      dbConnect.query(query, data, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
