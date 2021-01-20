const express = require('express')
const router = express.Router()

const {
  getAllAdmin,
  getAdminById,
  updateAdmin
} = require('../controllers/admin')

const {
  authorization
} = require('../middleware/auth')

const uploadImage = require('../middleware/multer')

router.get('/', authorization, getAllAdmin)
router.get('/detail/:adId', authorization, getAdminById)
router.put('/:adId', authorization, uploadImage, updateAdmin)

module.exports = router
