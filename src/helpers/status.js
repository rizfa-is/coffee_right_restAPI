module.exports = {
  statusGet: (res, result) => {
    res.status(200).send({
      success: true,
      message: 'Success to get data',
      data: result
    })
  },

  statusGetPaginate: (res, result, length) => {
    res.status(200).send({
      success: true,
      message: 'Success to get data',
      totalPages: length,
      data: result
    })
  },

  statusLogin: (res, result) => {
    res.status(200).send({
      success: true,
      message: 'Login success',
      data: result
    })
  },

  statusLoginRequired: (res, result) => {
    res.status(400).send({
      success: false,
      message: 'Please login first!',
      data: result
    })
  },

  statusTokenError: (res, result) => {
    res.status(403).send({
      success: false,
      message: result.message
    })
  },

  statusTokenExpired: (res, result) => {
    res.status(400).send({
      success: false,
      message: result.message
    })
  },

  statusLoginFail: (res) => {
    res.status(400).send({
      success: false,
      message: 'Password is invalid!'
    })
  },

  statusWrongPassword: (res) => {
    res.status(400).send({
      success: false,
      message: 'Wrong Password!'
    })
  },

  statusRegistration: (res) => {
    res.status(201).send({
      success: true,
      message: 'Registration success'
    })
  },

  statusRegistrationFail: (res) => {
    res.status(400).send({
      success: false,
      message: 'Fail to registration!'
    })
  },

  statusRegistrationUnique: (res) => {
    res.status(400).send({
      success: false,
      message: 'Email has registered!'
    })
  },

  statusCreate: (res) => {
    res.status(201).send({
      success: true,
      message: 'Add data success'
    })
  },

  statusCreateFail: (res) => {
    res.status(400).send({
      success: false,
      message: 'Fail to add data!'
    })
  },

  statusUpdate: (res) => {
    res.status(200).send({
      success: true,
      message: 'Update data success'
    })
  },

  statusUpdateFail: (res) => {
    res.status(400).send({
      success: false,
      message: 'Fail to update data!'
    })
  },

  statusDelete: (res) => {
    res.status(200).send({
      success: true,
      message: 'Delete data success'
    })
  },

  statusDeleteFail: (res) => {
    res.status(400).send({
      success: false,
      message: 'Fail to delete data!'
    })
  },

  statusServerError: (res) => {
    res.status(500).send({
      success: false,
      message: 'Internal Server Error!'
    })
  },

  statusNotFound: (res) => {
    res.status(404).send({
      success: false,
      message: 'Data not found!'
    })
  },

  statusNotFoundAccount: (res) => {
    res.status(404).send({
      success: false,
      message: 'Account not registered!'
    })
  },

  statusError: (res) => {
    res.status(404).send({
      success: false,
      message: 'Internal Server Error!'
    })
  },

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