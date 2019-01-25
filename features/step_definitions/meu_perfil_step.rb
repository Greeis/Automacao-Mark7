# encoding: UTF-8

Dado("que estou autenticado com {string} e {string}") do |email, senha|
    @login_page.acessar
    @login_page.logar(email, senha)
end
  
Dado("acesso o meu perfil") do
    @side.acessar_perfil
end
  
Quando('completo o meu cadastro com {string} e {string}') do |empresa, cargo|
    @perfil_page.completar_cadastro(empresa, cargo)
end
  
Então("devo ver a mensagem de atualização cadastral:") do |mensagem|
    expect(@perfil_page.alertar).to have_content mensagem
end