#encoding: utf-8

class PerfilPage
    include Capybara::DSL
  
    def alertar
      find('.alert-login')
    end
  
    def completar_cadastro(empresa, cargo)
      find('#profile-company').set empresa
      combo = find('select[name$=job]') #dentro do combo
      combo.find('option', text: cargo).select_option #busque uma option que contenha o mesmo texto 
      #que o cargo que esa na documentação e selecione a opção
      click_button 'Salvar'
    end
end
