var express = require("express");
var router = express.Router();

var HectareController = require("../controllers/HectareController");

router.get("/BuscarHectares", function (req, res) {
    HectareController.BuscarHectares(req, res);
});

module.exports = router;