const modelo = require('../models/model');
const { op } = require('sequelize');
const leitor = require('../models/modelLeitor');
const controller = {}

controller.createNew = async function (req, res){
    try {
        const {Email} = req.body;
        const checkLeitor = await leitor.findOne({ where: { Email }});
        if (checkLeitor !== null) {
            res.status(500).json({ message: "Este email já está cadastrado" });
        } else {
            await leitor.create({
                CodLeitor: req.body.CodLeitor,
                NomeLeitor: req.body.NomeLeitor,
                Email: req.body.Email,
                situacao: req.body.situacao,
                senha: req.body.senha,
                data_criacao: new Date()
            })
            .then((result) => {
                res.status(201).json({
                    message: "Leitor cadastrado com sucesso",
                    data: {
                        NomeLeitor: req.body.NomeLeitor,
                        data_criacao: req.body.data_criacao
                    }
                });
            })
            .catch((error) => {
                res.status(500).json({ message: error.message });
            });
        }
    } catch(error) {
        res.status(404).json({ message: error.message });
    }
}

module.exports = controller;