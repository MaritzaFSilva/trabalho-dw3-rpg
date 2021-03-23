require_relative './tipos_raca'
require_relative './personagem'
require_relative './classe'

$lista_personagens = []
$classes_salvas = []

def load_static_classes
    classses = [] 
    classses.append Classe.new 'Construtor', 'Construir casas', {forca: 1, inteligencia: 1, vida: -2, ataque: 0, defesa: 0}
    classses.append Classe.new 'Ferreiro', 'Construir espadas e armaduras', {forca: 2, inteligencia: 0, vida: 0, ataque: 1, defesa: 0}
    classses.append Classe.new 'Curandeiro', 'Curar outras unidades', {forca: 3, inteligencia: 3, vida: 0, ataque: -1, defesa: 0}
    classses.append Classe.new 'Guerreiro', 'Atacar e defender', {forca: 2, inteligencia: 1, vida: 0, ataque: 3, defesa: 0}
    classses
end


# Cria uma nova classe 
def create_class
    puts 'Nome da classe a ser criada:'
    nome_classe = gets.strip.to_s
    puts 'Habilidades:'
    habilidade = gets.strip.to_s

    puts '---- Informe os modificadores ----'
    puts "Forca:"
    forca_classe = gets.to_i
    puts "Vida:"
    vida_classe = gets.to_i
    puts "Ataque:"
    ataque_classe = gets.to_i
    puts "Inteligencia:"
    inteligencia_classe = gets.to_i
    puts "Defesa:"
    defesa_classe = gets.to_i

    modificadores = {forca: forca_classe, inteligencia: inteligencia_classe, vida: vida_classe, ataque: ataque_classe, defesa: defesa_classe}
    classe = Classe.new nome_classe, habilidade, modificadores
    $classes_salvas << classe
    puts "Classe #{classe.to_s} salva"
end


# encontrar classes 
# se op_classe = 0 então retorna todas
def find_classes op_classe
    if op_classe != 0
        indice = 0
        $classes_salvas.each do |classe|
            indice+=1
            if op_classe == indice
                return classe
            end
        end
    else
        indice = 0
        $classes_salvas.each do |classe|
            indice+=1
            puts "#{indice} - classe #{classe.nome_classe}."
        end
    end
end

# Caso seja passado em FLAG = 0 ele direciona para criar o usuario da raça selecionada
# caso contrário ele retorna a raça;
def create_character_race flag
    puts "Selecione a raça que deseja:"
    puts "1 - Humano"
    puts "2 - Elfo"
    puts "3 - Orc"
    puts "4 - Anão"
    op_raca = gets.to_i

    if op_raca == 1
        raca = Humano.new
        if flag == 0
            puts " > #{raca.nome_raca}! "
            create_character raca
        else
            return raca
        end
    elsif op_raca == 2
        raca = Elfo.new
        if flag == 0
            puts " > #{raca.nome_raca}! "
            create_character raca
        else
            return raca
        end
    elsif op_raca == 3
        raca = Orc.new
        if flag == 0
            puts " > #{raca.nome_raca}! "
            create_character raca
        else
            return raca
        end
    elsif op_raca == 4
        raca = Anao.new
        if flag == 0
            puts " > #{raca.nome_raca}! "
            create_character raca
        else
            return raca
        end
    else 
       puts 'Tente novamente!'
    end
end


#criar personagem
def create_character raca
    puts "Ainda sobre seu personagem!"
    puts "Nome:"
    nome = gets.strip.to_s
    puts "Idade:"
    idade = gets.strip.to_i

    flag = 0
    while flag == 0
        puts "Escolha a classe a qual seu personagem pertence:"
        op_classe = 0
        find_classes 0
        op_classe = gets.strip.to_i
        
        if (op_classe > 0) && (find_classes op_classe != nil)
            indice = 0
            classe = find_classes op_classe
            if classe != nil
                puts "Classe #{classe.nome_classe} selecionada!"
                personagem = Personagem.new nome, idade, raca, classe
                $lista_personagens << personagem
                flag = 1
                
                personagem.to_s
                puts "Salvo com sucesso!"
            else
                puts 'Erro ao salvar classe'
            end
        else
            puts 'Tente novamente!'
        end 
    end
end


# exibe informações do personsagem
def show_character personagem
    puts '----------------------------------------------------'
    puts "Personagem #{personagem.nome_personagem}\nRaca #{personagem.raca.nome_raca}\nClasses:"
    personagem.classes.each do |classe|
        classe.to_s
    end
    puts "\nVida: #{personagem.vida}\nForca: #{personagem.forca}\nAtaque: #{personagem.ataque}\nDefesa: #{personagem.defesa}\nInteligencia: #{personagem.inteligencia}"
    puts '----------------------------------------------------'
end

#lista de personagens
def list_character
    puts "Listar personagens por: \n1 - Raca\n2 - Classe"
    op_busca = gets.to_i
    
    if op_busca == 1
        op_busca_raca = create_character_race 1
        cont = 0
        $lista_personagens.each do |personagem|
            if personagem.raca.nome_raca == op_busca_raca.nome_raca
                show_character personagem
                cont+=1
            end
        end
        if cont == 0
            puts "Nenhum personagem encontrado!"
        end
    elsif op_busca == 2
        puts 'Escolha uma classe:'
        find_classes 0
        op_busca_classe = find_classes gets.to_i
        cont = 0
        $lista_personagens.each do |personagem|
            personagem.classes.each do |classe|
                if classe.nome_classe == op_busca_classe.nome_classe
                    show_character personagem
                    cont+=1
                end
            end
        end
        if cont == 0
            puts "Nenhum personagem encontrado!"
        end
    else
        puts 'Tente novamente!'
    end
end

#treinar personagem
def training_area 
    puts "Escolha qual personagem deseja treinar:"
    
    indice = 0
    $lista_personagens.each do |personagem|
        indice+=1
        puts "-------------------- #{indice} -------------------- "
        personagem.to_s
        puts '----------------------------------------------------'
    end
    op_personagem = gets.to_i 

    puts "Escolha qual classe deseja incluir:"
    find_classes 0
    op_classe = gets.to_i
    indice = 0
    $lista_personagens.each do |personagem|
        indice+=1
        if op_personagem == indice
            puts ""
            def personagem.treinado classe
                @classes << classe
                @vida = raca.vida + classe.modificadores[:vida]
                @ataque = raca.ataque + classe.modificadores[:ataque]
                @defesa = raca.defesa + classe.modificadores[:defesa]
                @inteligencia = raca.inteligencia + classe.modificadores[:inteligencia]
                @forca = raca.forca + classe.modificadores[:forca]
            end
            classe = find_classes op_classe
            personagem.treinado classe
            puts "Personagem agora:"
            personagem.to_s
            puts ""
        end
    end   
end

#inicializa em 8 pra que seja verdadeira a condição do while
op = 8

$classes_salvas = load_static_classes
while op != 0
    
    puts "\n\n----------------------- MENU -----------------------"
    puts '1 - Cadastrar Personagem'
    puts '2 - Cadastrar classe'
    puts '3 - Treinar'
    puts '4 - Listar personagens'
    op = gets.to_i
    
    if op == 1 
        puts " > Cadastrar Personagem"
        create_character_race 0
    elsif op == 2
        puts " > Cadastrar Classe"
        create_class
    elsif op == 3
        puts " > Treinar"
        training_area
    elsif op == 4
        puts " > Listar Personangens"
        list_character
    elsif op == 0
        puts 'Saindo..'
    else
        puts 'Tente novamente!'
    end
end