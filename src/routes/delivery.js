const express = require('express')
const router = express.Router()

const{
    getAllDelivery,
    createDelivery,
    updateDelivery,
    deleteDelivery
} = require('../controllers/delivery')

router.get('/', getAllDelivery)
router.post('/create', createDelivery)
router.put('/:dvId', updateDelivery)
router.delete('/:dvId', deleteDelivery)

module.exports = router