require('dotenv').config

const stat = require('../helpers/status')
const model = require('../models/orderDetail')
const {
    getProductByPrIdModel
} = require('../models/product')
const {
    getAllOrderByIdCustomerNStatusCart,
    getLastOdIdByCsId
} = require('../models/order')
const {
    getLastDvIdByCsId
} = require('../models/delivery')

module.exports = {

    getAllOrderDetailByCsId: async (req, res) => {
        try {
            const {
                csId
            } = req.params
            const result = await model.getAllOrderDetailByCsIdModel(csId)

            if (result.length) {
                stat.statusGet(res, result)
            } else {
                stat.statusNotFound(res)
            }
        } catch (error) {
            stat.statusError(res)
        }
    },
    getAllODById: async (req, res) => {
        try {
            const {
                odId
            } = req.params

            const result = await model.getOrderDetailByOdId(odId)

            if (result.length) {
                stat.statusGet(res, result)
            } else {
                stat.statusNotFound(res)
            }
        } catch (error) {
            stat.statusError(res)
        }
    },
    createOrderDetail: async (req, res) => {
        try {
            const {
                csId,
                odPaymentMethod,
                odStatus
            } = req.body

            const deliveryId = await getLastDvIdByCsId(csId)
            const dvId = deliveryId[0].dv_id

            // const odStatus = 'Unpaid'

            const listOrderCs = await getAllOrderByIdCustomerNStatusCart(csId)
            let subTotal = 0
            for (let i = 0; i < listOrderCs.length; i++) {
                subTotal += listOrderCs[i].or_price
            }
            const odTax = subTotal * 0.1
            const odTotalPrice = subTotal + odTax

            const data = {
                cs_id: csId,
                dv_id: dvId,
                od_total_price_before_tax: subTotal,
                od_totalPrice: odTotalPrice,
                od_status: odStatus,
                od_payment_method: odPaymentMethod,
                od_tax: odTax
            }

            const result = await model.createOrderDetailModel(data)

            if (csId.trim() && odPaymentMethod.trim()) {
                if (result.affectedRows) {
                    stat.statusCreate(res)
                } else {
                    stat.statusCreateFail(res)
                }
            } else {
                stat.statusMustFillAllFields(res)
            }
        } catch (error) {
            console.log(error)
            stat.statusErrorServer(res)
        }
    },
    updateOrderDetail: async (req, res) => {
        try {
            const {
                odId
            } = req.params

            const data = req.body
            const resultSelect = await model.getOrderDetailByOdId(odId)

            if (resultSelect.length) {
                const resultUpdate = await model.updateOrderDetailModel(data, odId)
                if (resultUpdate.affectedRows) {
                    stat.statusUpdate(res)
                } else {
                    stat.statusFailedUpdate(res)
                }
            } else {
                stat.statusNotFound(res)
            }
        } catch (error) {
            console.log(error)
            stat.statusErrorServer(res)
        }
    },
    historyOrderByCsId: async (req, res) => {
        try {
            const {
                csId
            } = req.params

            const result = await model.getOrderDetailByOdId(odId)

            if (result.length) {
                stat.statusGet(res, result)
            } else {
                stat.statusNotFound(res)
            }
        } catch (error) {
            stat.statusError(res)
        }
    },
    updateDvIdByOdId: async (req, res) => {
        try {
            const {
                csId
            } = req.params

            const orderDetailId = await getLastOdIdByCsId(csId)
            const odId = orderDetailId[0].od_id

            const deliveryId = await getLastDvIdByCsId(csId)
            const delivId = deliveryId[0].dv_id

            const data = {
                dv_id: delivId
            }

            const resultSelect = await model.getOrderDetailByOdId(odId)

            if (resultSelect.length) {
                const resultUpdate = await model.updateOrderDetailModel(data, odId)
                if (resultUpdate.affectedRows) {
                    stat.statusUpdate(res)
                } else {
                    stat.statusFailedUpdate(res)
                }
            } else {
                stat.statusNotFound(res)
            }
        } catch (error) {
            console.log(error)
            stat.statusErrorServer(res)
        }
    },
}