const stat = require('../helpers/status')
const model = require('../models/order')
const {
  getODByIdOrder
} = require('../models/orderDetail')
const {
  getProductByPrIdModel
} = require('../models/product')

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
      const {
        csId
      } = req.params
      const result = await model.getAllOrderByIdCustomer(csId)

      if (result.length) {
        stat.statusGet(res, result)
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      stat.statusError(res)
    }
  },

  getAllOrderByCustomerNStatusCart: async (req, res) => {
    try {
      const {
        csId
      } = req.params
      const result = await model.getAllOrderByIdCustomerNStatusCart(csId)

      if (result.length) {
        stat.statusGet(res, result)
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      stat.statusErrorServer(res)
    }
  },

  addOrder: async (req, res) => {
    try {
      const {
        prId,
        csId,
        orStatus,
        orAmount
      } = req.body
      const result = await getProductByPrIdModel(prId)
      const orPrice = result[0].pr_unit_price * orAmount
      const orSize = result[0].pr_size
      const data = {
        pr_id: prId,
        cs_id: csId,
        or_status: orStatus,
        or_size: orSize,
        or_amount: orAmount,
        or_price: orPrice
      }

      if (
        prId.trim() &&
        csId.trim() &&
        orStatus.trim() &&
        orSize.trim() &&
        orAmount.trim()
      ) {
        const result = await model.createOrder(data)
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
      const {
        orId
      } = req.params
      const resultSelect = await model.getOrderByIdOrder(orId)

      const {
        orDt,
        orYn,
        orSt,
        orStatus,
        orAddress,
        orMethod,
        csId
      } = req.body

      const listOrderDetailCs = await getODByIdOrder(orId)
      let subTotal = 0
      for (let i = 0; i < listOrderDetailCs.length; i++) {
        subTotal += listOrderDetailCs[i].od_price
      }

      const orTax = subTotal * 0.1
      const orTotal = subTotal + orTax

      const data = {
        or_dt: orDt,
        or_yn: orYn,
        or_st: orSt,
        or_status: orStatus,
        or_address: orAddress,
        or_method: orMethod,
        or_tax: orTax,
        or_total: orTotal,
        cs_id: csId
      }

      if (resultSelect.length) {
        const resultUpdate = await model.updateOrder(orId, data)
        if (resultUpdate.affectedRows) {
          stat.statusUpdate(res, resultUpdate)
        } else {
          stat.statusUpdateFail(res)
        }
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      console.log(error)
      stat.statusError(res, error)
    }
  },

  deleteOrder: async (req, res) => {
    try {
      const {
        orId
      } = req.params
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