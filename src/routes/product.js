const express = require('express')
const router = express.Router()

const { 
    getAllProduct, 
    getProductByPrId, 
    addProduct, 
    updateProductByPrId, 
    deleteProductByPrId 
} = require('../controllers/product')


router.get('/getAllProduct', getAllProduct)
router.get('/getProductByPrId/:prId', getProductByPrId)
router.post('/addProduct', addProduct)
router.put('/updateProductByPrId/:prId', updateProductByPrId)
router.delete('/deleteProduct/:prId', deleteProductByPrId)

module.exports = router
