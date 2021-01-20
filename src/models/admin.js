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
        SELECT cn.cn_id,
               ac.ac_id,
               ac.ac_name,
               cn.cn_admin,
               cn.cn_position,
               cn.cn_field,
               cn.cn_city,
               cn.cn_description,
               cn.cn_instagram,
               cn.cn_linkedin,
               cn.cn_profile
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
        SELECT cn.cn_id,
               ac.ac_id,
               ac.ac_name,
               cn.cn_admin,
               cn.cn_position,
               cn.cn_field,
               cn.cn_city,
               cn.cn_description,
               cn.cn_instagram,
               cn.cn_linkedin,
               cn.cn_profile
          FROM admin cn
          JOIN account ac
            ON ac.ac_id = cn.ac_id
         WHERE cn.?
      `

      dbConnect.query(query, { cn_id: cnId }, (error, results, _fields) => {
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
         WHERE cn_id = ${cnId}
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
