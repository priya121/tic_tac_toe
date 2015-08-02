#!/usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'tic_tac_toe'

cells = Board.generate_empty_board(3,3)

TicTacToe.new(cells,Kernel,Kernel).game_loop

