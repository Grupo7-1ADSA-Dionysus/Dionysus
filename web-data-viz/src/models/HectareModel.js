var database = require("../database/config");

function BuscarHectares(){
    var instrucaoSql = `
    select * from Hectare WHERE fkPropriedade = 1;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    BuscarHectares
}