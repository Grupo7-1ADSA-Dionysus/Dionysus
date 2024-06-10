var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
});

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.post("/Cadastrar_Configuracao_Hectare", function(req, res) {
    usuarioController.Cadastrar_Configuracao_Hectare(req, res);
});

router.post("/Cadastrar_Informacoes_do_Contato", function(req, res){
    usuarioController.Informacoes_do_Contato(req, res);
});

router.post("/InformacoesPropriedade", function(req, res){
    usuarioController.InformacoesPropriedade(req, res);
});



module.exports = router;