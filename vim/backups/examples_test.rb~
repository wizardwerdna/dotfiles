require 'minitest_helper'
require File.expand_path('../../lib/mock_constants/base', __FILE__)

describe MockConstants::Base do
  subject{MockConstants::Base.new}
  let(:target){Module.new}
  before do
    target.const_set :A, :initialA
    target.const_set :B, :initialB
    target.const_set :C, :initialC
    subject.on(target)
  end

  it "should work properly with complex #with, using a block" do
    subject.with({A: :newA, X: :initialX}, :C) do
      target.const_get(:A).must_equal :newA
      target.const_get(:B).must_equal :initialB
      target.wont_be :const_defined?, :C
      target.const_get(:X).must_equal :initialX
    end
    target.const_get(:A).must_equal :initialA
    target.const_get(:B).must_equal :initialB
    target.const_get(:C).must_equal :initialC
    target.wont_be :const_defined?, :X
  end

  it "should work properly with complex #with, without a block" do
    subject.with({A: :newA, X: :initialX}, :C)
    target.const_get(:A).must_equal :newA
    target.const_get(:B).must_equal :initialB
    target.wont_be :const_defined?, :C
    target.const_get(:X).must_equal :initialX
  end

  it "should restore properly with complex #with, without a block" do
    subject.with({A: :newA, X: :initialX}, :C).restore
    target.const_get(:A).must_equal :initialA
    target.const_get(:B).must_equal :initialB
    target.const_get(:C).must_equal :initialC
    target.wont_be :const_defined?, :X
  end

  it "should work properly with complex #install and #remove" do
    subject.install(A: :newA, X: :initialX).remove(:C)
    target.const_get(:A).must_equal :newA
    target.const_get(:B).must_equal :initialB
    target.wont_be :const_defined?, :C
    target.const_get(:X).must_equal :initialX
  end 

  it "should restore properly after complex #install and #remove" do
    subject.install({A: :newA, X: :initialX}).remove(:C).restore
    target.const_get(:A).must_equal :initialA
    target.const_get(:B).must_equal :initialB
    target.const_get(:C).must_equal :initialC
    target.wont_be :const_defined?, :X
  end

end
