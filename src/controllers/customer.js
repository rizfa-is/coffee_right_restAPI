const {
  getAllCustomer,
  getSearchCustomer,
  getCustomerById,
  updateCustomer,
  getFilterCustomer
} = require('../models/customer')

const isEmpty = require('lodash.isempty')

const {
  statusGet,
  statusUpdate,
  statusUpdateFail,
  statusServerError,
  statusNotFound
} = require('../helpers/status')

module.exports = {
  getAllCustomer: async (req, res, _next) => {
    let { search, limit, page } = req.query

    if (!limit) {
      limit = 10
    } else {
      limit = parseInt(limit)
    }

    if (!page) {
      page = 1
    } else {
      page = parseInt(page)
    }

    const paginate = {
      search: search,
      limit: limit,
      offset: (page - 1) * limit
    }

    try {
      let result

      if (isEmpty(search)) {
        result = await getAllCustomer(paginate)
      } else {
        result = await getSearchCustomer(paginate)
      }

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  getCustomerById: async (req, res, _next) => {
    const { enId } = req.params

    try {
      const result = await getCustomerById(enId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  getFilterCustomer: async (req, res, _next) => {
    let { filter, limit, page } = req.query

    if (!limit) {
      limit = 10
    } else {
      limit = parseInt(limit)
    }

    if (!page) {
      page = 1
    } else {
      page = parseInt(page)
    }

    const paginate = {
      filter: filter,
      limit: limit,
      offset: (page - 1) * limit
    }

    try {
      let result

      if (isEmpty(filter)) {
        result = await getAllCustomer(paginate)
      } else {
        result = await getFilterCustomer(paginate)
      }

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      console.error(error)
      statusServerError(res)
    }
  },

  updateCustomer: async (req, res, _next) => {
    const { enId } = req.params

    try {
      const findData = await getCustomerById(enId)

      if (findData.length) {
        req.body.image = req.file === undefined ? findData[0].cs_profile : req.file.filename

        const data = {
          ...req.body,
          cs_profile: req.body.image
        }

        delete data.image

        const result = await updateCustomer(enId, data)

        if (result.affectedRows) {
          statusUpdate(res)
        } else {
          statusUpdateFail(res)
        }
      } else {
        statusNotFound(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  }
}
