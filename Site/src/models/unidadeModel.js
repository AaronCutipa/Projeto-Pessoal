var database = require("../database/config")

function listar() {
    var instrucao = `
        SELECT * FROM unidade;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function cadastrar(nome) {
    var instrucao = ` INSERT INTO carro (nome) VALUES ('${nome}');`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function defUnidade(unidade, idMembro) {
    var instrucaoSql = ` UPDATE membro SET fkUnidade = '${unidade}' WHERE idMembro = ${idMembro};`;
    return database.executar(instrucaoSql);
}

function defCargo(cargo, idMembro) {
    var instrucaoSql = ` UPDATE membro SET fkCargo = '${cargo}' WHERE idMembro = ${idMembro};`;
    return database.executar(instrucaoSql);
}

function defClasse(classe, idMembro) {
    var instrucaoSql = ` UPDATE membro SET fkClasse = '${classe}' WHERE idMembro = ${idMembro};`;
    return database.executar(instrucaoSql);
}


module.exports = {
    cadastrar,
    listar,
    defUnidade,
    defCargo,
    defClasse
};