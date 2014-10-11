require "rubygems"
require "rubygame"

require "./world"
require "./player"

def moveTowards(location, player)
    delta = [0, 0]
    delta[0] = location[0] - player.position[0]
    delta[1] = location[1] - player.position[1]

    length = Math.sqrt((delta[0] * delta[0] + delta[1] * delta[1]).abs)

    delta[0] = delta[0] / length * player.speed
    delta[1] = delta[1] / length * player.speed

    player.position[0] += delta[0]
    player.position[1] += delta[1]
end

# Initialize the game

# Arbitrary constants
SCREEN_SIZE = [1280, 768]

# Screen initialization
screen = Rubygame::Screen.open SCREEN_SIZE
screen.title = "Solar Berries"

# Event initialization
event_queue = Rubygame::EventQueue.new
event_queue.enable_new_style_events

mousePosition = []

# Clock initialization
clock = Rubygame::Clock.new
clock.target_framerate = 60
clock.enable_tick_events

# World initialization
testWorld = World.new

# Arbitrary player
players = []
players[0] = Player.new

running = true
while running do
    elapsed_time = clock.tick().seconds

    event_queue.each do |event|
        case event
            when Events::MouseMoved
                mousePosition = event.pos
            when Events::MousePressed
                players.each {
                    |player|
                    player.moving = true
                }
            when Events::MouseReleased
                players.each {
                    |player|
                    player.moving = false
                }
            when Events::QuitRequested, Events::KeyReleased
                running = false
        end
    end

    # Clear the screen
    screen.draw_box_s([0,0], SCREEN_SIZE, [0,0,0])

    # And draw stuff
    testWorld.draw(screen)
    testWorld.moveCamera([5,5])

    # Draw the players
    players.each {
        |player|
        if player.moving then
            moveTowards(mousePosition, player)
        end
        player.draw(screen) }

    screen.flip

end
