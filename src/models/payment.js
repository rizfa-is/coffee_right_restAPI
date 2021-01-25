const db = require('../config/db')

module.exports = {
    getAllPaymentModel: () => {
        return new Promise((resolve, reject) => {
            const query = `
                SELECT * 
                FROM payment
            `

            db.query(query, (error, result, field) => {
                if (!error) {
                    resolve(result)
                } else {
                    reject(error)
                }
            })
        })
    },

    createPaymentModel: (data) => {
        return new Promise((resolve, reject) => {
          const query = `
            INSERT INTO payment
                    SET ?
          `
    
          db.query(query, data, (error, results, _fields) => {
            if (!error) {
              resolve(results)
            } else {
              reject(error)
            }
          })
        })
      },

    updatePaymentModel: (pyId, data) => {
        return new Promise((resolve, reject) => {
          const query = `
            UPDATE payment
               SET ?
             WHERE py_id = '${pyId}'
          `
    
          db.query(query, data, (error, results, _fields) => {
            if (!error) {
              resolve(results)
            } else {
            console.log(error);
              reject(error)
            }
    
          })
        })
    },
    
    deletePaymentModel: (pyId) => {
        return new Promise((resolve, reject) => {
          const query = `
            DELETE 
            FROM payment
            WHERE py_id = '${pyId}'
          `
    
          db.query(query, (error, results, _fields) => {
            if (!error) {
              resolve(results)
            } else {
              reject(error)
            }
          })
        })
    }
}