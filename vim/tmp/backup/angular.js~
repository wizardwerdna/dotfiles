'use strict';

describe('build an angular-driven page', function(){
  var page;

  beforeEach(function(){ page = buildPage(); });

  it('should display "test" when "test" is input', function(){
    page.input = 'test';
    expect(page.output).toBe('test');
  });

  it('should display "test2" when "test2" is input', function(){
    page.input = 'test2';
    expect(page.output).toBe('test2');
  });

  function buildPage(){
    var spa;
    module('index.html');
    spa = ngFrom('index.html');
    return {
      set input(string){ spa.find('input').val(string).trigger('input'); },
      get output(){return spa.find('.output').text();}
    };
  }

});
