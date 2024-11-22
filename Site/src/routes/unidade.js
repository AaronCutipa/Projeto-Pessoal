var express = require("express");
var router = express.Router();

var unidadeController = require("../controllers/unidadeController");

router.post("/cadastrar", function (req, res) {
    unidadeController.cadastrar(req, res);
});

router.get("/listar", function (req, res) {
    unidadeController.listar(req, res);
});

router.get("/defUnidade", function (req, res)){
    unidadeController.listar(req, res);

}

module.exports = router;