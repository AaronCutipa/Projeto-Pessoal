var express = require("express");
var router = express.Router();

var unidadeController = require("../controllers/unidadeController");

router.post("/cadastrar", function (req, res) {
    unidadeController.cadastrar(req, res);
});

router.get("/graficoCargo", function (requisicao, resposta) {
    unidadeController.graficoCargo(requisicao, resposta);
});

router.post("/defUnidade", function (requisicao, resposta){
    unidadeController.defUnidade(requisicao, resposta);
    // chamando a function do controller
});

router.post("/defCargo", function (requisicao, resposta){
    unidadeController.defCargo(requisicao, resposta);
});

router.post("/defClasse", function (requisicao, resposta){
    unidadeController.defClasse(requisicao, resposta);
});

module.exports = router;