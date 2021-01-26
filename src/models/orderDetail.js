const dbConnect = require('../config/db')

module.exports = {

  getAllOrderDetailByCsIdModel: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * FROM order_detail WHERE cs_id = ${csId}
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
      const query = `UPDATE order_detail SET ? WHERE od_id = ${odId}`

      dbConnect.query(query, data, (err, result, fields) => {
        if (!err) {
          resolve(result)
        } else {
          reject(new Error(err))
        }
      })
    })
  },
  historyOrderByCsId: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * FROM od order_detail join or order_tb 
      WHERE cs_id = '${csId}'
      ORDER BY od.created_at ASC
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