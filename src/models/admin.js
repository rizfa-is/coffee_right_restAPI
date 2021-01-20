const dbConnect = require('../config/db')

module.exports = {
  createAdmin: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO admin
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
      const query = `
        UPDATE admin
           SET ?
         WHERE ad_id = ${adId}
      `

      dbConnect.query(query, data, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
