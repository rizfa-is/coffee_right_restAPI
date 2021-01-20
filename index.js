const express = require('express')
const app = express()

require('dotenv').config()
const port = process.env.PORT

const bodyParser = require('body-parser')
const productRouter = require('./src/routes/product')

// import morgan dan CORS
const morgan = require('morgan')
const cors = require('cors')

// Middleware
app.use(bodyParser.urlencoded({ extended: false }))
app.use('/product', productRouter)
app.use(morgan('dev'))
app.use(cors())
app.use('/image', express.static('./uploads'))

// Config CORS
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*')
  res.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-with, Content-Type, Accept, Authorization'
  )
  next()
})

app.get('/', (req, res) => {
  res.send('Welcome to Coffee Right')
})

app.listen(port, () => {
  console.log(`Listen Coffee Right backend on port ${port}`)
})
