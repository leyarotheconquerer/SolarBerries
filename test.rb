require "rubygems"
require "rubygame"

screen = Rubygame::Screen.open [640, 480]

screen.title = "Hello Rubygame!"

event_queue = Rubygame::EventQueue.new

event_queue.enable_new_style_events

while event = event_queue.wait
    p events
    break if event.is_a? Rubygame::Events::QuitRequested
end
