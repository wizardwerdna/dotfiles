require 'minitest/autorun'
require 'mocha'
require File.expand_path('../../lib/mock_constants/mock_constants', __FILE__)

describe MockConstants do
  subject{MockConstants.new Kernel}

  describe "when target has a predefined constant" do

    let(:target){Module.new}
    before{target.const_set :A, :initial_value}

    it "should modify the target value on #install" do
      subject.on(target).install(A: :updated_value)
      target.const_get(:A).must_equal :updated_value
    end

    it "should restore the target value on #restore" do
      subject.on(target).install(A:3).restore
      target.const_get(:A).must_equal :initial_value
    end

    it "should remove the constant from the target on #remove" do
      subject.on(target).remove(:A)
      target.wont_be :const_defined?, :A
    end

    it "should restore a removed constant and its original value to target on #restore" do
      subject.on(target).remove(:A).restore
      target.const_get(:A).must_equal :initial_value
    end
  end

  describe "when target does not have a predefined constant" do

    let(:target){Module.new}

    it "should add the constant and value to the target on install" do
      subject.on(target).install(A: :new_value)
      target.const_get(:A).must_equal :new_value
    end

    it "should remove the constant from the target on restore" do
      subject.on(target).install(A: :new_value).restore
      target.wont_be :const_defined?, :A
    end
  end

  describe "API" do
    
    it "should should default to targeting Object" do
      MockConstants.new.target.must_equal Object
    end
    
    it "should permit defining a target on creation" do
      subject.target.must_equal Kernel
    end
    
    it "should respond with self to #on, #install and #remove to facilitate chaining" do
      subject.on(Module.new).must_equal subject
      subject.on(Module.new).install.must_equal subject
    end
  
    it "should permit changing a target after creation" do
      subject.on(Module).target.must_equal Module
    end
    
    it "#with should return result of a proc, wrapping it in install, remove and then restore" do
      constants_spec = stub
      removal_list = stub
      return_stub = stub
      proc = lambda{return_stub}
      subject.expects(:install).with(constants_spec)
      subject.expects(:remove).with(removal_list)
      subject.expects(:restore)
      subject.with(constants_spec, removal_list, &proc).must_equal return_stub
    end
    
    it "#with should wrap a block given with install, remove and restore even when proc raises an error" do
      constants_spec = stub
      removal_list = stub
      return_stub = stub
      proc = lambda{raise RuntimeError}
      subject.expects(:install).with(constants_spec)
      subject.expects(:remove).with(removal_list)
      subject.expects(:restore)
      lambda{subject.with(constants_spec, removal_list, &proc)}.must_raise RuntimeError
    end

    it "#with should combine install and remove, but not restore with no block given returning self" do
      constants_spec = stub
      removal_list = stub
      subject.expects(:install).with(constants_spec)
      subject.expects(:remove).with(removal_list)
      subject.expects(:restore).times(0)
      subject.with(constants_spec, removal_list).must_equal subject
    end
  end
  
  describe "API shortcuts" do
    it "MockConstants.on(...) is a shortcut for MockConstants.new.on(...)" do
      subject.expects(:on)
      MockConstants.expects(:new).returns(subject)
      MockConstants.on(Kernel)
    end
    
    it "MockConstants.with(...) is a shortcut for MockConstants.new.with(...)" do
      subject.expects(:with)
      MockConstants.expects(:new).returns(subject)
      MockConstants.with({},[]){}
    end
    
    it "MockConstants.new.remove(:A) is a shortcut for MockConstants.new.remove([:A])" do
      mod=Module.new; mod.const_set :A, 1
      subject.expects(:remove_list).with([:A])
      subject.on(mod).remove(:A)
    end
  end
  
  describe "API Error Checking" do
    it "should not permit you to remove a constant not in the target" do
      lambda{subject.on(Module.new).remove(:A)}.must_raise ArgumentError
    end
    
    it "should not permit you to add a constant previously removed" do
      mod = Module.new; mod.const_set :A, 1
      subject.on(mod).remove(:A)
      lambda{subject.install(A:1)}.must_raise ArgumentError
    end
    
    it "should not permit you to remove a constant previously added or changed" do
      mod = Module.new; mod.const_set :A, 1
      subject.on(mod).install(A:1)
      lambda{subject.remove(:A)}.must_raise ArgumentError
    end

    it "should not permit you to add or change a constant previously added or changed" do
      mod = Module.new
      subject.on(mod).install(A:1)
      lambda{subject.install(A:2)}.must_raise ArgumentError
    end
  end
end
