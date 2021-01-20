const db = require('../helpers/db')

module.exports = {
  getAllProductModel: () => {
    return new Promise((resolve, reject) => {
      const query = 'SELECT * FROM product'

      db.query(query, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },
  getProductByPrIdModel: (prId) => {
    return new Promise((resolve, reject) => {
      const query = `SELECT * FROM product WHERE pr_id = ${prId}`

      db.query(query, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },
  addProductModel: (data) => {
    return new Promise((resolve, reject) => {
      const query = 'INSERT INTO product SET ?'

      db.query(query, data, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },
  updateProductByPrIdModel: (data, prId) => {
    return new Promise((resolve, reject) => {
      const query = `UPDATE product SET ? WHERE pr_id = ${prId}`

      db.query(query, data, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },
  deleteProductByPrIdModel: (prId) => {
    return new Promise((resolve, reject) => {
      const query = `DELETE FROM product WHERE pr_id = ${prId}`

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
