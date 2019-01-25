#language: pt

Funcionalidade: Cadastro de tarefas
    Para que eu possa organizar minha vida
    Sendo um usuário cadastrado
    Posso adicionar novas tarefas no meu Painel
    
    @smoke1 @login @logout
    Cenário: Nova tarefa
        Dado que o nome da minha tarefa é 'Fazer Compras'
        E a data de finalização será '28/08/2018'
        E quero taguear esta tarefa com:
            |tag            |
            |Compras        |
            |SuperMercado   |
            |Ketchup        |
            |Mostarda       |
            |Maionese       |
        Quando faço o cadastro desta tarefa
        Então devo ver esta tarefas com o status 'Em andamento'

    @tentativa_cad @login @logout
    Esquema do Cenário: Tentar cadastrar

        Dado que o nome da minha tarefa é '<nome>'
        E a data de finalização será '<data>'
        Quando faço o cadastro desta tarefa
        Então devo ver a seguinte mensagem:'<mensagem>'

        Exemplos:
            | nome | data       | mensagem                           |
            | ler  | 21/08/2018 | 10 caracteres é o mínimo permitido.|
            |      | 21/08/2018 | Nome é obrigatório.                |
    
    # @login @logout @duplicado
    # Cenário: Tarefa não pode ser duplicada
    #     Dado que o nome da minha tarefa é 'Ler um blog da Grazi'
    #     E a data de finalização será '22/08/2018'
    #     Mas eu já cadastrei esta tarefa e esqueci
    #     Quando faço o cadastro desta tarefa
    #     Então devo ver a seguinte mensagem:'Tarefa duplicada.'
    #     E devo ver somente 1 tarefa com o nome cadastrado
    