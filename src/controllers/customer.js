const {
  getAllCustomer,
  getCustomerById,
  updateCustomer
} = require('../models/customer')

const {
  statusGet,
  statusUpdate,
  statusUpdateFail,
  statusServerError,
  statusNotFound
} = require('../helpers/status')

module.exports = {
  getAllCustomer: async (_req, res, _next) => {
    try {
      const result = await getAllCustomer()

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  getCustomerById: async (req, res, _next) => {
    const { csId } = req.params

    try {
      const result = await getCustomerById(csId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  updateCustomer: async (req, res, _next) => {
    const { csId } = req.params

    try {
      const findData = await getCustomerById(csId)

      if (findData.length) {
        req.body.image = req.file === undefined ? findData[0].cs_image : req.file.filename

        const data = {
          ...req.body,
          cs_image: req.body.image
        }

        delete data.image

        const result = await updateCustomer(csId, data)

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
  }
}
