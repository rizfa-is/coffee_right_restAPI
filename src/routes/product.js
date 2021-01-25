const express = require('express')
const router = express.Router()

const {
    getAllProduct,
    getAllProductGroupByName,
    getProductByPrId,
    addProduct,
    updateProductByPrId,
    deleteProductByPrId
} = require('../controllers/product')

const uploadImage = require('../middleware/multer')

router.get('/getAllProduct', getAllProduct)
router.get('/getProductByPrId/:prId', getProductByPrId)
router.get('/getAllProductGroupByName', getAllProductGroupByName)
router.post('/addProduct', uploadImage, addProduct)
router.put('/updateProductByPrId/:prId', updateProductByPrId)
router.delete('/deleteProduct/:prId', deleteProductByPrId)

module.exports = router