var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/ultimas/:fkHectare", function (req, res) {
    dashboardController.buscarUltimasLeituras(req, res);
});

router.get("/tempo-real/:fkHectare", function (req, res) {
    dashboardController.buscarLeiturasEmTempoReal(req, res);
})

module.exports = router;