var database = require("../database/config");

function buscarUltimasLeituras(fkHectare, limite_linhas) {

    var instrucaoSql = `
        SELECT Umidade,
        Temperatura,
		DATE_FORMAT(DataLeitura,'%H:%i') as DataLetura
        FROM Leitura 
        WHERE fkHectare = ${fkHectare}
        ORDER BY IdDado DESC LIMIT ${limite_linhas};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarLeiturasEmTempoReal(fkHectare) {

    var instrucaoSql = ` SELECT Umidade,
        Temperatura,
		DATE_FORMAT(DataLeitura,'%H:%i') as DataLetura
        FROM Leitura 
        WHERE fkHectare = ${fkHectare}
        ORDER BY IdDado DESC LIMIT 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterDadosGraficoMedia(fkHectare) {

    var instrucaoSql = ` SELECT 
    DAYOFWEEK(DataLeitura) AS DiaSemana,
    TRUNCATE(AVG(Umidade), 1) AS MediaUmidade,
    TRUNCATE(AVG(Temperatura), 1) AS MediaTemperatura
FROM 
    Leitura
GROUP BY 
    DAYOFWEEK(DataLeitura) ORDER BY DiaSemana;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasLeituras,
    buscarLeiturasEmTempoReal,
    obterDadosGraficoMedia
}
