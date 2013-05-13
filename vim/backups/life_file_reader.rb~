#! /usr/bin/env ruby
require_relative 'toroid'
require_relative 'life'
require 'ostruct'

class LifeFileReader
  attr_accessor :world, :x_center, :y_center, :x_loc, :y_loc, :x_current, 
    :y_current, :file_line_number, :file_line

  def initialize world
    self.world = world
    self.x_center = world.width / 2
    self.y_center = world.height / 2
    self.x_loc = self.x_current = 0
    self.y_loc = self.y_current = 0
    self.file_line_number = 0
  end

  def load_stdin
    STDIN.each do |line|
      self.file_line_number += 1
      self.file_line = line
      parse line
    end
  end

private

  def parse line
    case line 
    when /^[Rr][Aa][Nn][Dd][Oo][Mm]/
      set_random_screen
    when /^#D (.*)$/
      puts "################ #{$1}"
    when /^#P +(\-?[0-9]+) +(\-?[0-9]+)/
      establish_new_origin $1.to_i, $2.to_i
    when /^([.xXoO*]+)/
      set_cells_from_ascii_art $1  
    when /^#Life/, /^#D/, /^#N/
      # just ignore these lines
    else
      raise ">>>>>>> ERROR: " + line
    end
  end

  def set_cell cell, value
    return if cell.value == value
    if value == DeadCell
      DeathFutureStrategy.new(cell).run
    else
      BirthFutureStrategy.new(cell).run
    end
  end
  
  def set_pixel col, row, value
    unless col.between?(0, world.width) and row.between?(0, world.height)
      raise RuntimeError.new "\n" + 
            "################ Error in line #{file_line_number}: #{file_line}" +
            "################ set_pixel(#{col}, #{row}) is out of range in this world"
    end
    set_cell world.rows[row][col], value
  end

  def set_random_screen
    world.cells.each do |cell|
      set_cell cell, [DeadCell, LiveCell].sample
    end
  end

  def establish_new_origin x_origin, y_origin
    self.x_current = self.x_loc = x_origin 
    self.y_current = self.y_loc = y_origin 
  end

  def set_cells_from_ascii_art line
    line.each_char do |next_cell_char|
      if next_cell_char == "."
        set_pixel x_current + x_center, y_current + y_center, DeadCell
      else
        set_pixel x_current + x_center, y_current + y_center, LiveCell
      end
      self.x_current += 1
    end
    self.x_current = x_loc
    self.y_current += 1
  end

end
