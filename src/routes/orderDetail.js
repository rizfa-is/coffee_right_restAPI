const express = require('express')
const router = express.Router()

const {
    getAllODByIdOrder,
    addOrderDetail,
    createOrderDetail,
    updateOrderDetail,
    getAllOrderDetailByCsId
} = require('../controllers/orderDetail')

router.get('/:orId', getAllODByIdOrder)
router.get('/getAllByCsId', getAllOrderDetailByCsId)

router.post('/add', addOrderDetail)
router.post('/create', createOrderDetail)
router.put('/update/:odId', updateOrderDetail)

module.exports = router