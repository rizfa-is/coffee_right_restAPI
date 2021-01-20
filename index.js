const express = require('express')
const app = express()

require('dotenv').config()
const port = process.env.PORT

const bodyParser = require('body-parser')
const productRouter = require('./src/routes/product')

// Middleware
app.use(bodyParser.urlencoded({ extended: false }))
app.use('/product', productRouter)

app.get('/', (req, res) => {
  res.send('Welcome to Coffee Right')
})

app.listen(port, () => {
  console.log(`Listen StarworkS backend on port ${port}`)
})
