#language:pt

Funcionalidade: Remover uma tarefa
    Para que eu possa deixar meu painel organizado
    Sendo um usuário que possui tarefas indesejadas
    Posso apagar uma tarefa

    @login @logout
    Cenario: Apagar uma tarefa

        Dado que eu tenho uma tarefa indesejada
        Quando eu solicito a exclusão desta tarefa
        E confirmo a ação de exclusão
        Então esta tarefa não deve ser exibida

    @login @logout
    Cenario: Desistir da remocao

        Dado que eu tenho uma tarefa indesejada
        Quando eu solicito a exclusão desta tarefa
        Mas eu desisto da exclusão
        Então esta tarefa deve permanecer na lista
