const express = require('express');
const router = express.Router();

const controller = require('../controller/controller')

router.post('/', controller.leitores.createNew)

module.exports = router;