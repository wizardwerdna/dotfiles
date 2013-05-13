require 'set'

class World

  attr_accessor :height, :width, :rows, :cells_with_updated_neighbors

  def initialize height, width
    self.height = height
    self.width = width
    self.cells_with_updated_neighbors = Set.new
  end

  def cells
    Enumerator.new do |enum|
      rows.each{|r| r.each{|c| enum << c}}
    end
  end

  def had_updated_neighbor cell
    self.cells_with_updated_neighbors << cell
  end

  def tick!
    new_cells = Array(cells_with_updated_neighbors).clone
    self.cells_with_updated_neighbors = Set.new
    
    new_cells.each do |cell| 
      cell.next_future
    end

    new_cells.each{|cell| cell.update}
  end

end
