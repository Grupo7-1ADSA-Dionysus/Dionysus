var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/ultimas/:fkHectare", function (req, res) {
    dashboardController.buscarUltimasLeituras(req, res);
});

router.get("/tempo-real/:fkHectare", function (req, res) {
    dashboardController.buscarLeiturasEmTempoReal(req, res);
})

router.get("/obterDadosGraficoMedia", function (req, res) {
    dashboardController.obterDadosGraficoMedia(req, res);
})
router.get("/exibirHectares/:nomePropriedade", function (req, res) {
    dashboardController.exibirHectares(req, res);
})
router.get("/exibirAreaFazenda/:nomePropriedade", function (req, res) {
    dashboardController.exibirAreaFazenda(req, res);
})

router.post("/cadastrarHectares/:idPropriedade", function (req, res) {
    dashboardController.cadastrarHectares(req, res);
})

module.exports = router;