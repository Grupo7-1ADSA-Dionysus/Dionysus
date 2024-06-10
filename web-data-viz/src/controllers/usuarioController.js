var usuarioModel = require("../models/usuarioModel");
// var aquarioModel = require("../models/aquarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);

                        
                                if (resultadoAutenticar.length > 0) {
                                    res.json({
                                        id: resultadoAutenticar[0].id,
                                        email: resultadoAutenticar[0].email,
                                        nome: resultadoAutenticar[0].nome,
                                        senha: resultadoAutenticar[0].senha,
                                        
                                    });
                                } else {
                                    res.status(204).json({ aquarios: [] });
                                }
                         
                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var telefone = req.body.telefoneServer;
    var token = req.body.tokenServer;

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else if(telefone == undefined){
        res.status(400).send("Seu telefone está undefined!");
    } else if (token == undefined) {
        res.status(400).send("Sua empresa está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nome, email, senha, telefone, token)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function Cadastrar_Configuracao_Hectare(req, res){
    var Nome_Uva = req.body.NomeUva
    var Tipo_Uva = req.body.Tipo_Uva

    if (Nome_Uva == undefined) {
        res.status(400).send("Seu Nome_Uva está undefined!");
    } else if (Tipo_Uva == undefined) {
        res.status(400).send("Seu Tipo_Uva está undefined!");
    }
    else{

        usuarioModel.Cadastrar_Configuracao_Hectare(Nome_Uva, Tipo_Uva)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function Informacoes_do_Contato(req, res) {
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var mensagem = req.body.mensagemServer;

    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (mensagem == undefined) {
        res.status(400).send("Sua senha está undefined!");
    }else{
        usuarioModel.Informacoes_do_Contato(nome, email, mensagem)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function InformacoesPropriedade(req, res) {
    var NomePropriedade = req.body.NomePropriedadeServer;
    var QTDhectare = req.body.QTDhectareServer;
    var CEP = req.body.CEPServer;
    var cidade = req.body.cidadeServer;
    var estado = req.body.estadoServer;

    if (NomePropriedade == undefined) {
        res.status(400).send("O nome da propriedade está undefined!");
    } else if (QTDhectare == undefined) {
        res.status(400).send("A quantidade de hectare está undefined!");
    } else if (CEP == undefined) {
        res.status(400).send("O CEP está undefined!");
    } else if (cidade == undefined) {
        res.status(400).send("A cidade está undefined!");
    } else if (estado == undefined) {
        res.status(400).send("O estado está undefined!");
    }else{
        usuarioModel.InformacoesPropriedade(NomePropriedade, QTDhectare, CEP, cidade, estado)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}


module.exports = {
    autenticar,
    cadastrar,
    Cadastrar_Configuracao_Hectare,
    Informacoes_do_Contato,
    InformacoesPropriedade
}