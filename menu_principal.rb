require_relative './tipos_raca'
require_relative './personagem'
require_relative './classe'

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
      
    elsif op == 2
        puts " > Cadastrar Classe"
        create_class
    elsif op == 3
        puts " > Treinar"
       
    elsif op == 4
        puts " > Listar Personangens"
        
    elsif op == 0
        puts 'Saindo..'
    else
        puts 'Tente novamente!'
    end
end