var database = require("../database/config");

function buscarUltimasLeituras(fkHectare, limite_linhas) {

    var instrucaoSql = `
        SELECT Umidade,
        Temperatura,
		DATE_FORMAT(DataLeitura,'%H:%i:%s') as DataLetura
        FROM Leitura 
        WHERE fkHectare = 1
        ORDER BY IdDado DESC LIMIT ${limite_linhas};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarLeiturasEmTempoReal(fkHectare) {

    var instrucaoSql = ` SELECT Umidade,
        Temperatura,
		DATE_FORMAT(DataLeitura,'%H:%i:%s') as DataLetura
        FROM Leitura 
        WHERE fkHectare = 1
        ORDER BY IdDado DESC LIMIT 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterDadosGraficoMedia() {

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

function exibirHectares(nomePropriedade) {

    var instrucaoSql = ` 
    SELECT count(IdHectare) FROM Hectare 
	JOIN Propriedade ON IdPropriedade = fkPropriedade
		WHERE Propriedade.nome = '${nomePropriedade}';`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function exibirAreaFazenda(nomePropriedade) {

    var instrucaoSql = ` 
    SELECT IdPropriedade, Area FROM Propriedade 
		WHERE Nome = '${nomePropriedade}';`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrarHectares(idPropriedade) {
    var instrucaoSql = ` 
    INSERT INTO Hectare(Status_Sensor, Longitude, Latitude, fkPropriedade) 
	VALUES ('Ok', '-20.00000100', '-40.00000100', ${idPropriedade});`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasLeituras,
    buscarLeiturasEmTempoReal,
    obterDadosGraficoMedia,
    exibirHectares,
    exibirAreaFazenda,
    cadastrarHectares
}
