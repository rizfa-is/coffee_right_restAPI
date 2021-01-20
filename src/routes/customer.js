const express = require('express')
const router = express.Router()

const {
  getAllCustomer,
  getCustomerById,
  getFilterCustomer,
  updateCustomer
} = require('../controllers/customer')

const {
  authorization
} = require('../middleware/auth')

const uploadImage = require('../middleware/multer')

router.get('/', authorization, getAllCustomer)
router.get('/detail/:enId', authorization, getCustomerById)
router.get('/filter', authorization, getFilterCustomer)
router.put('/:enId', authorization, uploadImage, updateCustomer)

module.exports = router
