# API RestFUll com Node.js

> Este projeto foi desenvolvido como projeto I da disciplina de Desenvolvimento Web Back 

Dependencias utilizadas | Comando de instalação  |
------------------------|------------------------|
Express                 | npm i express          |
Sequelize               | npm i sequelize        |
MySQL                   | npm i mysql2           |
Body Parser             | npm i body-parser      |
Nodemon                 | npm i nodemon          |

## Metódo de acesso

Para realizar as consultas utilize o link endereço  **http://localhost:3000/crud/{operação desejada}**

Operações CRUD
* http://localhost:3000/crud/postleitor
* http://localhost:3000/crud/putleitor
* http://localhost:3000/crud/deleteleitor
* http://localhost:3000/crud/getleitor

## Banco de dados

O banco de dados utilzado foi desenvolvido para práticas de revisões. No contexto deste projeto ele foi explorado apenas na tabela leitors para ser compatível com os requisitos da avaliação de conter uma classe usuário conforme mostrado abaixo.

• Banco de Dados MySQL:
- Configurar um banco de dados MySQL para armazenar as informações dos usuários.
- Criar uma tabela de usuários com os seguintes campos:
- id: inteiro, chave primária, auto-incremento.
- nome: string, não nulo.
- email: string, não nulo, único.
- senha: string, não nulo.
- data_criacao: data, não nulo.

A estrutura de pastas e arquivos utilizada para organizar os códigos deste projeto idealizam um cenário em que possam existir mais classes Modelos e Controladores para uma aplicação completa deste banco de dados.

Abaico segue o modelo lógico do banco de dados utilizado:

![modelo lógico](img\bdbiblioteca.png)
