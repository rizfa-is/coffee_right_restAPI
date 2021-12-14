const db = require('../config/db')
const date = require('../helpers/date')

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

  getLastDvIdByCsId: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
      SELECT * FROM delivery
      WHERE dv_id = (SELECT MAX(dv_id) FROM delivery)
      AND cs_id = '${csId}'
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
      const newData = {
        ...data,
        dv_created_at: date.nowDate()
      }
      const query = `
            INSERT INTO delivery
                    SET ?
          `

      db.query(query, newData, (error, result, _fields) => {
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
      const newData = {
        ...data,
        dv_updated_at: date.nowDate()
      }
      const query = `
            UPDATE delivery
               SET ?
             WHERE dv_id = '${dvId}'
          `

      db.query(query, newData, (error, result, _fields) => {
        if (!error) {
          resolve(result)
        } else {
          reject(error)
        }

      })
    })
  },

  deleteDeliveryByCsIdModel: (csId) => {
    return new Promise((resolve, reject) => {
      const query = `
      DELETE FROM delivery 
      WHERE dv_id IN (SELECT * FROM (SELECT MAX(dv_id) FROM delivery) AS something) 
      AND cs_id = '${csId}'
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