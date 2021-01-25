const express = require('express')
const router = express.Router()

const {
    getAllODByIdOrder
} = require('../controllers/orderDetail')

router.get('/:orId', getAllODByIdOrder)

module.exports = router