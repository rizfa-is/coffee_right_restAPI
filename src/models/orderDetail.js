const dbConnect = require('../config/db')

module.exports = {
  
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

}
