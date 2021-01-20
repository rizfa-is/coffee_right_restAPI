const {
  getAllAdmin,
  getAdminById,
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
    const { adId } = req.params

    try {
      const result = await getAdminById(adId)

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
    const { adId } = req.params

    try {
      const findData = await getAdminById(adId)

      if (findData.length) {
        req.body.image = req.file === undefined ? findData[0].ad_image : req.file.filename

        const data = {
          ...req.body,
          ad_image: req.body.image
        }

        delete data.image

        const result = await updateAdmin(adId, data)

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
