// require('dotenv').config()
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Welcome to Coffee Right')
})

app.listen(port, () => {
  console.log(`Listen StarworkS backend on port ${port}`)
})
