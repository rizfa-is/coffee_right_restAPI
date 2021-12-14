const dbConnect = require('../config/db')
const date = require('../helpers/date')

module.exports = {
  createAdmin: (data) => {
    return new Promise((resolve, reject) => {
      const newData = {
        ...data,
        ad_created_at: date.nowDate()
      }
      const query = `
        INSERT INTO admin
                SET ?
      `

      dbConnect.query(query, newData, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getAllAdmin: () => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM admin ad
          JOIN account ac
            ON ac.ac_id = ad.ac_id
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

  getAdminByIdAc: (acId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT ad.ad_id,
               ad.ad_image,
               ac.ac_id,
               ac.ac_name,
               ac.ac_phone
          FROM admin ad
          JOIN account ac
            ON ac.ac_id = ad.ac_id
         WHERE ac.?
      `

      dbConnect.query(query, { ac_id: acId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getAdminById: (adId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT ad.ad_id,
               ad.ad_image,
               ac.ac_id,
               ac.ac_name
          FROM admin ad
          JOIN account ac
            ON ac.ac_id = ad.ac_id
         WHERE ad.?
      `

      dbConnect.query(query, { ad_id: adId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  updateAdmin: (adId, data) => {
    return new Promise((resolve, reject) => {
      const newData = {
        ...data,
        ad_updated_at: date.nowDate()
      }
      const query = `
        UPDATE admin
           SET ?
         WHERE ad_id = ${adId}
      `

      dbConnect.query(query, newData, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
