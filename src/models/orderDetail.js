const dbConnect = require('../config/db')

module.exports = {
  
  getODByIdOrder: (orId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT 
               od.od_id,
               or.or_id,
               od.od_size,
               od.od_amount,
               od.od_price
          FROM order_detail od
          JOIN order or
            ON od.od_id = or.od_id
         WHERE or.?
      `

      dbConnect.query(query, { or_id: orId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

}
