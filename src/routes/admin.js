const express = require('express')
const router = express.Router()

const {
  getAllCompany,
  getCompanyById,
  updateCompany
} = require('../controllers/admin')

const {
  authorization
} = require('../middleware/auth')

const uploadImage = require('../middleware/multer')

router.get('/', authorization, getAllCompany)
router.get('/detail/:cnId', authorization, getCompanyById)
router.put('/:cnId', authorization, uploadImage, updateCompany)

module.exports = router
