require "rubygems"
require "rubygame"

require "./world"

# Initialize the game

# Screen initialization
screen = Rubygame::Screen.open [1280, 768]
screen.title = "Solar Berries"

# Event initialization
event_queue = Rubygame::EventQueue.new
event_queue.enable_new_style_events

# World initialization
testWorld = World.new

while event = event_queue.wait
    puts event
    testWorld.draw(screen)
    break if event.is_a? Rubygame::Events::QuitRequested

    screen.flip
end
