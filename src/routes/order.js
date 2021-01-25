const express = require('express')
const router = express.Router()

const {
    getAllOrderByCustomer,
    addOrder,
    updateOrderByIdOrder,
    deleteOrder,
    getAllOrder,
    getAllOrderByCustomerNStatusCart
} = require('../controllers/order')

router.get('/', getAllOrder)
router.get('/:csId', getAllOrderByCustomer)
router.get('/statusCart/:csId', getAllOrderByCustomerNStatusCart)

router.post('/addOrder', addOrder)
router.put('/:orId', updateOrderByIdOrder)
router.delete('/:orId', deleteOrder)

module.exports = router