var database = require("../database/config");

function retornarMaxTempUmid(){
    var instrucaoSql = `
        SELECT max(Umidade) AS maxUmidade, max(Temperatura) AS maxTemperatura FROM Leitura;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    retornarMaxTempUmid
}