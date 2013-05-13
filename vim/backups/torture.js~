#!/usr/bin/env mocha
assert = require('assert');
Promise = require('rsvp').Promise;
describe("using reduce to sum integers using promises", function(){
  it("should build the promise pipeline without error", function(){
    var array = [];
    var iters = 1000;
    for (var i=1; i<=iters; i++)
      array.push(i)
    var pZero = new Promise() 
    pZero.resolve(0)
    var result = array.reduce(function(promise, nextVal) {
      return promise.then(function(currentVal) {
        var pNext = new Promise(); 
        pNext.resolve(currentVal + nextVal);
        return pNext;
      });
    }, pZero);
  });
  it("should get correct answer without blowing the nextTick stack", function(done){
    var pZero =  new Promise;
    pZero.resolve(0)
    var array = [];
    var iters = 1000;
    for (var i=1; i<=iters; i++)
      array.push(i)
    var result = array.reduce(function(promise, nextVal) {
      return promise.then(function(currentVal) {
        var pNext = new Promise;
        pNext.resolve(currentVal + nextVal);
        return pNext;
      });
    }, pZero);
    result.then(function(value){
      assert.equal(value, (iters*(iters+1)/2));
      done();
    });
  });
});
