var dashboardModel = require("../models/dashboardModel");

function buscarUltimasLeituras(req, res) {

    const limite_linhas = 7;

    var fkHectare = req.params.fkHectare;

    console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

    dashboardModel.buscarUltimasLeituras(fkHectare, limite_linhas).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarLeiturasEmTempoReal(req, res) {

    var fkHectare = req.params.fkHectare;

    console.log(`Recuperando medidas em tempo real`);

    dashboardModel.buscarLeiturasEmTempoReal(fkHectare).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function obterDadosGraficoMedia(req, res) {

    console.log(`Recuperando medidas em tempo real`);

    dashboardModel.obterDadosGraficoMedia().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}
function exibirHectares(req, res) {
    var nomePropriedade = req.params.nomePropriedade;

    console.log(`Recuperando medidas em tempo real`);

    dashboardModel.exibirHectares(nomePropriedade).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function exibirAreaFazenda(req, res) {
    var nomePropriedade = req.params.nomePropriedade;

    console.log(`Recuperando medidas em tempo real`);

    dashboardModel.exibirAreaFazenda(nomePropriedade).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function cadastrarHectares(req, res) {
    var idPropriedade = req.params.idPropriedade;

    dashboardModel.cadastrarHectares(idPropriedade).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimasLeituras,
    buscarLeiturasEmTempoReal,
    obterDadosGraficoMedia,
    exibirHectares,
    exibirAreaFazenda,
    cadastrarHectares
}