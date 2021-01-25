const stat = require('../helpers/status')
const {
    getAllPaymentModel,
    createPaymentModel,
    updatePaymentModel,
    deletePaymentModel
} = require('../models/payment')

module.exports = {

    getAllPayment: async (req, res) => {
        try {
            const result = await getAllPaymentModel()
      
            if (result.length) {
              stat.statusGet(res, result)
            } else {
              stat.statusNotFound(res)
            }
          } catch (error) {
            stat.statusError(res)
          }
    },

    createPayment: async (req, res) => {
        try {
          if (
            req.body.py_method
          ) {
            const result = await createPaymentModel(req.body)
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

    updatePayment: async (req, res) => {
        try {
          const { pyId } = req.params
          const resultSelect = await getAllPaymentModel()
    
          if (resultSelect.length) {
            const resultUpdate = await updatePaymentModel(pyId, req.body)
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
  
    deletePayment: async (req, res) => {
        try {
          const { pyId } = req.params
          const resultSelect = await getAllPaymentModel()
    
          if (resultSelect.length) {
            const resultDelete = await deletePaymentModel(pyId)
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