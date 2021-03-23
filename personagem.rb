require_relative './tipos_raca'
require_relative './classe'

class Personagem
    attr_accessor :nome_personagem, :idade, :vida, :ataque, :defesa, :inteligencia, :forca, :raca, :classes

    def initialize nome, idade, raca, classe
        @nome_personagem = nome
        @idade = idade
        @raca = raca
        @classes = [classe]

        @vida = raca.vida + classe.modificadores[:vida]
        @ataque = raca.ataque + classe.modificadores[:ataque]
        @defesa = raca.defesa + classe.modificadores[:defesa]
        @inteligencia = raca.inteligencia + classe.modificadores[:inteligencia]
        @forca = raca.forca + classe.modificadores[:forca]

    end

    def to_s
        puts "Personagem #{nome_personagem} da raca #{raca.nome_raca}, das classes:"
        classes.each do |uma_classe|
            uma_classe.to_s
        end
    end



end
