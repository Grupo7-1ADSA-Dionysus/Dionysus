function calcularPerda(){
    const VALOR_SAFRA_REAIS = Number(input_valorSafraReais.value);
    const PRODUCAO_KG = Number(input_producaoKg.value);
    const QTD_HECTARE = Number(input_qtdHectar.value);

    const PERDA_REAIS = VALOR_SAFRA_REAIS * 0.75;
    const PERDA_KG = (PRODUCAO_KG * QTD_HECTARE) * 0.75;
    const PERDA_REAIS_ANO = PERDA_REAIS * 2.5;
    const PERDA_KG_ANO = PERDA_KG * 2.5;

    alert(`Sua expectativa em KG: ${PRODUCAO_KG * QTD_HECTARE}
    Valor da expectativa em Reais: ${VALOR_SAFRA_REAIS}
    Possível perda: ${PERDA_KG}Kg
    Valor perdido em Reais: ${PERDA_REAIS}
    Em um ano você poderá um prejuízo de: ${PERDA_KG_ANO}Kg, que equivalem R$${PERDA_REAIS_ANO}
    
    `)

}