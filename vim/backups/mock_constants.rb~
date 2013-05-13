class MockConstants
  attr_reader :target

  class << self  
    def on target
      new.on target
    end

    def with add_or_update_hash={}, remove_list={}
      new.with add_or_update_hash, remove_list
    end
  end
  
  def initialize target = Object
    @removed_constants = {} 
    @updated_constants = {}
    @added_constants = []
    on target
  end

  def on target
    @target = target
    self
  end
  
  def with update_hash={}, remove_list={}
    install update_hash
    remove remove_list
    return self unless block_given?
    result = yield 
  ensure
    restore if block_given?
    result
  end
  
  def install hash={}
    ensure_not_previously_modified hash.keys
    update_hash hash
    self
  end
  
  def remove symbol_or_list
    symbol_or_list = [symbol_or_list] if symbol_or_list.kind_of? Symbol
    ensure_all_constants_present symbol_or_list
    ensure_not_previously_modified symbol_or_list
    remove_list symbol_or_list
    self
  end
  
  def restore
    @updated_constants.each{|name, value| update_constant name, value}
    @added_constants.each{|name| remove_constant name}
    @removed_constants.each{|name, value| add_constant name, value}
  end

private
 
  def update_hash hash
    hash.each do |name, value|
      if target.const_defined? name
        @updated_constants[name] = target.const_get name
        update_constant name, value
      else
        @added_constants << name
        add_constant name, value
      end
    end
  end

  def remove_list list
    list.each do |name|
      @removed_constants[name] = target.const_get name
      target.send :remove_const, name
    end
  end

  def add_constant name, value
    target.const_set name, value
  end

  def remove_constant name
    target.send :remove_const, name
  end

  def update_constant name, value
    remove_constant name
    add_constant name, value
  end
 
  def previously_modified_constants
    @added_constants | @removed_constants.keys | @updated_constants.keys
  end 

  def ensure_not_previously_modified constant_list
    raise ArgumentError unless (constant_list & previously_modified_constants).empty?
  end

  def ensure_all_constants_present constant_list
    raise ArgumentError unless constant_list.all?{|const| target.const_defined? const}
  end
end
