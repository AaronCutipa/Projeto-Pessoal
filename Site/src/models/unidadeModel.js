var database = require("../database/config")

// Gráficos
function graficoCargo() {
    var instrucao = `
    SELECT
        c.nomeCargo AS Cargo,
        COUNT(m.idMembro) AS 'qtd_membro'
    FROM cargo c
    LEFT JOIN membro m 
        ON c.idCargo = m.fkCargo
    GROUP BY c.idCargo;
    ;`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function graficoClasse() {
    var instrucao = `
    SELECT
        cl.nomeClasse AS Classe,
        COUNT(m.idMembro) AS 'qtd_membro'
    FROM classes cl
    LEFT JOIN membro m 
        ON cl.idClasse = m.fkClasse
    GROUP BY cl.idClasse
    ;`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function graficoUnidade() {
    var instrucao = `
    SELECT
        u.nomeUnidade AS Unidade,
        COUNT(m.idMembro) AS 'qtd_membro'
    FROM unidade u
    LEFT JOIN membro m 
        ON u.idUnidade = m.fkUnidade
    GROUP BY u.idUnidade
    ;`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


// Kpis
function maxMembro() {
    var instrucao = `
    SELECT COUNT(*) AS 'total_membro'
    FROM membro
    ;`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function maxClasse() {
    var instrucao = `
    SELECT
        nomeClasse AS Classe,
        COUNT(m.idMembro) AS 'qtd_membro'
    FROM classes AS cl
    JOIN membro AS m
        ON cl.idClasse = m.fkClasse
    GROUP BY cl.idClasse
    ORDER BY COUNT(m.idMembro) DESC
    LIMIT 1
    ;`;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}
function maxUnidade() {
    var instrucao = `
    SELECT
    	u.nomeUnidade AS Unidade,
        COUNT(m.idMembro) AS 'qtd_membro'
    FROM unidade AS u
    JOIN membro AS m
    	ON u.idUnidade = m.fkUnidade
    GROUP BY u.idUnidade
    ORDER BY COUNT(m.idMembro) DESC
    LIMIT 1
;`;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


// Formulário
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
    defUnidade,
    defCargo,
    defClasse,
    graficoCargo,
    graficoClasse,
    graficoUnidade,
    maxMembro,
    maxClasse,
    maxUnidade
};