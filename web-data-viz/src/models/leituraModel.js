var database = require("../database/config");

function retornarMaxTempUmid(){
    var instrucaoSql = `
        SELECT max(Umidade) AS maxUmidade, 
            max(Temperatura) AS maxTemperatura FROM Leitura
            WHERE DATE(DataLeitura) = CURDATE();
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function retornarMinTempUmid(){
    var instrucaoSql = `
        SELECT min(Umidade) as minUmidade,
                min(Temperatura) as minTemperatura FROM Leitura
                WHERE DATE(DataLeitura) = CURDATE();
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    retornarMaxTempUmid,
    retornarMinTempUmid
}