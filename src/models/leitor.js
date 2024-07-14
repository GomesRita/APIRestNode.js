'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Leitor extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Leitor.init({
    CodLeitor: DataTypes.INTEGER,
    NomeLeitor: DataTypes.STRING,
    Email: DataTypes.STRING,
    situacao: DataTypes.STRING,
    senha: DataTypes.STRING,
    data_criacao: DataTypes.DATE
  }, {
    sequelize,
    modelName: 'Leitor',
  });
  return Leitor;
};