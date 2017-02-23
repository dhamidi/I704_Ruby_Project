require 'remedy'

module Project
  class GamePlay
    include Remedy
    def self.start(maze)
      puts maze.grid[0].count - 1
      puts maze.rows - 1
      player = maze.[](0, maze.grid[0].count - 1)
      target = maze.[](maze.rows - 1, 0)
      player.set_player(true)
      target.set_target(true)
      puts maze.to_s

      user_input = Interaction.new

      user_input.loop do |key|
        puts key

        break if (key == 'q') || (key == 'Q')

        # Up key
        if key == "\e[A"
          if player.connected?(player.up)
            player.set_player(false)
            player = player.up
            player.set_player(true)
          end
        end

        # Down key
        if key == "\e[B"
          if player.connected?(player.down)
            player.set_player(false)
            player = player.down
            player.set_player(true)
          end
        end

        # Right key
        if key == "\e[C"
          if player.connected?(player.right)
            player.set_player(false)
            player = player.right
            player.set_player(true)
          end
        end

        # Left key
        if key == "\e[D"
          if player.connected?(player.left)
            player.set_player(false)
            player = player.left
            player.set_player(true)
          end
        end

        puts maze.to_s

        puts 'whoopie!' if player == target
      end
    end
  end
end
