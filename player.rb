require "rubygems"
require "rubygame"

include Rubygame

class Player

    include Sprites::Sprite

    def initialize()
        @image = Surface.load("assets/images/player.png")
        @image = @image.rotozoom(0, 0.25)
        @position = [0, 0]
        @speed = 10
        @moving = false
    end

    def position()
        @position
    end

    def position=(value)
        @position = value
    end

    def speed()
        @speed
    end

    def speed=(value)
        @speed = value
    end

    def moving()
        @moving
    end

    def moving=(value)
        @moving = value
    end

    def draw(surface)
        @image.blit surface, @position
    end
end
