/*Função de navegar entre telas - Lucas*/
function navegar(pagina){
    window.location.href = pagina;
}

/*Função de cadastro - Juliana*/
function cadastrar(){
    const NOME = input_nome.value;
    const SOBRENOME = input_sobrenome.value;
    const EMAIL = input_email.value;
    const TELEFONE = input_telefone.value;
    const SENHA = input_senha.value;
    const CONFIRMACAO_SENHA = input_confirmacaoSenha.value;
    const TOKEN = input_token.value;

    span_avisoCampos.innerHTML = "";

    if(NOME != "" && SOBRENOME != "" && EMAIL != "" && TELEFONE != "" && SENHA != "" && CONFIRMACAO_SENHA != "" && TOKEN != ""){

        // Email terá que ter um @ e um .
        const INDICE_ARROBA = EMAIL.indexOf("@");
        const INDICE_PONTO = EMAIL.indexOf(".");

        
        span_avisoEmail.style.color = 'transparent';
        span_avisoSenha.style.color = 'transparent';
        span_avisoConfirmacaoSenha.style.color = 'transparent';

        // Senha terá que ter pelo menos: 8 caracteres, 1 número, uma letra maiúscula 
        if(INDICE_ARROBA == -1 || INDICE_PONTO == -1){
            span_avisoEmail.innerHTML = "Email inválido";
            span_avisoEmail.style.color = 'red';
            
        } else{
            if(SENHA.length < 8){
                span_avisoSenha.innerHTML = "A senha deve ter pelo menos 8 caracteres";
                span_avisoSenha.style.color = 'red';
    
            } else{
                let existeNumero = false;
    
                for(let numero = 0; numero <= 9; numero++){
                    const INDICE_NUMERO = SENHA.indexOf(`${numero}`);
        
                    if(INDICE_NUMERO != -1){
                        existeNumero = true;
    
                        numero = 10;
                    } 
                }
    
                if(existeNumero == true){
                    
                    let existeLetraMaiuscula = false;
                    let senha_replace = SENHA;
    
                    senha_replace = senha_replace.replace(/\d+/ig, "")
        
                    for(let posicao = 0; posicao < senha_replace.length; posicao++){
                        const LETRA_MAIUSCULA = senha_replace[posicao];
        
                        if(LETRA_MAIUSCULA == LETRA_MAIUSCULA.toUpperCase()){
                            posicao = senha_replace.length;
                            existeLetraMaiuscula = true;
                        } 
                    }
        
                    if(existeLetraMaiuscula == false){
                        span_avisoSenha.innerHTML = "A senha deve conter uma letra maiúscula";
                        span_avisoSenha.style.color = 'red';
    
                    } else{
                        span_avisoConfirmacaoSenha.innerHTML = "";
    
                        if(SENHA != CONFIRMACAO_SENHA){
                            
                            span_avisoConfirmacaoSenha.innerHTML = "As senhas não conferem";
                            span_avisoConfirmacaoSenha.style.color = 'red';
    
                        } else{
                            window.location.href = "../login/login.html";
                        }
                    }
                } else{
                    span_avisoSenha.innerHTML = "A senha deve conter pelo menos um número";
                    span_avisoSenha.style.color = 'red';
                }   
                
            }
        }
        
        

    } else{
        span_avisoCampos.innerHTML = "Preencha todos os campos"
    }

    
    
}

// window.location.href = "./login"