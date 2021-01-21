const multer = require('multer')

const {
  statusError
} = require('../helpers/status')

const storage = multer.diskStorage({
  destination: (_req, _file, cb) => {
    cb(null, './uploads')
  },
  filename: (_req, file, cb) => {
    const ext = file.originalname.split('.').pop()
    const fileName = 'IMG-' + Date.now() + '.' + ext

    cb(null, fileName)
  }
})

const fileFilter = (_req, file, cb) => {
  if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
    cb(null, true)
  } else {
    return cb(new Error('Extension file must be JPG or PNG'), false)
  }
}

const limits = {
  fileSize: 1024 * 1024 * 1
}

const upload = multer({ storage, fileFilter, limits }).single('image')

const uploadFilter = (req, res, next) => {
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      statusError(res, err)
    } else {
      console.log('Success upload image')
    }

    next()
  })
}

module.exports = uploadFilter

/*
const storage = multer.diskStorage({
  destination: (req, file, callback) => {
    callback(null, './uploads/')
  },
  filename: (req, file, callback) => {
    const extension = file.originalname.split('.').pop()
    const fileName = file.fieldname + '-' + Date.now() + '.' + extension
    callback(null, fileName)
  }
})

const fileFilter = (req, file, callback) => {
  if ((file.mimetype === 'image/jpeg') || (file.mimetype === 'image/png')) {
    callback(null, true)
  } else {
    console.log(file)
    return callback(new Error('Extension file must be JPEG or PNG'), false)
  }
}

const limits = { fileSize: 1024 * 1024 * 1 }
  res.status(400).send({
        success: false,
        message: err.message
      })
    } else if (err) {
      res.status(400).send({
        success: false,
        message: err.message
      })
    } else {
      next()
    }
    */
