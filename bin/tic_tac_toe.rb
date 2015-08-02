#!/usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'game'

cells = Board.generate_empty_board(3,3)

Game.new(cells,Kernel,Kernel).game_loop

