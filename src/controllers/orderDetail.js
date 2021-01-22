require('dotenv').config

const stat = require('../helpers/status')
const model = require('../models/orderDetail')

module.exports = {

    getAllODByIdOrder: async (req, res) => {
        try {
            const { orId } = req.params
            const result = await model.getODByIdOrder(orId)

            if (result.length) {
                stat.statusGet(res, result, orId)
            } else {
                stat.statusNotFound(res)
            }
        } catch (error) {
            stat.statusError(res)
        }
    }

}