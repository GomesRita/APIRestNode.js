const express = require('express');
const bodyParser = require('body-parser');
const route = require('./routers/router')
const app = express()
require('dotenv-safe').config({
    allowEmptyValues: true,
    example: '.env.example',
    path: '.env' 
  });
  
const jwt = require('jsonwebtoken');

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use('/crud', route);

app.get('/', (req, res) =>{
    res.send('Hello World!')
})

app.get('/teste', (req, res, next) => {
    res.json({message: "Tudo ok por aqui!"});
})

app.get('/leitores', (req, res, next) => { 
    console.log("Retornou todos leitores");
    res.json([{id:2,nome:'Maria Rita'}]);
}) 

app.listen(3000, () => {
    console.log(`Servidor web iniciado na porta 3000`);
});

 

app.post('/login', (req, res, next) => {
    if(req.body.user === 'Maria Rita' && req.body.password === '123456'){
      const id = 2; 
      const token = jwt.sign({ id }, process.env.SECRET, {
        expiresIn: 300 
      });
      return res.json({ auth: true, token: token });
    }
    
    res.status(500).json({message: 'Login inválido!'});
})

app.post('/logout', function(req, res) {
    res.json({ auth: false, token: null });
})

 
function verifyJWT(req, res, next){
    const token = req.headers['authorization'];
    if (!token) return res.status(401).json({ auth: false, message: 'No token provided.' });
    
    jwt.verify(token, process.env.SECRET, function(err, decoded) {
      if (err) return res.status(500).json({ auth: false, message: 'Failed to authenticate token.' });
      
      req.userId = decoded.id;
      next();
    });
}
 

 
app.get('/leitores', verifyJWT, (req, res, next) => { 
    console.log("Retornou todos leitores");
    res.json([{id:2,nome:'Maria Rita'}]);
})
 

module.exports = app;


 

 
