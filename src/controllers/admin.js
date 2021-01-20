const {
  getAllAdmin,
  getAdminById,
  getAdminByIdAc,
  updateAdmin
} = require('../models/admin')

const {
  statusGet,
  statusUpdate,
  statusUpdateFail,
  statusServerError,
  statusNotFound
} = require('../helpers/status')

module.exports = {
  getAllAdmin: async (_req, res, _next) => {
    try {
      const result = await getAllAdmin()

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  getAdminById: async (req, res, _next) => {
    const { cnId } = req.params

    try {
      const result = await getAdminById(cnId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  updateAdmin: async (req, res, _next) => {
    const { cnId } = req.params

    try {
      const findData = await getAdminByIdAc(cnId)

      if (findData.length) {
        req.body.image = req.file === undefined ? findData[0].ad_profile : req.file.filename

        const data = {
          ...req.body,
          ad_profile: req.body.image
        }

        delete data.image

        const result = await updateAdmin(cnId, data)

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
