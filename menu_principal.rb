


#inicializa em 8 pra que seja verdadeira a condição do while
op = 8


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