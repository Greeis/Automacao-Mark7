#encoding: utf-8

class LoginPage
    include Capybara::DSL 
    # incluindo nessa classe todos os recursos do capybara
    def acessar
        visit '/login'
    end

    def alertar
        find('.alert-login')
    end
     
    def logar (email, senha)
        find('#login_email').set email   
        find('input[name=password]').set senha #busca por tipo => tipo[atributo=valor]
        find('button[id*=btnLogin]').click # *= contém o texto btnLogin
    end
end
  