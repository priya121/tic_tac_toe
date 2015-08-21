#!/usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'display'

cells = Board.generate_empty_board

Display.new(cells,Kernel,Kernel).game_loop

