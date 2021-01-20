const express = require('express')
const router = express.Router()

const {
  getAllEngineer,
  getEngineerById,
  getFilterEngineer,
  updateEngineer
} = require('../controllers/customer')

const {
  authorization
} = require('../middleware/auth')

const uploadImage = require('../middleware/multer')

router.get('/', authorization, getAllEngineer)
router.get('/detail/:enId', authorization, getEngineerById)
router.get('/filter', authorization, getFilterEngineer)
router.put('/:enId', authorization, uploadImage, updateEngineer)

module.exports = router
