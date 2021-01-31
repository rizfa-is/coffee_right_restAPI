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

  getAllOrderByIdCustomer: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * FROM order_tb WHERE cs_id = '${csId}'
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

  getAllOrderByIdCustomerNStatusCart: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * from order_tb join product on order_tb.pr_id = product.pr_id WHERE order_tb.cs_id = '${csId}' AND order_tb.or_status = 'Cart'
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

  getAllOrderByOdID: (odId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * FROM order_tb WHERE od_id = '${odId}' && or_status = 'Cart'
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
        WHERE or_id = ${orId}
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
        WHERE or_id = '${orId}' && or_status = 'Cart'
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
         WHERE or_id = '${orId}' && or_status = 'Cart'
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

  updateOdIdByCsIdNStatus: (csId, odId) => {
    return new Promise((resolve, reject) => {
      const query = `
      UPDATE order_tb
      SET ?
      WHERE cs_id = '${csId}' && or_status = 'Cart'
      `

      dbConnect.query(query, odId, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getLastOdIdByCsId: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * FROM order_detail
      WHERE od_id = (SELECT MAX(od_id) FROM order_detail)
      AND cs_id = ${csId}
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

  updateOrderStatusByOdId: (odId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE order_tb
          SET ?
        WHERE od_id = '${odId}'
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

  historyOrderByOdId: (odId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT p.pr_name, o.or_price, od.od_status, o.or_amount 
      FROM order_tb o join product p on o.pr_id = p.pr_id
      join order_detail od on o.od_id = od.od_id
      WHERE o.od_id = '${odId}' AND o.or_status = 'Done'
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

}