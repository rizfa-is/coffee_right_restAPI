const express = require('express')
const router = express.Router()

const {
    getAllOrderDetailByCsId,
    getAllODById,
    getAllOrderDetailWithOrderByOdId,
    createOrderDetail,
    updateOrderDetail,
    updateDvIdByOdId,
    deleteOrderDetail,
    getAllOrderDetail
} = require('../controllers/orderDetail')

router.get('/getAllOD', getAllOrderDetail)
router.get('/getAllByCsId/:csId', getAllOrderDetailByCsId)
router.get('/getAllById/:odId', getAllODById)
router.get('/getAllOrderDetailWithOrderByOdId/:odId', getAllOrderDetailWithOrderByOdId)

router.post('/create', createOrderDetail)
router.put('/update/:odId', updateOrderDetail)
router.put('/updateDvIdByOdId/:csId', updateDvIdByOdId)
router.delete('/deleteOrderDetail/:odId', deleteOrderDetail)
module.exports = router