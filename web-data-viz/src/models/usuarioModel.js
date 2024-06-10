var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
        SELECT IdUsuario, nome, email, telefone, fkToken FROM Usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, senha, telefone, token) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha, telefone, token);

    var instrucaoSql = `
        INSERT INTO Usuario (nome, email, senha, telefone, fkToken) VALUES ('${nome}', '${email}', '${senha}', ${telefone},'${token}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function Cadastrar_Configuracao_Hectare(Nome_Uva, Tipo_Uva) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", Nome_Uva, Tipo_Uva);

    var instrucaoSql = `
    INSERT INTO Uva (Nome, fkTipo) VALUES ('${Nome_Uva}', '${Tipo_Uva}');
`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function Informacoes_do_Contato(nome, email, mensagem) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, mensagem);

    var instrucaoSql = `
    INSERT INTO Mensagem (Nome, Email, Mensagem) VALUES ('${nome}','${email}','${mensagem}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function InformacoesPropriedade(NomePropriedade, QTDhectare, CEP, cidade, estado) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", NomePropriedade, QTDhectare, CEP, cidade, estado);

    var instrucaoSql = `
    INSERT INTO Propriedade (Nome, Qnt_Hectare) VALUES ('${NomePropriedade}','${QTDhectare}');
    
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// INSERT INTO Endereco (CEP, Cidade, Estado) VALUES ('${CEP}','${cidade}','${estado}');

module.exports = {
    autenticar,
    cadastrar,
    Cadastrar_Configuracao_Hectare,
    Informacoes_do_Contato,
    InformacoesPropriedade
};