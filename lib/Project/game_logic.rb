require 'remedy'

class GamePlay
  include Remedy
  def self.start(maze)
    #player = maze.random_cell
    player = maze.[](14,14)
    player.set_player(true)
    puts maze.to_s
    
    user_input = Interaction.new
    
    user_input.loop do |key|
      puts key
      
      if key == "q" or key == "Q" 
        break
      end
      
      #Up key
      if key == "\e[A" then
        if player.connected?(player.up)
          player.set_player(false)
          player = player.up
          player.set_player(true)
        end
      end
      
      #Down key
      if key == "\e[B" then
        if player.connected?(player.down)
          player.set_player(false)
          player = player.down
          player.set_player(true)
        end
      end
      
      #Right key
      if key == "\e[C" then
        if player.connected?(player.right)
          player.set_player(false)
          player = player.right
          player.set_player(true)
        end
      end
      
      #Left key
      if key == "\e[D" then
        if player.connected?(player.left)
          player.set_player(false)
          player = player.left
          player.set_player(true)
        end
      end

      puts maze.to_s
    end
  end
end
