const express = require('express')
const router = express.Router()

const LeitorControler = require("../controller/leitorcontroler")

router.post('/', LeitorControler.create)

module.exports = router