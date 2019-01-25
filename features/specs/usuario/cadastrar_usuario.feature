#language: pt
Funcionalidade: Cadastro de usuários
    Sendo um visitante
    Posso fazer meu cadastro
    Para poder gerenciar minhas tarefas

    Contexto: Formulário
        Dado que eu estou no formulário de cadastro

    @cad @logout
    Cenário: Cadastro simples
        
        E possuo os seguintes dados:
            | nome  | Graziele                |
            | email | grazi.teste@hotmail.com |
            | senha | 123456                  |
        Quando faço o meu cadastro 
        Então vejo a mensagem "Olá, Graziele"

    @cad
    Esquema do Cenario: Campos obrigatorios

        E possuo os seguintes dados:
        | nome  | <nome>  |
        | email | <email> |
        | senha | <senha> |
        Quando faço o meu cadastro 
        Então vejo a mensagem de alerta "<saida>"

        Exemplos:
            | nome     | email                    | senha  | saida                |
            |          | grazi.teste@hotmail.com  | 123456 | Nome é obrigatório.  |
            | Graziele |                          | 123456 | Email é obrigatório. |
            | Graziele | grazi.teste@hotmail.com  |        | Informe uma senha.   |