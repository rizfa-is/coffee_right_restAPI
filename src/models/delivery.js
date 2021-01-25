const db = require('../config/db')

module.exports = {
    getAllDeliveryModel: () => {
        return new Promise((resolve, reject) => {
            const query = `
                SELECT * 
                FROM delivery
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

    createDeliveryModel: (data) => {
        return new Promise((resolve, reject) => {
          const query = `
            INSERT INTO delivery
                    SET ?
          `
    
          db.query(query, data, (error, result, _fields) => {
            if (!error) {
              resolve(result)
            } else {
              reject(error)
            }
          })
        })
      },

    updateDeliveryModel: (dvId, data) => {
        return new Promise((resolve, reject) => {
          const query = `
            UPDATE delivery
               SET ?
             WHERE dv_id = '${dvId}'
          `
    
          db.query(query, data, (error, result, _fields) => {
            if (!error) {
              resolve(result)
            } else {
              reject(error)
            }
    
          })
        })
    },
    
    deleteDeliveryModel: (dvId) => {
        return new Promise((resolve, reject) => {
          const query = `
            DELETE 
            FROM delivery
            WHERE dv_id = '${dvId}'
          `
    
          db.query(query, (error, result, _fields) => {
            if (!error) {
              resolve(result)
            } else {
              reject(error)
            }
          })
        })
    }
}