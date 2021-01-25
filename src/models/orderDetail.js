const dbConnect = require('../config/db')

module.exports = {

  getAllOrderDetailByCsIdModel: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * FROM order_detail WHERE cs_id = '${csId}'
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
  getODByIdOrder: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * FROM order_detail WHERE or_id = '${data}'
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
  getOrderDetailByOdId: (odId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * FROM order_detail WHERE od_id = '${odId}'
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
  addOrderDetailModel: (data) => {
    return new Promise((resolve, reject) => {
      const query = 'INSERT INTO order_detail SET ?'

      dbConnect.query(query, data, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },
  createOrderDetailModel: (data) => {
    return new Promise((resolve, reject) => {
      const query = 'INSERT INTO order_detail SET ?'

      dbConnect.query(query, data, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },
  updateOrderDetailModel: (data, odId) => {
    return new Promise((resolve, reject) => {
      const query = `UPDATE order_detail SET ? WHERE od_id = '${odId}'`

      dbConnect.query(query, data, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  }

}