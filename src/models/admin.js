const dbConnect = require('../helpers/db')

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
          FROM admin cn
          JOIN account ac
            ON ac.ac_id = cn.ac_id
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

  getAdminById: (acId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT cn.ad_id,
               ac.ac_id,
               ac.ac_name,
               cn.ad_admin,
               cn.ad_position,
               cn.ad_field,
               cn.ad_city,
               cn.ad_description,
               cn.ad_instagram,
               cn.ad_linkedin,
               cn.ad_profile
          FROM admin cn
          JOIN account ac
            ON ac.ac_id = cn.ac_id
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

  getAdminByIdAc: (cnId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT cn.ad_id,
               ac.ac_id,
               ac.ac_name,
               cn.ad_admin,
               cn.ad_position,
               cn.ad_field,
               cn.ad_city,
               cn.ad_description,
               cn.ad_instagram,
               cn.ad_linkedin,
               cn.ad_profile
          FROM admin cn
          JOIN account ac
            ON ac.ac_id = cn.ac_id
         WHERE cn.?
      `

      dbConnect.query(query, { ad_id: cnId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  updateAdmin: (cnId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE admin
           SET ?
         WHERE ad_id = ${cnId}
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
