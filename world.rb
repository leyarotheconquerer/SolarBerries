require "rubygems"
require "rubygame"
require "matrix"

include Rubygame

class World
    def initialize()
        @worldSprites = Sprites::Group.new
        @background = Surface.load "assets/images/starfieldTileable.png"
        @cameraPosition = [0,0]
        puts "Hi there!"
    end

    def draw(screen)
        @background.blit screen, @cameraPosition
    end
end
