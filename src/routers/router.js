const express = require('express');
const router = express.Router();

const controller = require('../controller/controller')

router.post('/cadastrar', controller.leitores.createNew)
router.put('/atualizarDados', controller.leitores.update)

module.exports = router;