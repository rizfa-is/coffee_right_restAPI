const stat = require('../helpers/status')
const model = require('../models/order')

module.exports = {

  getAllOrder: async (req, res) => {
    try {
      const result = await model.getAllOrder()

      if (result.length) {
        stat.statusGet(res, result)
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      stat.statusError(res)
    }
  },

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
          req.body.pr_id &&
          req.body.cs_id &&
          req.body.or_status &&
          req.body.or_size &&
          req.body.or_amount &&
          req.body.or_price 
        ) {
          const result = await model.createOrder(req.body)
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

  updateOrderByIdOrder: async (req, res) => {
      try {
        const { orId } = req.params
        const resultSelect = await model.getAllOrder(orId)
  
        if (resultSelect.length) {
          const resultUpdate = await model.updateOrder( orId, req.body)
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

  deleteOrder: async (req, res) => {
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