const express = require('express')
const router = express.Router()

const{
    getAllDiscount,
    addDiscount,
    updateDCById,
    deleteDCById
} = require('../controllers/discount')

router.get('/', getAllDiscount)
router.post('/', addDiscount)
router.put('/:dcId', updateDCById)
router.delete('/:dcId', deleteDCById)

module.exports = router
