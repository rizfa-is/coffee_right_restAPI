const express = require('express')
const router = express.Router()

const{
    getAllOrderByCustomer,
    addOrder,
    updateOrderByIdOrder,
    deleteOrder,
    getAllOrder
} = require('../controllers/order')

router.get('/', getAllOrder)
router.get('/:csId', getAllOrderByCustomer)
router.post('/', addOrder)
router.put('/:orId', updateOrderByIdOrder)
router.delete('/:orId', deleteOrder)

module.exports = router
