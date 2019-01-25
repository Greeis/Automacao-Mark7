#encoding: UTF-8
#language: pt

Funcionalidade: Login
    Para que eu possa cadastrar e gerenciar minhas tarefas
    Sendo um usuario
    Posso acessar o sistema com meu email e senha previamente cadastrado

Contexto: Home
    Dado que eu acesso o sistema

@smoke @sprint @logout
Cenario: Usuario autenticado

    Quando faco login com 'graaziele@gmail.com' e '123456'
    Então vejo a seguinte mensagem de boas vindas 'Olá, Graziele'

@tentativa_login
Esquema do Cenario: Tentativa de login

    Quando faco login com '<email>' e '<senha>'
    Então vejo a seguinte mensagem de alerta '<saida>'
    
    Exemplos:
      | email               | senha   | saida                       |
      | graaziele@gmail.com | xpto123 | Senha inválida.             |
      | eulala@papito.io    | 123456  | Usuário não cadastrado.     |
      |                     | 123456  | Email incorreto ou ausente. |
      | graaziele@gmail.com |         | Senha ausente.              |
 