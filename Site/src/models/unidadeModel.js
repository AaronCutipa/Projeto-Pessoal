var database = require("../database/config")

function listar() {
    var instrucao = `
        SELECT * FROM unidade;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function cadastrar(nome) {
    var instrucao = `
        INSERT INTO carro (nome) VALUES ('${nome}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function defUnidade() {
    var instrucaoSql = ` UPDATE membro SET fkUnidade = '${unidade}' WHERE idMembro = ${idMembro};`;
    return database.executar(instrucaoSql);
}

module.exports = {
    cadastrar,
    listar,
    defUnidade
};