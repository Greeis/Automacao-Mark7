#encoding: utf-8

class Navbar
    include Capybara::DSL
    def sair
        find('.navbar a[href*=dropdown]').click
        find('.navbar a[href$=logout]').click
    end
end

class Sidebar
    include Capybara::DSL
    def acessar_perfil
        within('aside[class=navigation]') do # dentro dessa barra de navegação # busca coisas que estão dentro do escopo
            click_link 'Perfil' # clica no link com o texto perfil
        end
    end
end