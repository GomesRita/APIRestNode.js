const { Sequelize } = require('sequelize')

const sequelize = new Sequelize('biblioteca','root', '',{
    dialect: 'mysql',
    host: 'localhost',
    port: 3306
});

const connect = async () => {
    try {
        await sequelize.authenticate();
        console.log('Conecxão realizada com sucesso');
    } catch (error){
        console.error('Conexão com o banco de dados falho', error);
    }
}

connect()