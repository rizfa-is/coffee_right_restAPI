const express = require('express')
const router = express.Router()

const {
    getAllDelivery,
    createDelivery,
    updateDelivery,
    deleteDeliveryByCsId
} = require('../controllers/delivery')

router.get('/', getAllDelivery)
router.post('/create', createDelivery)
router.put('/:dvId', updateDelivery)
router.delete('/deleteDeliveryByCsId/:csId', deleteDeliveryByCsId)

module.exports = router