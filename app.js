const express = require('express')
const app = express()
const port = 3000
const { foo } = require('./helpers/utils');

app.get('/get-users-by-company/:companyId', async (req, res) => {
  await foo();
  res.send(req.params)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})