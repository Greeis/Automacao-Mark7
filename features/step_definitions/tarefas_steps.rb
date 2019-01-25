#encoding: UTF-8
require 'faker'

Dado("que o nome da minha tarefa é {string}") do |nome_tarefa|                            
    @nome_tarefa = nome_tarefa
    DAO.new.remover_tarefas(@nome_tarefa, @usuario[:email]) #@usuario[:email] => pega o usuario que foi carreago do hooks
   
    # exemplo: @nome_tarefa = "#{nome_tarefa} - #{Faker::Lorem.characters(10)}" #interpalação de string   
end                                                                                  
                                                                                       
Dado("a data de finalização será {string}") do |data_finalizacao|                              
    @data_tarefa = data_finalizacao    
end                                                                                  
                                                                                       
Dado("quero taguear esta tarefa com:") do |tags|                                    
    @tags = tags.hashes #hashes pega todas as posições do array  
end

Dado("eu já cadastrei esta tarefa e esqueci") do
    steps %(
        Quando faço o cadastro desta tarefa
    ) #reaproveita step
end
                                                                                       
Quando("faço o cadastro desta tarefa") do                                            
    @tarefas_page.cadastrar(@nome_tarefa, @data_tarefa)
end                                                                                  
                                                                                       
Então("devo ver esta tarefas com o status {string}") do |status_tarefa|
    expect(
        @tarefas_page.buscar_tr(@nome_tarefa) # procura um tr no igual ao texto que acabei de cadastrar
    ).to have_content status_tarefa
    # pegar uma informação que faz match com o texto que quero verificar
end       

Então("devo ver a seguinte mensagem:{string}") do |mensagem_alerta|
    expect(@tarefas_page.alerta).to eql mensagem_alerta #comparação de texto com texto
end

Então("devo ver somente {int} tarefa com o nome cadastrado") do |quantidade|         
    
    # Validando no BD
    resultado = DAO.new.buscar_tarefa(@nome_tarefa, @usuario[:email])
    expect(resultado.count).to eql quantidade

    #Validando na Tela
    @tarefas_page.voltar
    @tarefas_page.busca(@nome_tarefa)
    expect(@tarefas_page.busca_trs.size).to eql quantidade #espero que a quantidade de registros buscada seja = a 1 
end

# REMOVER

Dado("que eu tenho uma tarefa indesejada") do
    @nome_tarefa = "Tarefa muito boa para ser removida"
    @data_tarefa = "20/08/2018"
    DAO.new.remover_tarefas(@nome_tarefa, @usuario[:email])
    @tarefas_page.cadastrar(@nome_tarefa, @data_tarefa)
end
   
Quando("eu solicito a exclusão desta tarefa") do
    @tarefas_page.solicita_remove(@nome_tarefa)

end
  
Quando("confirmo a ação de exclusão") do
    @tarefas_page.confirma_modal
end

Então("esta tarefa não deve ser exibida") do
    @tarefas_page.busca(@nome_tarefa)
    expect(@tarefas_page.busca_trs.size).to eql 0 
end

Quando("eu desisto da exclusão") do
    @tarefas_page.desisto_modal
end

Então("esta tarefa deve permanecer na lista") do
    @tarefas_page.busca(@nome_tarefa)
    expect(@tarefas_page.busca_trs.size).to eql 1
end