'use strict';
describe('matchers', function(){
  it('should check ng-invalid', function(){
    expect(angular.element('<div class="ng-invalid"></div>')).toBeInvalid();
    expect(angular.element('<div class=""></div>')).not.toBeInvalid();
    expect(angular.element('<div class="ng-valid"></div>')).not.toBeInvalid();
    expect(angular.element('<div class="ng-invalid ng-valid"></div>')).not.toBeInvalid();
  });
  it('should check ng-valid', function(){
    expect(angular.element('<div class="ng-valid"></div>')).toBeValid();
    expect(angular.element('<div class=""></div>')).not.toBeValid();
    expect(angular.element('<div class="ng-invalid"></div>')).not.toBeValid();
    expect(angular.element('<div class="ng-valid ng-invalid"></div>')).not.toBeValid();
  });
  it('should check ng-dirty', function(){
    expect(angular.element('<div class="ng-dirty"></div>')).toBeDirty();
    expect(angular.element('<div class=""></div>')).not.toBeDirty();
    expect(angular.element('<div class="ng-pristine"></div>')).not.toBeDirty();
    expect(angular.element('<div class="ng-dirty ng-pristine"></div>')).not.toBeDirty();
  });
  it('should check ng-pristine', function(){
    expect(angular.element('<div class="ng-pristine"></div>')).toBePristine();
    expect(angular.element('<div class=""></div>')).not.toBePristine();
    expect(angular.element('<div class="ng-dirty"></div>')).not.toBePristine();
    expect(angular.element('<div class="ng-pristine ng-dirty"></div>')).not.toBePristine();
  });
  it('should check Shown', function(){
    expect(angular.element('<div></div>')).toBeShown();
    expect(angular.element('<div class="ng-hide"></div>')).not.toBeShown();
  });
  it('should check Hidden', function(){
    expect(angular.element('<div class="ng-hide"></div>')).toBeHidden();
    expect(angular.element('<div></div>')).not.toBeHidden();
  });
  it('should check $Equal', function(){
    expect({foo: 'bar', $$hash: 123}).to$Equal({foo: 'bar'});
    expect({foo: 'bar'}).to$Equal({foo: 'bar', $$hash: 123});
    expect({foo: 'bar', $$hash: 123}).to$Equal({foo: 'bar', $$hash: 123});
  });
  it('should check toHaveBeenCalledOnce', function(){
    var spy = jasmine.createSpy('foo');
    expect(spy).toHaveBeenCalledOnce();
    spy();
    expect(spy).toHaveBeenCalledOnce();
    spy();
    expect(spy).not.toHaveBeenCalledOnce();
  });
  xit('should check toHaveBeenCalledOnceWith', function(){
    var spy = jasmine.createSpy('foo');
    expect(spy).not.toHaveBeenCalledOnceWith(1);
    spy(1);
    expect(spy).toHaveBeenCalledOnceWith(1);
    expect(spy).not.toHaveBeenCalledOnceWith(2);
    spy(3);
    expect(spy).not.toHaveBeenCalledOnceWith(1);
  });
  xit('should check toBeOneOf', function(){
    expect(3).toBeOneOf(1,2,3);
    expect(0).not.toBeOneOf(1,2,3);
  });
  xit('should check toHaveClass', function(){
    expect(angular.element('<div class="moo"></div>')).toHaveClass('moo');
    expect(angular.element('<div class="moo"></div>')).not.toHaveClass('foo');
  });
  xit('should check toThrowMatching', function(){
    expect(function(){
      throw 'foo';
    }).not.toThrowMatching(/bar/);
    expect(function(){
      throw 'foo';
    }).toThrowMatching(/foo/);
  });
});
