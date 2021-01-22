require('dotenv').config

const stat = require('../helpers/status')
const model = require('../models/order')

module.exports = {
    getAllOrderByCustomer: async (req, res) => {
      try {
        const { csId } = req.params
        const result = await model.getAllOrderByIdCostumer(csId)
  
        if (result.length) {
          stat.statusGet(res, result, csId)
        } else {
          stat.statusNotFound(res)
        }
      } catch (error) {
        stat.statusError(res)
      }
    },

    addOrder: async (req, res) => {
      try {
        if (
          req.body.or_id.trim() &&
          req.body.cs_id.trim() &&
          req.body.or_dt.trim() &&
          req.body.or_yn.trim() &&
          req.body.or_st.trim() &&
          req.body.or_status.trim() &&
          req.body.or_address.trim() &&
          req.body.or_method.trim() &&
          req.body.or_tax.trim() &&
          req.body.or_total.trim()
        ) {
          const result = await model.createOrder(req.body)
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

    updateOrderByIdOrder: async (req, res) => {
      try {
        const { orId } = req.params
        const data = req.body
        const resultSelect = await model.getAllOrder(orId)
  
        if (resultSelect.length) {
          const resultUpdate = await model.updateByIdOrder(data, orId)
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

    deleteOrderByIdCart: async (req, res) => {
      try {
        const { orId } = req.params
        const resultSelect = await model.getAllOrder(orId)
  
        if (resultSelect.length) {
          const resultDelete = await model.deleteOrder(orId)
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