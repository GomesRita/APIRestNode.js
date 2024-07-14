const { timeStamp } = require('console');
const sequelize = require('sequelize');
const dbbiblioteca = new sequelize('biblioteca','root', '',{
    dialect: 'mysql',
    host: 'localhost',
    port: 3306,
    define:{
        timestamps: false
    }
});

const connect = async () => {
    try {
        await dbbiblioteca.authenticate();
        console.log('Conecxão realizada com sucesso');
    } catch (error){
        console.error('Conexão com o banco de dados falho', error);
    }
}

connect()
module.exports = dbbiblioteca;