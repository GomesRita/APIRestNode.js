const modelo = require('../models/model');
const leitor = require('../models/modelLeitor');
const { leitores } = require('./controller');
const controller = {}

controller.create = async function (req, res){
    try {
        /**
        As linhas     
        
            const {Email} = req.body;
            const checkLeitor = await leitor.findOne({ where: { Email } });

        São utilizadas como filtro para buscar registros no banco de dados antes
        de realizar qualquer operação exemplo:

        No create:
            Se o email já estiver no banco de dados o INSERT no db não será realizado;
        No read:
            Se o email já estiver no banco de dados o SELECT será realizado no db;
        No update:
            Se o email já estiver no banco de dados o registro será editado no db;
        No delete:
            Se o email já estiver no banco de dados o registro será excluído no db;

        Caso contrário a API informa que a operação não foi realizada pois o Email não foi encontrado
        ou já está cadastrado
        */
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
        res.status(404).json({ message: "Cadastro falhou"});
    }
}

controller.update = async function(req, res){
    try{
        const {Email, NomeLeitor, situacao, senha } = req.body;
        const checkLeitor = await leitor.findOne({ where: { Email } });
        
        if (checkLeitor !== null) {
            await leitor.update({
                NomeLeitor,
                Email,
                situacao,
                senha,
            },{where:{Email}
            })
            .then((result) => {
                res.status(201).json({
                    message: "Dados Atualizados com sucesso",
                    data: {
                        NomeLeitor,
                        Email,
                        situacao,
                        senha,
                    },
                });
            })
            .catch((error) => {
                res.status(500).json({ message: `Erro ao atualizar dados do leitor ` + error });
            });
        } else {
            res.status(500).json({ message: "Este cadastro não existe" });
        }
    } catch(error){
        res.status(404).json({ message: "Atualização falhou" });
    }
}
controller.remove = async function (req,res){
    try{
        const { Email }  = req.body
        const checkLeitor = await leitor.findOne({ where: { Email } });
        if(checkLeitor !== null){
            await leitor.destroy({where: {Email}})
            res.status(200).json({ message: "Leitor excluído com sucesso" }); 
        } else {
            res.status(500).json({ message: "Este cadastro não existe" });
        }
    } catch {
        res.status(404).json({ message: "Exclusão falhou" });
    }
}

controller.read = async function (req,res){
    try{
        const {Email} = req.body
        const checkLeitor = await leitor.findOne({ where: { Email } });
        if(checkLeitor !== null){
            const pesquisa = await leitor.findAll({attributes:[ 'CodLeitor', 'NomeLeitor', 'Email', 'situacao', 'senha', 'data_criacao'], where: {Email}})
            res.status(200).json({message: 'Leitor ', data: pesquisa   });
        } else {
            res.status(500).json({ message: "Este cadastro não existe" });
        }
    } catch {
        res.status(404).json({ message: "Pesquisa falhou" });
    }
}
module.exports = controller;