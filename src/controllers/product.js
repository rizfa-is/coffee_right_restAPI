const {
  statusRead,
  statusErrorServer,
  statusNotFound,
  statusReadProductByPrId,
  statusPost,
  statusFailedAddData,
  statusMustFillAllFields,
  statusUpdateData,
  statusFailedUpdate,
  statusDeleteById,
  statusFailedDeleteById
} = require('../helpers/status')

const {
  getAllProductModel,
  getAllProductGroupByNameModel,
  getProductByPrIdModel,
  addProductModel,
  updateProductByPrIdModel,
  deleteProductByPrIdModel,
  getSearchProductModel,
  getFilterProductModel
} = require('../models/product')

const isEmpty = require('lodash.isempty')

module.exports = {
  getAllProduct: async (req, res) => {
    let {
      search,
      limit,
      page
    } = req.query

    if (!limit) {
      limit = 500
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
      let result = await getAllProductModel(paginate)

      if (isEmpty(search)) {
        result = await getAllProductModel(paginate)
      } else {
        result = await getSearchProductModel(paginate)
      }

      if (result.length) {
        statusRead(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusErrorServer(res, error)
    }
  },
  getFilterProduct: async (req, res, _next) => {
    let { filter, limit, page } = req.query

    if (!limit) {
      limit = 500
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
        result = await getAllProductModel(paginate)
      } else {
        result = await getFilterProductModel(paginate)
      }

      if (result.length) {
        statusRead(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      console.error(error)
      statusErrorServer(res)
    }
  },
  getAllProductGroupByName: async (req, res) => {
    let {
      search,
      limit,
      page
    } = req.query

    if (!limit) {
      limit = 500
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
      let result = await getAllProductGroupByNameModel(paginate)

      if (isEmpty(search)) {
        result = await getAllProductGroupByNameModel(paginate)
      } else {
        result = await getSearchProductModel(paginate)
      }

      if (result.length) {
        statusRead(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusErrorServer(res, error)
    }
  },

  getProductByPrId: async (req, res) => {
    try {
      const {
        prId
      } = req.params
      const result = await getProductByPrIdModel(prId)

      if (result.length) {
        statusReadProductByPrId(res, result, prId)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusErrorServer(res)
    }
  },
  
  addProduct: async (req, res) => {
    try {
      req.body.pr_image = req.file === undefined ? '' : req.file.filename

      if (
        req.body.dc_id &&
        req.body.pr_name &&
        req.body.pr_desc &&
        req.body.pr_unit_price &&
        req.body.pr_image &&
        req.body.pr_favorite &&
        req.body.pr_category
      ) {
        const result = await addProductModel(req.body)

        if (result.affectedRows) {
          statusPost(res, result)
        } else {
          statusFailedAddData(res, result)
        }
      } else {
        statusMustFillAllFields(res)
      }
    } catch (error) {
      statusErrorServer(res, error)
    }
  },
  updateProductByPrId: async (req, res) => {
    try {
      const {
        prId
      } = req.params
      const resultSelect = await getProductByPrIdModel(prId)
      const image = req.file === undefined ? resultSelect[0].pr_image : req.file.filename

      const data = req.body
      const setData = {
        ...data,
        pr_image: image
      }
      if (resultSelect.length) {
        const resultUpdate = await updateProductByPrIdModel(setData, prId)
        if (resultUpdate.affectedRows) {
          statusUpdateData(res, resultUpdate)
        } else {
          statusFailedUpdate(res)
        }
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusErrorServer(res, error)
    }
  },
  deleteProductByPrId: async (req, res) => {
    try {
      const {
        prId
      } = req.params
      const resultSelect = await getProductByPrIdModel(prId)

      if (resultSelect.length) {
        const resultDelete = await deleteProductByPrIdModel(prId)
        if (resultDelete.affectedRows) {
          statusDeleteById(res)
        } else {
          statusFailedDeleteById(res)
        }
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusErrorServer(res, error)
    }
  }
}