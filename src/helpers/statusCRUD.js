
module.exports = {
  statusRead: (res, result) => {
    res.status(200).send({
      success: true,
      message: 'List Data',
      data: result
    })
  },

  statusErrorServer: (res) => {
    res.status(500).send({
      success: false,
      message: 'Internal Server Error!'
    })
  },

  statusNotFound: (res) => {
    res.status(404).send({
      success: false,
      message: 'Data not found'
    })
  },

  statusReadProductByPrId: (res, result, prId) => {
    res.status(200).send({
      success: true,
      message: `Product with product id ${prId}`,
      data: result
    })
  },

  statusPost: (res) => {
    res.status(200).send({
      success: true,
      message: 'Success add data'
    })
  },

  statusFailedAddData: (res) => {
    res.status(400).send({
      success: false,
      message: 'Submit data failed'
    })
  },

  statusMustFillAllFields: (res) => {
    res.status(400).send({
      success: false,
      message: 'All fields must be filled!'
    })
  },

  statusUpdateData: (res) => {
    res.status(200).send({
      success: true,
      message: 'Successfully updated data'
    })
  },

  statusFailedUpdate: (res) => {
    res.status(400).send({
      success: false,
      message: 'Update data failed'
    })
  },

  statusDeleteById: (res) => {
    res.status(200).send({
      success: true,
      message: 'Success delete data'
    })
  },

  statusFailedDeleteById: (res) => {
    res.status(400).send({
      success: false,
      message: 'Delete data failed'
    })
  }
}
