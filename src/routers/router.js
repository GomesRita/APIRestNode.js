const express = require('express');
const router = express.Router();

const controller = require('../controller/controller')

router.post('/cadastrar', controller.leitores.createNew)
router.put('/atualizarDados', controller.leitores.update)
router.delete('/delete', controller.leitores.remove)
router.get('/retornaLeitor', controller.leitores.read)
module.exports = router;