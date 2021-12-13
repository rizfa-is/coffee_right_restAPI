const express = require('express')
const router = express.Router()

const {
  getAllCustomer,
  getCustomerById,
  updateCustomer
} = require('../controllers/customer')

const {
  authorization
} = require('../middleware/auth')

const uploadImage = require('../middleware/multer')

router.get('/', authorization, getAllCustomer)
router.get('/detail/:csId', authorization, getCustomerById)
router.put('/:csId', authorization, uploadImage, updateCustomer)

module.exports = router
