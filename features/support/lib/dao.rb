#encoding: UTF-8

require 'mongo'


# objeto de acesso a dados = DAO
class DAO
    attr_accessor :client

    Mongo::Logger.logger = Logger.new('log/mongo.log')

    def initialize 
        # protocolo://usuario:senha@nomeservidor:porta/bancos_de_dados
        str_con = 'mongodb://aluno:qaninja@ds225078.mlab.com:25078/heroku_4m3km28x'
        @conexao = Mongo::Client.new(str_con) #abrindo uma conexao com o db    
    end

    def obter_usuario (email)
        users = @conexao[:users]
        users.find('profile.email' => email).first #retorna o primeiro email que encontrar
    end
    
    def remover_tarefas (nome, email)
        user = obter_usuario(email) #busca o email
        tasks = @conexao[:tasks] #recebe a coleção de tasks
        tasks.delete_many('title' => nome, 'createdBy' => user[':_id']) # deleta a coleção conforme o nome do title
    end

    def buscar_tarefa (nome, email)
        user = obter_usuario(email) #busca o email
        tasks = @conexao[:tasks] #recebe a coleção de tasks
        tasks.find('title' => nome, 'createdBy' => user[':_id']) # deleta a coleção conforme o nome do title
    end

    def remover_usr (email)
        usr = @conexao[:users]
        usr.delete_one('address' => email)
    end
end 