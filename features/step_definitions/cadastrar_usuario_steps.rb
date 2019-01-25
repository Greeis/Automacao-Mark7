# encoding: UTF-8

Dado("que eu estou no formulário de cadastro") do
    @cadastro_page.acessar_cadastro
    DAO.new.remover_usr(@email)
  end
  
  Dado("possuo os seguintes dados:") do |table| #data tables 
        @nome = table.rows_hash['nome'] #pegar a linha que contem 'nome'
        @email = table.rows_hash['email']
        @senha = table.rows_hash['senha']
  end
  
  Quando("faço o meu cadastro") do
    @cadastro_page.cadastrar_usr(@nome, @email, @senha)
  end
  
  Então("vejo a mensagem de alerta {string}") do |mensagem|
    expect(@cadastro_page.msg).to have_content mensagem
  end

  Então("vejo a mensagem {string}") do |mensagem|
    expect(@tarefas_page.painel).to have_content mensagem
  end