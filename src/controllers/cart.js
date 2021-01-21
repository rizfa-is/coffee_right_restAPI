const { statusError } = require('../helpers/status')
const stat = require('../helpers/status')
const { getByIdProduct, deleteByIdProduct } = require('../models/cart')
const model = require('../models/cart')

module.exports = {
  getAllByCustomer: async (req, res) => {
    try {
      const { csId } = req.params
      const result = await model.getAllByIdCustomer(csId)

      if (result.length) {
        stat.statusGet(res, result, csId)
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      stat.statusError(res)
    }
  },
  addCart: async (req, res) => {
    try {
      if (
        req.body.cs_id.trim() &&
        req.body.pr_id.trim() &&
        req.body.ca_size.trim() &&
        req.body.ca_amount.trim() &&
        req.body.ca_price.trim()
      ) {
        const result = await model.addCart(req.body)
        if (result.affectedRows) {
          stat.statusGet(res, result)
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
  updateByIdProduct: async (req, res) => {
    try {
      const { prId } = req.params
      const data = req.body
      const resultSelect = await model.getByIdProduct(prId)

      if (resultSelect.length) {
        const resultUpdate = await model.updateByIdProduct(data, prId)
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
  deleteByIdCart: async (req, res) => {
    try {
      const { caId } = req.params
      const resultSelect = await getByIdCart(caId)

      if (resultSelect.length) {
        const resultDelete = await deleteByIdCart(caId)
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
