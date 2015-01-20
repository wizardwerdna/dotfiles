'use strict';

/* global describe: true */
/* global it: true */
/* global expect: true */
/* global inject: true */
/* global ngFrom: true */
/* global ngFromHtml: true */

describe('Test a sure thing to confirm the environment is up', function() {
  it('should pass', function(){
    expect(1===1).toBe(true);
  });
});

describe('Test a sure thing to confirm the environment has access to app/', function() {
  /* global result: true */
  it('result should be 1', function(){
    expect(result()).toBe(1);
  });
});

describe('ngFromHtml()', function() {
  it('should work for non-dynamic html', function(){
    var html = '<div></div>';
    var ng_html = '<div class="ng-scope"></div>';
    var ng = ngFromHtml(html);
    expect(ng.prop('outerHTML')).toBe(ng_html);
  });

  it('should work for simple dynamic html', function(){
    var html = '<div>{{1+1}}</div>';
    expect(ngFromHtml(html).text()).toBe('2');
  });

  it('should work for dynamic html with scope data', function() {
    var html = '<div>{{vm.result}}</div>';
    var vm = {result: 1};
    expect(ngFromHtml(html, vm).text()).toBe('1');
  });
});

describe('ngFrom()', function() {
  it('should work for non-dynamic html', function() {
    inject(function($templateCache){
      $templateCache.put('foo.html', '<div></div>');
    });
    var ng_html = '<div class="ng-scope"></div>';
    var ng = ngFrom('foo.html');
    expect(ng.prop('outerHTML')).toBe(ng_html);
  });

  it('should work for dynamic html with scope data', function() {
    var vm = {result: 1};
    inject(function($templateCache){
      $templateCache.put('foo.html', '<div>{{vm.result}}</div>');
    });
    expect(ngFrom('foo.html', vm).text()).toBe('1');
  });

});
