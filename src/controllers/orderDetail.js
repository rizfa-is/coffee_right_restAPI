require('dotenv').config

const stat = require('../helpers/status')
const model = require('../models/orderDetail')
const {
    getProductByPrIdModel
} = require('../models/product')
const {
    getAllOrderByIdCustomer
} = require('../models/order')

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
    getAllODByIdOrder: async (req, res) => {
        try {
            const {
                orId
            } = req.params
            const result = await model.getODByIdOrder(orId)

            if (result.length) {
                stat.statusGet(res, result, orId)
            } else {
                stat.statusNotFound(res)
            }
        } catch (error) {
            stat.statusError(res)
        }
    },
    addOrderDetail: async (req, res) => {
        try {
            const {
                orId,
                csId,
                prId,
                odSize,
                odAmount
            } = req.body

            const result = await getProductByPrIdModel(prId)
            const OdPrice = result[0].pr_unit_price * odAmount

            const data = {
                or_id: orId,
                cs_id: csId,
                pr_id: prId,
                od_size: odSize,
                od_amount: odAmount,
                od_price: OdPrice
            }

            const resultAdd = await model.addOrderDetailModel(data)
            if (resultAdd.affectedRows) {
                stat.statusCreate(res)
            } else {
                stat.statusCreateFail(res)
            }

        } catch (error) {
            console.log(error)
            statusErrorServer(res, error)
        }
    },
    createOrderDetail: async (req, res) => {
        try {
            const {
                csId,
                delivId,
                paymentId,
                odStatus,
                odAddress
            } = req.body

            const listOrderCs = await getAllOrderByIdCustomer(csId)
            let subTotal = 0
            for (let i = 0; i < listOrderCs.length; i++) {
                subTotal += listOrderCs[i].or_price
            }
            const odTax = subTotal * 0.1
            const odTotalPrice = subTotal + odTax

            const data = {
                cs_id: csId,
                dv_id: delivId,
                py_id: paymentId,
                od_totalPrice: odTotalPrice,
                od_status: odStatus,
                od_address: odAddress,
                od_tax: odTax
            }

            const result = await model.createOrderDetailModel(data)

            if (result.affectedRows) {
                stat.statusCreate(res)
            } else {
                stat.statusCreateFail(res)
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
    }
}