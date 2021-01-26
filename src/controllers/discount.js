require('dotenv').config

const stat = require('../helpers/status')
const model = require('../models/discount')

module.exports = {

  getAllDiscount: async (req, res) => {
    try {
      const result = await model.getAllDiscount()

      if (result.length) {
        stat.statusGet(res, result)
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      stat.statusError(res)
    }
  },

  addDiscount: async (req, res) => {
    try {
      if (
        req.body.dc_nominal
      ) {
        const result = await model.createDiscount(req.body)
        if (result.affectedRows) {
          stat.statusCreate(res, result)
        } else {
          stat.statusNotFound(res, result)
        }
      } else {
        stat.statusMustFillAllFields(res)
      }
    } catch (error) {
      stat.statusError(res, error)
    }
  },

  updateDCById: async (req, res) => {
    try {
      const {
        dcId
      } = req.params
      const resultSelect = await model.getAllDiscount(dcId)
      if (resultSelect.length) {
        const resultUpdate = await model.updateDiscount(dcId, req.body)
        if (resultUpdate.affectedRows) {
          stat.statusUpdate(res, resultUpdate)
        } else {
          stat.statusUpdateFail(res)
        }
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      console.log(error);
      stat.statusError(res, error)
    }
  },

  deleteDCById: async (req, res) => {
    try {
      const {
        dcId
      } = req.params
      const resultSelect = await model.getAllDiscount(dcId)

      if (resultSelect.length) {
        const resultDelete = await model.deleteDiscount(dcId)
        if (resultDelete.affectedRows) {
          stat.statusDelete(res)
        } else {
          stat.statusDeleteFail(res)
        }
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      stat.statusServerError(res, error)
    }
  }

}