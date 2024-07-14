const  express = require('express')
const app = express()
const port = 3000
const db = require('./config/conexao')

app.get('/', (req, res) =>{
    res.send('Hello World!')
})
const usuarioControler = require

app.listen(port, () =>{
    console.log(`API rodando na porta ${port}`)
})