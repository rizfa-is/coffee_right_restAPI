const { Router } = require('express')

const { getAllProduct, getProductByPrId, addProduct, updateProductByPrId, deleteProductByPrId } = require('../controllers/product')

const router = Router()

router.get('/getAllProduct', getAllProduct)
router.get('/getProductByPrId/:prId', getProductByPrId)

router.post('/addProduct', addProduct)

router.put('/updateProductByPrId/:prId', updateProductByPrId)

router.delete('/deleteProduct/:prId', deleteProductByPrId)

module.exports = router
