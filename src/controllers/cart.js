require('dotenv').config

const stat = require('../helpers/status')
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
    console.log(req.body);
    try {
      if (
        req.body.cs_id &&
        req.body.pr_id &&
        req.body.ca_size &&
        req.body.ca_amount &&
        req.body.ca_price
      ) {
        const result = await model.createCart(req.body)
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
      const resultSelect = await model.getByIdCart(caId)

      if (resultSelect.length) {
        const resultDelete = await model.deleteByIdProduct(caId)
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
