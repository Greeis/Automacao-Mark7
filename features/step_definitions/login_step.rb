#encoding: UTF-8
Dado("que eu acesso o sistema") do
    @login_page.acessar
  end
  
  Quando("faco login com {string} e {string}") do |email, senha|
    @login_page.logar(email, senha)
  end
  
  Então("vejo a seguinte mensagem de boas vindas {string}") do |mensagem|
    expect(@tarefas_page.painel).to have_content mensagem #espero que no painel_tarefas (busca o elemento na classe TarefasPage)  contenha a mensagem
    #fazendo dessa forma, deixa a busca mais assertiva
  end
  
  Então("vejo a seguinte mensagem de alerta {string}") do |mensagem|
    sleep 10
    expect(@login_page.alertar).to have_content mensagem
  end