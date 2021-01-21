const express = require('express')
const router = express.Router()

const{
    getAllByCustomer,
    addCart,
    updateByIdProduct,
    deleteByIdProduct
} = require('../controllers/cart')

router.get('/:csId', getAllByCustomer)
router.post('/', addCart)
router.put('/:prId', updateByIdProduct)
router.delete('/:caId', deleteByIdProduct)

module.exports = router
