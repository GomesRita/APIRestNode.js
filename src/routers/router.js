const express = require('express');
const router = express.Router();

const controller = require('../controller/controller')

router.post('/postleitor', controller.leitores.create)
router.put('/putleitor', controller.leitores.update)
router.delete('/deleteleitor', controller.leitores.remove)
router.get('/getleitor', controller.leitores.read)
module.exports = router;