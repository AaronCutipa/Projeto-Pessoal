var express = require("express");
var router = express.Router();

var unidadeController = require("../controllers/unidadeController");

// Gráficos
router.get("/graficoCargo", function (requisicao, resposta) {
    unidadeController.graficoCargo(requisicao, resposta);
});

router.get("/graficoClasse", function (requisicao, resposta) {
    unidadeController.graficoClasse(requisicao, resposta)
});

router.get("/graficoUnidade", function (requisicao, resposta) {
    unidadeController.graficoUnidade(requisicao, resposta)
});

// Kpis
router.get("/maxMembro", function (requisicao, resposta) {
    unidadeController.maxMembro(requisicao, resposta);
});

router.get("/maxClasse", function (requisicao, resposta) {
    unidadeController.maxClasse(requisicao, resposta)
});

router.get("/maxUnidade", function (requisicao, resposta) {
    unidadeController.maxUnidade(requisicao, resposta)
});


// Formulário
router.post("/defUnidade", function (requisicao, resposta) {
    unidadeController.defUnidade(requisicao, resposta);
    // chamando a function do controller
});

router.post("/defCargo", function (requisicao, resposta) {
    unidadeController.defCargo(requisicao, resposta);
});

router.post("/defClasse", function (requisicao, resposta) {
    unidadeController.defClasse(requisicao, resposta);
});


module.exports = router;