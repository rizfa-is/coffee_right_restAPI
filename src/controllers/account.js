require('dotenv').config()
const bcrypt = require('bcrypt')
const JWT = require('jsonwebtoken')

const {
  createAccount,
  updateAccount,
  getAccountById,
  getAccountByEmail,
  deleteAccount
} = require('../models/account')

const {
  getCustomerByIdAc
} = require('../models/customer')

const {
  getAdminByIdAc
} = require('../models/admin')

const {
  statusGet,
  statusRegistration,
  statusRegistrationFail,
  statusRegistrationUnique,
  statusUpdate,
  statusUpdateFail,
  statusLogin,
  statusLoginFail,
  statusNotFound,
  statusNotFoundAccount,
  statusDelete,
  statusDeleteFail,
  statusServerError,
  statusTokenError
} = require('../helpers/status')

module.exports = {
  createAccount: async (req, res, _next) => {
    try {
      const findData = await getAccountByEmail(req.body.ac_email)

      if (!findData.length) {
        const result = await createAccount(req.body)

        if (result.affectedRows) {
          statusRegistration(res)
        } else {
          statusRegistrationFail(res)
        }
      } else {
        statusRegistrationUnique(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  },

  updateAccount: async (req, res, _next) => {
    try {
      const { acId } = req.params
      const findData = await getAccountById(acId)

      if (findData.length) {
        const result = await updateAccount(acId, req.body)

        if (result.affectedRows) {
          statusUpdate(res)
        } else {
          statusUpdateFail(res)
        }
      } else {
        statusNotFound(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  },

  updateAccountPass: async (req, res, _next) => {
    try {
      const { acId } = req.params
      const findData = await getAccountById(acId)

      if (findData.length) {
        const result = await updateAccount(acId, req.body)

        if (result.affectedRows) {
          statusUpdate(res)
        } else {
          statusUpdateFail(res)
        }
      } else {
        statusNotFound(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  },

  loginAccount: async (req, res, _next) => {
    try {
      const { email, password } = req.body
      const findData = await getAccountByEmail(email)
      if (findData.length) {
        let result

        if (findData[0].ac_level === 0) {
          result = await getCustomerByIdAc(findData[0].ac_id)
        } else {
          result = await getAdminByIdAc(findData[0].ac_id)
        }

        if (result.length) {
          const match = await bcrypt.compare(password, findData[0].ac_password)
          if (match) {
            let payload

            if (findData[0].ac_level === 0) {
              payload = {
                cs_id: result[0].cs_id,
                ac_id: findData[0].ac_id,
                ac_name: findData[0].ac_name,
                ac_level: findData[0].ac_level,
                ac_email: findData[0].ac_email,
                ac_phone: findData[0].ac_phone

              }
            } else {
              payload = {
                ad_id: result[0].ad_id,
                ac_id: findData[0].ac_id,
                ac_name: findData[0].ac_name,
                ac_level: findData[0].ac_level,
                ac_email: findData[0].ac_email,
                ac_phone: findData[0].ac_phone
              }
            }

            JWT.sign({ payload }, process.env.JWT_KEY, { expiresIn: '7d' }, (err, token) => {
              if (token) {
                JWT.verify(token, process.env.JWT_KEY, (_err, data) => {
                  const result = {
                    ...payload,
                    exp: data.exp,
                    token: token
                  }

                  statusLogin(res, result)
                })
              } else {
                statusTokenError(res, err)
              }
            })
          } else {
            statusLoginFail(res)
          }
        } else {
          statusNotFoundAccount(res)
        }
      } else {
        statusNotFoundAccount(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  },

  checkEmail: async (req, res, _next) => {
    try {
      const { email } = req.body
      const result = await getAccountByEmail(email)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFoundAccount(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  },

  detailAccount: async (req, res, _next) => {
    try {
      const { acId } = req.params
      const result = await getAccountById(acId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFoundAccount(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  },

  deleteAccount: async (req, res, _next) => {
    try {
      const { acId } = req.params
      const findData = await getAccountById(acId)

      if (findData.length) {
        const result = await deleteAccount(acId)

        if (result.affectedRows) {
          statusDelete(res)
        } else {
          statusDeleteFail(res)
        }
      } else {
        statusNotFound(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  }
}
