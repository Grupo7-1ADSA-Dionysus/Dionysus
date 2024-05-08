function Calculo_Financeiro(){
    const VALOR_SAFRA_REAIS = Number(Input_ValorSafra.value)
    const KG_DE_UVA_HECTARE = Number(Input_Qnt_KG_Uva.value)
    const QNT_HECTARES = Number(Input_Qnt_Hectares.value)
    const PESO_PRODUCAO = KG_DE_UVA_HECTARE * QNT_HECTARES

    let PERDA_REAIS = VALOR_SAFRA_REAIS * 0.75;
    let PERDA_KG = (KG_DE_UVA_HECTARE * QNT_HECTARES) * 0.75;
    let PERDA_REAIS_ANO = PERDA_REAIS * 2.5;
    let PERDA_KG_ANO = PERDA_KG * 2.5;

    Titulo.innerHTML = 'RESULTADO'

    Resultado.innerHTML = `
Sua expectativa em KG: <span class="palavra-verde">${PESO_PRODUCAO} KG</span>
<br>
<br>Valor da expectativa em Reais: <span class="palavra-verde">R$ ${VALOR_SAFRA_REAIS}</span>
<br>
<br>Possível perda: <span class="palavra-vermelha">${PERDA_KG} KG</span>
<br>
<br>Valor perdido em Reais:  <span class="palavra-vermelha">R$ ${PERDA_REAIS}</span>
<br>
<br>Em um ano você poderá um prejuízo de: <span class="palavra-vermelha">${PERDA_KG_ANO} Kg</span>
<br>    
<br>que equivalem <span class="palavra-vermelha">R$ ${PERDA_REAIS_ANO}</span>`;

    Resultado.style.fontSize = '20px';
}