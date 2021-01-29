const express = require('express')
const router = express.Router()

const {
  detailAccount,
  createAccount,
  updateAccount,
  updateAccountPass,
  loginAccount,
  checkEmail,
  checkPassword,
  deleteAccount
} = require('../controllers/account')

const {
  hashPassword
} = require('../middleware/auth')

router.post('/register', hashPassword, createAccount)
router.put('/update/:acId', updateAccount)
router.put('/update/password/:acId', hashPassword, updateAccountPass)
router.post('/login', loginAccount)
router.post('/email/check', checkEmail)
router.post('/password/check/:acId', checkPassword)
router.get('/detail/:acId', detailAccount)
router.delete('/delete/:acId', deleteAccount)

module.exports = router
