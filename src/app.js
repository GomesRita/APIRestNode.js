const express = require('express');
const bodyParser = require('body-parser');
const route = require('./routers/router')
const app = express()

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.get('/', (req, res) =>{
    res.send('Hello World!')
})
app.use('/novoLeitor', route);

app.listen(3000, () => {
    console.log(`Servidor web iniciado na porta 3000`);
});

module.exports = app;