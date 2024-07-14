const sequelize = require('sequelize');
const dbbiblioteca = require('../config/conexao');

const leitor = dbbiblioteca.define('leitor',{
    CodLeitor: {
        type: sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      NomeLeitor: {
        type: sequelize.STRING,
        allowNull: false
      },
      Email: {
        type: sequelize.STRING,
        allowNull: false
      },
      situacao: {
        type: sequelize.STRING,
        allowNull: false
      },
      senha: {
        type: sequelize.STRING,
        allowNull: false
      },
      data_criacao: {
        type: sequelize.DATE,
        allowNull: false
      },

});

module.exports = leitor;