require './raca'
class Humano < Raca
    def initialize
        @nome_raca = 'Humano'
        @vida = 20
        @ataque = 8
        @defesa = 8
        @inteligencia = 10
        @forca = 10 
    end
end
class Elfo < Raca
    def initialize
        @nome_raca = 'Elfo'
        @vida = 25
        @ataque = 5
        @defesa = 6
        @inteligencia = 20
        @forca = 10 
    end
end
class Orc < Raca
    def initialize
        @nome_raca = 'Orc'
        @vida = 15
        @ataque = 12
        @defesa = 5
        @inteligencia = 2
        @forca = 25
    end
end
class Anao < Raca
    def initialize
        @nome_raca = 'Anão'
        @vida = 18
        @ataque = 9
        @defesa = 11
        @inteligencia = 7
        @forca = 20
    end
end