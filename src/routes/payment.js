const express = require('express')
const router = express.Router()

const{
    getAllPayment,
    createPayment,
    updatePayment,
    deletePayment
} = require('../controllers/payment')

router.get('/', getAllPayment)
router.post('/create', createPayment)
router.put('/:pyId', updatePayment)
router.delete('/:pyId', deletePayment)

module.exports = router