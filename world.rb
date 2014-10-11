require "rubygems"
require "rubygame"
require "matrix"

include Rubygame

class World
    def initialize()
        @worldSprites = Sprites::Group.new
        @background = Surface.load "assets/images/starfieldTileable.png"
        @cameraPosition = [0,0]
        @backgroundPosition = @cameraPosition
    end

    def moveCamera(deltaVec)
        @cameraPosition[0] += deltaVec[0]
        @cameraPosition[1] += deltaVec[1]

        # Magical modulus making infinite starfields... woot!
        @backgroundPosition[0] = @cameraPosition[0] % @background.width
        @backgroundPosition[1] = @cameraPosition[1] % @background.height

        @cameraPosition
    end

    def absoluteMoveCamera(positionVec)
        @cameraPosition = positionVec

        # Magical modulus making infinite starfields... woot!
        @backgroundPosition[0] = @cameraPosition[0] % @background.width
        @backgroundPosition[1] = @cameraPosition[1] % @background.height

        @cameraPosition
    end

    def cameraPosition()
        @cameraPosition
    end

    def draw(screen)
        # Draw the central background
        @background.blit screen, @backgroundPosition

        # Draw adjacent backgrounds
        @background.blit screen,
            [@backgroundPosition[0] - @background.width, @backgroundPosition[1]]
        @background.blit screen,
            [@backgroundPosition[0] - @background.width, @backgroundPosition[1] + @background.height]
        @background.blit screen,
            [@backgroundPosition[0] - @background.width, @backgroundPosition[1] - @background.height]
        @background.blit screen,
            [@backgroundPosition[0], @backgroundPosition[1] + @background.height]
        @background.blit screen,
            [@backgroundPosition[0], @backgroundPosition[1] - @background.height]
        @background.blit screen,
            [@backgroundPosition[0] + @background.width, @backgroundPosition[1] + @background.height]
        @background.blit screen,
            [@backgroundPosition[0] + @background.width, @backgroundPosition[1] - @background.height]
        @background.blit screen,
            [@backgroundPosition[0] + @background.width, @backgroundPosition[1]]
    end
end
