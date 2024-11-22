var unidadeModel = require("../models/unidadeModel");

function listar(req, res) {
    unidadeModel.listar().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function cadastrar(req, res) {
    var nome = req.body.nome;

    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    }

    carroModel.cadastrar(nome).then(function (resposta) {
        res.status(200).send("Nome criado com sucesso");
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}
function defUnidade(requisicao, resposta) {
    //  Ele recebe os dados do HTML
    // O idMembro e para confirmar o usuario
    var idUnidade = requisicao.body.idUnidade;
    var idMembro = requisicao.body.idMembro;

    // os if, else, then, catch e boas praticas para o código não quebrar
    if (idUnidade == undefined) {
        // devolvendo a resposta caso unidade undifined
        resposta.status(400).send("idUnidade está undefined!");
        // sedn = enviar
    } else if (idMembro == undefined) {
        resposta.status(400).send("idMembro está undefined!");
    } else {
        // se receber os dois ids envia para o model
        // a ordem da variavel deve ser o mesmo em todos, 1,2 .. mas pode mudar o nome
        unidadeModel.defUnidade(idUnidade, idMembro)
            // then = executou a função, se for com sucesso cai no then
            .then(function (resposta) {
                resposta.status(200).send("idUnidade e idMembro criado com sucesso");
                // catch = senão caio no catch
            }).catch(function (erro) {
                resposta.status(500).json(erro.sqlMessage);
            })
    }
}
function defCargo(requisicao, resposta) {
    var idCargo = requisicao.body.idCargo;
    var idMembro = requisicao.body.idMembro;

    if (idCargo == undefined) {
        resposta.status(400).send("idCargo está undefined!");
    } else if (idMembro == undefined) {
        resposta.status(400).send("idMembro está undefined!");
    } else {
        unidadeModel.defCargo(idCargo, idMembro)
            .then(function (resposta) {
                resposta.status(200).send("idCargo e idMembro criado com sucesso");
            }).catch(function (erro) {
                resposta.status(500).json(erro.sqlMessage);
            })
    }
}

function defClasse(requisicao, resposta) {
    var idClasse = requisicao.body.idClasse;
    var idMembro = requisicao.body.idMembro;

    if (idClasse == undefined) {
        resposta.status(400).send("idClasse está undefined!");
    } else if (idMembro == undefined) {
        resposta.status(400).send("idMembro está undefined!");
    } else {
        unidadeModel.defClasse(idClasse, idMembro)
            .then(function (resposta) {
                resposta.status(200).send("idClasse e idMembro criado com sucesso");
            }).catch(function (erro) {
                resposta.status(500).json(erro.sqlMessage);
            })
    }
}



// Receber informações que vamos enviar na model 
module.exports = {
    listar,
    cadastrar,
    defUnidade,
    defCargo,
    defClasse
}