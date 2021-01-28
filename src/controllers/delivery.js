const stat = require('../helpers/status')
const {
  getAllDeliveryModel,
  createDeliveryModel,
  updateDeliveryModel,
  deleteDeliveryByCsIdModel
} = require('../models/delivery')

module.exports = {

  getAllDelivery: async (req, res) => {
    try {
      const result = await getAllDeliveryModel()

      if (result.length) {
        stat.statusGet(res, result)
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      stat.statusError(res)
    }
  },

  createDelivery: async (req, res) => {
    try {
      if (
        req.body.dv_dt &&
        req.body.dv_yn &&
        req.body.dv_st &&
        req.body.dv_address
      ) {
        const result = await createDeliveryModel(req.body)
        if (result.affectedRows) {
          stat.statusCreate(res)
        } else {
          stat.statusNotFound(res)
        }
      } else {
        stat.statusMustFillAllFields(res)
      }
    } catch (error) {
      stat.statusError(res, error)
    }

  },

  updateDelivery: async (req, res) => {
    try {
      const {
        dvId
      } = req.params
      const resultSelect = await getAllDeliveryModel()

      if (resultSelect.length) {
        const resultUpdate = await updateDeliveryModel(dvId, req.body)
        if (resultUpdate.affectedRows) {
          stat.statusUpdate(res, resultUpdate)
        } else {
          stat.statusUpdateFail(res)
        }
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      stat.statusError(res, error)
    }

  },

  deleteDeliveryByCsId: async (req, res) => {
    try {
      const {
        csId
      } = req.params
      const resultSelect = await getAllDeliveryModel()

      if (resultSelect.length) {
        const resultDelete = await deleteDeliveryByCsIdModel(csId)
        if (resultDelete.affectedRows) {
          stat.statusDelete(res)
        } else {
          stat.statusDeleteFail(res)
        }
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      console.log(error);
      stat.statusServerError(res, error)
    }
  }
}