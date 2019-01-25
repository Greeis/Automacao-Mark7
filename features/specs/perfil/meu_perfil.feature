#language: pt

Funcionalidade: Meu perfil
    Para que eu possa manter meus dados atualizados
    Sendo um usuário
    Posso completar o meu cadastro do perfil

    @logout @ex
    Esquema do Cenário: Atualizar perfil

        Dado que estou autenticado com '<email>' e '<senha>'
        E acesso o meu perfil
        Quando completo o meu cadastro com '<empresa>' e '<cargo>'
        Então devo ver a mensagem de atualização cadastral:
        """
        Perfil atualizado com sucesso.
        """
        Exemplos: 
        | email               | senha  | empresa   | cargo      |
        | graaziele@gmail.com | 123456 | Yahoo     | Developer  |
        | bruna@gmail.com     | 123456 | Google    | QA         |
        | userteste@gmail.com | 123456 | Linkedin  | CTO        |
        | testeuser@gmail.com | 123456 | Facebook  | Estagiario |
        | brenda@gmail.com    | 123456 | Microsoft | CEO        |