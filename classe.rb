class Classe
    attr_accessor :nome_classe, :habilidade, :modificadores, :classes
    
    def initialize nome_classe, habilidade, modificadores
        @nome_classe = nome_classe
        @habilidade = habilidade
        @modificadores = modificadores
    end
    def to_s
        puts nome_classe
    end
end