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
} = require('../helpers/statusCRUD')

const {
  getAllProductModel,
  getProductByPrIdModel,
  addProductModel,
  updateProductByPrIdModel,
  deleteProductByPrIdModel
} = require('../models/product')

module.exports = {
  getAllProduct: async (req, res) => {
    try {
      const result = await getAllProductModel()

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
      const { prId } = req.params
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
      const {
        prName,
        prDesc,
        prUnitPrice,
        prCategory,
        prDayStartDeliv,
        prEndDayDeliv,
        prTimeStartDeliv,
        prTimeEndDeliv
      } = req.body
      const image = req.file === undefined ? '' : req.file.filename

      const data = {
        pr_name: prName,
        pr_desc: prDesc,
        pr_unit_price: prUnitPrice,
        pr_image: image,
        pr_category: prCategory,
        pr_day_start_deliv: prDayStartDeliv,
        pr_day_end_deliv: prEndDayDeliv,
        pr_time_start_deliv: prTimeStartDeliv,
        pr_time_end_deliv: prTimeEndDeliv
      }

      if (prName.trim() && prDesc.trim() && prUnitPrice.trim() && prCategory.trim() && prDayStartDeliv.trim() && prEndDayDeliv.trim() && prTimeStartDeliv.trim() && prTimeEndDeliv.trim()) {
        const result = await addProductModel(data)

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
      console.log(`${error}`)
    }
  },
  updateProductByPrId: async (req, res) => {
    try {
      const { prId } = req.params
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
      const { prId } = req.params
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
