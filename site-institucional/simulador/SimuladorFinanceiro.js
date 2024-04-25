function Calculo_Financeiro(){
    const VALOR_SAFRA_REAIS = Number(Input_ValorSafra.value)
    const KG_DE_UVA_HECTARE = Number(Input_Qnt_KG_Uva.value)
    const QNT_HECTARES = Number(Input_Qnt_Hectares.value)
    const PESO_PRODUCAO = KG_DE_UVA_HECTARE * QNT_HECTARES

    let PERDA_REAIS = VALOR_SAFRA_REAIS * 0.75;
    let PERDA_KG = (KG_DE_UVA_HECTARE * QNT_HECTARES) * 0.75;
    let PERDA_REAIS_ANO = PERDA_REAIS * 2.5;
    let PERDA_KG_ANO = PERDA_KG * 2.5;

    Resultado.innerHTML = `
Sua expectativa em KG: ${PESO_PRODUCAO}
<br>Valor da expectativa em Reais: ${VALOR_SAFRA_REAIS}
<br>Possível perda: ${PERDA_KG}Kg
<br>Valor perdido em Reais: ${PERDA_REAIS}
<br>Em um ano você poderá um prejuízo de: ${PERDA_KG_ANO}Kg
<br>que equivalem R$${PERDA_REAIS_ANO}`
}