var unidadeModel = require("../models/unidadeModel");

function listar(req, res) {
    unidadeModel.listar().then(function(resultado){
        res.status(200).json(resultado);
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

function cadastrar(req, res) {
    var nome = req.body.nome;

    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    }

    carroModel.cadastrar(nome).then(function(resposta){
        res.status(200).send("Nome criado com sucesso");
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}
function defUnidade(req, res){
     var defUnidade

    unidadeModel.defUnidade(idMembro).then(function(resposta){
        res.status(200).send("Nome criado com sucesso");
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

module.exports = {
    listar,
    cadastrar,
    defUnidade
}