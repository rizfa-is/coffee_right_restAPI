const dbConnect = require('../config/db')

module.exports = {
  createCustomer: (acId) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO customer
                SET ?
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

  getAllCustomer: () => {
    return new Promise((resolve, reject) => {
      const query = `
          SELECT *
            FROM customer cs
            JOIN account ac
              ON ac.ac_id = cs.ac_id
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

  getCustomerByIdAc: (acId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT cs.cs_id,
               ac.ac_id,
               ac.ac_name,
               cs.cs_address,
               cs.cs_image
          FROM customer cs
          JOIN account ac
            ON ac.ac_id = cs.ac_id
         WHERE ac.?
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

  getCustomerById: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT cs.cs_id,
               ac.ac_id,
               ac.ac_name,
               cs.cs_address,
               cs.cs_image
          FROM customer cs
          JOIN account ac
            ON ac.ac_id = cs.ac_id
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

  updateCustomer: (csId, data) => {
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
