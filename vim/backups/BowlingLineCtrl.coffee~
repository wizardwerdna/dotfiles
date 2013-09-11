'use strict'

angular.module('bowlingApp')
  .controller 'MainCtrl', ($scope) ->

    $scope.rolls = []
    $scope.frameScores = []
    $scope.rollDisplay = ""

    $scope.addRoll = (pins)->
      $scope.rolls.push pins
      $scope.frameScores = $scope.$eval 'rolls | frameScores'
      $scope.rollDisplay = $scope.$eval 'rolls | rollDisplay'

    $scope.reset = ->
      $scope.rolls = []
      $scope.frameScores = []
      $scope.rollDisplay = ""

    isGameOver = -> $scope.frameScores.length == 10
    isSecondRoll = -> $scope.rollDisplay.length % 2 == 1
    isTooLargeForSpare = (pins)->
      pins + $scope.rolls[$scope.rolls.length-1] > 10
    isTenthFrame = -> $scope.rollDisplay.length >= 17
    isTenthFrameThirdRollSpareTry = ->
      $scope.rollDisplay[19]!="X" and $scope.rollDisplay.length == 20

    $scope.disabled = (pins)->
      isGameOver() or
      (isSecondRoll() and isTooLargeForSpare(pins) and not isTenthFrame()) or
      (isTenthFrameThirdRollSpareTry() and isTooLargeForSpare(pins))


