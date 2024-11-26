var unidadeModel = require("../models/unidadeModel");

// Gráficos
function graficoCargo(requisicao, resposta) {
    unidadeModel.graficoCargo()
        .then(function (resultadoBanco) {
            resposta.status(200).json(resultadoBanco);
        }).catch(function (erro) {
            resposta.status(500).json(erro.sqlMessage);
        })
}

function graficoClasse(requisicao, resposta) {
    unidadeModel.graficoClasse()
        .then(function (resultadoBanco) {
            resposta.status(200).json(resultadoBanco);
        }).catch(function (erro) {
            resposta.status(500).jason(erro.sqlMessege)
        })
}

function graficoUnidade(requisicao, resposta) {
    unidadeModel.graficoUnidade()
        .then(function (resultadoBanco) {
            resposta.status(200).json(resultadoBanco);
        }).catch(function (erro) {
            resposta.status(500).jason(erro.sqlMessege)
        })
}

// Kpis
function maxMembro(requisicao, resposta) {
    unidadeModel.maxMembro()
        .then(function (resultadoBanco) {
            resposta.status(200).json(resultadoBanco);
        }).catch(function (erro) {
            resposta.status(500).json(erro.sqlMessage);
        })
}

function maxClasse(requisicao, resposta) {
    unidadeModel.maxClasse()
        .then(function (resultadoBanco) {
            resposta.status(200).json(resultadoBanco);
        }).catch(function (erro) {
            resposta.status(500).jason(erro.sqlMessege)
        })
}

function maxUnidade(requisicao, resposta) {
    unidadeModel.maxUnidade()
        .then(function (resultadoBanco) {
            resposta.status(200).json(resultadoBanco);
        }).catch(function (erro) {
            resposta.status(500).jason(erro.sqlMessege)
        })
}

// Formulário
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
            .then(function (respostaBanco) {
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
            .then(function (respostaBanco) {
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
            .then(function (respostaBanco) {
                resposta.status(200).send("idClasse e idMembro criado com sucesso");
            }).catch(function (erro) {
                resposta.status(500).json(erro.sqlMessage);
            })
    }
}



// Receber informações que vamos enviar na model 
module.exports = {
    defUnidade,
    defCargo,
    defClasse,
    graficoCargo,
    graficoClasse,
    graficoUnidade,
    maxMembro,
    maxClasse,
    maxUnidade
}