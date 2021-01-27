const stat = require('../helpers/status')
const model = require('../models/order')
const {
  getODByIdOrder
} = require('../models/orderDetail')
const {
  getProductByPrIdModel
} = require('../models/product')
const {
  getDiscountByDcId
} = require('../models/discount')

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
        csId
      } = req.body
      const orAmount = 1
      const orStatus = 'Cart'
      const result = await getProductByPrIdModel(prId)
      const dcId = result[0].dc_id

      const resultDiscount = await getDiscountByDcId(dcId)
      const discount = result[0].pr_unit_price * resultDiscount[0].dc_nominal

      const priceProductWithDiscount = result[0].pr_unit_price - discount
      const orPrice = priceProductWithDiscount * orAmount
      const data = {
        pr_id: prId,
        cs_id: csId,
        or_status: orStatus,
        or_amount: orAmount,
        or_price: orPrice
      }

      if (
        prId.trim() &&
        csId.trim()
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
      const prId = resultSelect[0].pr_id

      const orAmount = resultSelect[0].or_amount + 1

      const result = await getProductByPrIdModel(prId)
      const dcId = result[0].dc_id

      const resultDiscount = await getDiscountByDcId(dcId)
      const discount = result[0].pr_unit_price * resultDiscount[0].dc_nominal

      const priceProductWithDiscount = result[0].pr_unit_price - discount
      const orPrice = priceProductWithDiscount * orAmount

      const data = {
        or_amount: orAmount,
        or_price: orPrice
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
      stat.statusError(res, error)
    }
  },

  updateOdIdByCsIdNStatus: async (req, res) => {
    try {
      const {
        csId
      } = req.params

      const resultSelect = await model.getAllOrderByIdCustomerNStatusCart(csId)

      const orderDetailId = await model.getLastOdIdByCsId(csId)
      const odId = orderDetailId[0].od_id
      const orStatus = 'Done'

      const data = {
        od_id: odId,
        or_status: orStatus
      }

      if (resultSelect.length) {
        const resultUpdate = await model.updateOdIdByCsIdNStatus(csId, data)
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

  updateOrderStatusByOdId: async (req, res) => {
    try {
      const {
        odId
      } = req.params

      const resultSelect = await model.getAllOrderByOdID(odId)

      const orStatus = 'Done'

      const data = {
        or_status: orStatus,
      }

      if (resultSelect.length) {
        const resultUpdate = await model.updateOrderStatusByOdId(odId, data)
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
  },

  historyOrderByOdId: async (req, res) => {
    try {
      const {
        odId
      } = req.params

      const result = await model.historyOrderByOdId(odId)

      if (result.length) {
        stat.statusGet(res, result)
      } else {
        stat.statusNotFound(res)
      }
    } catch (error) {
      stat.statusError(res)
    }
  },

}