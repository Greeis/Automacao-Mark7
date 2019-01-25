#encoding: utf-8

class CadastroPage
    include Capybara::DSL 
    # incluindo nessa classe todos os recursos do capybara
    
    def acessar_cadastro
        visit '/register'
    end

    def msg
        find('.alert-message')  
    end

    def cadastrar_usr (nome,email,senha)
        find('#register_name').set nome
        find('#register_email').set email
        find('#register_password').set senha
        click_button 'Cadastrar'   
    end
end