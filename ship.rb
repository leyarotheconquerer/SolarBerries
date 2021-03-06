require "rubygems"
require "rubygame"
require "matrix"

include Rubygame

class Ship
  def initialize()
    @shipSprites = Sprites::Group.new
    @shipSurface = Surface.load "assets/images/ship.png"
    @location = [100, 100]
  end

  def draw(screen)
    @shipSurface.blit screen, @location
  end
end
