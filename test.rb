require "rubygems"
require "rubygame"

require "./world"

# Initialize the game

# Arbitrary constants
SCREEN_SIZE = [1280, 768]

# Screen initialization
screen = Rubygame::Screen.open SCREEN_SIZE
screen.title = "Solar Berries"

# Event initialization
event_queue = Rubygame::EventQueue.new
event_queue.enable_new_style_events

# Clock initialization
clock = Rubygame::Clock.new
clock.target_framerate = 60
clock.enable_tick_events

# World initialization
testWorld = World.new

running = true
while running do
    elapsed_time = clock.tick().seconds

    event_queue.each do |event|
        case event
            when Events::QuitRequested, Events::KeyReleased
                running = false
        end
    end

    screen.draw_box_s([0,0], SCREEN_SIZE, [0,0,0])
    testWorld.draw(screen)
    testWorld.moveCamera([5,5])

    screen.flip

end
