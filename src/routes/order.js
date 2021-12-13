const express = require('express')
const router = express.Router()

const {
    getAllOrderByCustomer,
    addOrder,
    updateOrderByIdOrder,
    deleteOrder,
    getAllOrder,
    getAllOrderByCustomerNStatusCart,
    updateOdIdByCsIdNStatus,
    updateOrderStatusByOdId,
    updateOrderByIdOrderMin,
    historyOrderByOdId
} = require('../controllers/order')

router.get('/', getAllOrder)
router.get('/:csId', getAllOrderByCustomer)
router.get('/statusCart/:csId', getAllOrderByCustomerNStatusCart)
router.get('/historyOrderByOdId/:odId', historyOrderByOdId)

router.post('/addOrder', addOrder)

router.put('/updateOrder/:orId', updateOrderByIdOrder)
router.put('/updateOrderMin/:orId', updateOrderByIdOrderMin)
router.put('/updateOdIdByCsId/:csId', updateOdIdByCsIdNStatus)
router.put('/updateOrderStatusByOdId/:odId', updateOrderStatusByOdId)

router.delete('/deleteOrder/:orId', deleteOrder)

module.exports = router