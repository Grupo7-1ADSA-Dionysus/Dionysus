var express = require("express");
var router = express.Router();

var leituraController = require("../controllers/leituraController");

router.get("/retornarMaxTempUmid", function (req, res) {
    leituraController.retornarMaxTempUmi(req, res);
});

module.exports = router;