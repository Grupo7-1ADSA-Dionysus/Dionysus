var express = require("express");
var router = express.Router();

var leituraController = require("../controllers/leituraController");

router.get("/retornarMaxTempUmid", function (req, res) {
    leituraController.retornarMaxTempUmid(req, res);
});

router.get("/retornarMinTempUmid", function (req, res) {
    leituraController.retornarMinTempUmid(req, res);
});

router.get("/retornarMediaTempUmid", function (req, res) {
    leituraController.retornarMediaTempUmid(req, res);
});

module.exports = router;