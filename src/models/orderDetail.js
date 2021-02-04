const dbConnect = require('../config/db')

const {
  historyOrderByOdId
} = require('../models/order')

module.exports = {

  getAllOrderDetail: () => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * FROM order_detail
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

  getAllOrderDetailByCsIdModel: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT od.od_id, od.cs_id, dv.dv_dt, dv.dv_address, od.od_total_price_before_tax, od.od_totalPrice, ac.ac_name, ac.ac_email, ac.ac_phone,
      od.od_transaction_id, od.od_status, od.od_payment_method, od.od_tax, od.od_created_at, od.od_updated_at FROM order_detail od 
      JOIN order_tb o ON (od.od_id = o.od_id)
      JOIN product pr ON (o.pr_id = pr.pr_id)
      JOIN delivery dv ON (od.dv_id = dv.dv_id)
      JOIN customer cs ON (od.cs_id = cs.cs_id)
      JOIN account ac ON (ac.ac_id = cs.ac_id)
      GROUP BY od.cs_id
      WHERE od.cs_id = '${csId}'
      `

      dbConnect.query(query, async (error, results, _fields) => {
        if (!error) {
          const data = []

          for (let i = 0; i < results.length; i++) {
            const item = results[i]

            const order = await historyOrderByOdId(item.od_id)

            data[i] = {
              od_id: item.od_id,
              cs_id: item.cs_id,
              dv_dt: item.dv_dt,
              cs_name: item.ac_name,
              cs_email: item.ac_email,
              cs_phone: item.ac_phone,
              dv_address: item.dv_address,
              od_total_price_before_tax: item.od_total_price_before_tax,
              od_transaction_id: item.od_transaction_id,
              od_total_price: item.od_totalPrice,
              od_status: item.od_status,
              od_payment_method: item.od_payment_method,
              od_tax: item.od_tax,
              od_created_at: item.od_created_at,
              od_updated_at: item.od_updated_at,
              product_order: order
            }
            i++
          }
          resolve(data)
        } else {
          console.log(error);
          reject(error)
        }
      })
    })
  },

  getAllOrderDetailWithOrderByOdIdModel: (odId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT od.od_id, od.cs_id, dv.dv_dt, dv.dv_address, od.od_total_price_before_tax, od.od_totalPrice, ac.ac_name, ac.ac_email, ac.ac_phone,
      od.od_transaction_id, od.od_status, od.od_payment_method, od.od_tax, od.od_created_at, od.od_updated_at FROM order_detail od 
      JOIN order_tb o ON (od.od_id = o.od_id)
      JOIN product pr ON (o.pr_id = pr.pr_id)
      JOIN delivery dv ON (od.dv_id = dv.dv_id)
      JOIN customer cs ON (od.cs_id = cs.cs_id)
      JOIN account ac ON (ac.ac_id = cs.ac_id)
      WHERE od.od_id = ${odId}
      `

      dbConnect.query(query, async (error, results, _fields) => {
        if (!error) {
          const data = []

          for (let i = 0; i < results.length; i++) {
            const item = results[i]

            const order = await historyOrderByOdId(item.od_id)

            data[i] = {
              od_id: item.od_id,
              cs_id: item.cs_id,
              dv_dt: item.dv_dt,
              cs_name: item.ac_name,
              cs_email: item.ac_email,
              cs_phone: item.ac_phone,
              dv_address: item.dv_address,
              od_total_price_before_tax: item.od_total_price_before_tax,
              od_transaction_id: item.od_transaction_id,
              od_total_price: item.od_totalPrice,
              od_status: item.od_status,
              od_payment_method: item.od_payment_method,
              od_tax: item.od_tax,
              od_created_at: item.od_created_at,
              od_updated_at: item.od_updated_at,
              product_order: order
            }
            i++
          }
          resolve(data)
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
  },
  deleteOrderDetail: (odId) => {
    return new Promise((resolve, reject) => {
      const query = `
        DELETE 
        FROM order_detail
         WHERE od_id = '${odId}' 
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