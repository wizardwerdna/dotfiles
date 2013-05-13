class Cell

  attr_accessor :x, :y, :world, :value, :neighbors, :live_neighbors, :future

  def initialize x, y, world
    self.x = x
    self.y = y
    self.world = world
    self.value = DeadCell
    self.neighbors = []
    self.live_neighbors = 0
  end

  def next_future
    self.future = value.future(self)
  end

  def neighboring_change change
    self.live_neighbors += change
    world.had_updated_neighbor(self)
  end

  def change_value_and_notify_neighbors value, change
    self.value = value
    neighbors.each{|n| n.neighboring_change change} 
  end

  def update
    future.run
  end

  def to_s
    "Cell(x:#{x}, y:#{y}, '#{value.to_s}', #{live_neighbors}n, #{future.inspect}"
  end
  
private

  def future_birth?
    value == DeadCell && future == LiveCell
  end

  def future_death?
    value == LiveCell && future == DeadCell
  end

end
