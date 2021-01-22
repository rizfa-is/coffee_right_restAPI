const express = require('express')
const router = express.Router()

const{
    getAllOrderByCustomer,
    addOrder,
    updateOrderByIdOrder,
    deleteOrderByIdCart
} = require('../controllers/order')

router.get('/:csId', getAllOrderByCustomer)
router.post('/', addOrder)
router.put('/:orId', updateOrderByIdOrder)
router.delete('/:caId', deleteOrderByIdCart)

module.exports = router
