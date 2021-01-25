<<<<<<< HEAD
// require('dotenv').config

=======
>>>>>>> feature-fixdb
const stat = require('../helpers/status')
const model = require('../models/order')
const { getODByIdOrder } = require('../models/orderDetail')

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
<<<<<<< HEAD
    try {
      const { csId } = req.params
      const result = await model.getAllOrderByIdCostumer(csId)

      if (result.length) {
        stat.statusGet(res, result, csId)
      } else {
        stat.statusNotFound(res)
=======
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
>>>>>>> feature-fixdb
      }
    } catch (error) {
      stat.statusError(res)
    }
  },

  addOrder: async (req, res) => {
<<<<<<< HEAD
    try {
      if (
        req.body.cs_id &&
          req.body.or_dt &&
          req.body.or_yn &&
          req.body.or_st &&
          req.body.or_status &&
          req.body.or_address &&
          req.body.or_method &&
          req.body.or_tax &&
          req.body.or_total
      ) {
        const result = await model.createOrder(req.body)
        if (result.affectedRows) {
          stat.statusCreate(res, result)
=======
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
>>>>>>> feature-fixdb
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
<<<<<<< HEAD
    try {
      const { orId } = req.params
      const resultSelect = await model.getOrderByIdOrder(orId)

      const { orDt, orYn, orSt, orStatus, orAddress, orMethod, csId} = req.body
      
      const listOrderDetailCs = await getODByIdOrder(orId)
      let subTotal = 0
      for(let i = 0; i < listOrderDetailCs.length; i++) {
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
=======
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
>>>>>>> feature-fixdb
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
      const { orId } = req.params
      const resultSelect = await model.getAllOrder(orId)

<<<<<<< HEAD
      if (resultSelect.length) {
        const resultDelete = await model.deleteOrder(orId)
        if (resultDelete.affectedRows) {
          stat.statusDelete(res)
=======
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
>>>>>>> feature-fixdb
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
