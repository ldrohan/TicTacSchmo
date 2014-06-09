TicTacToeApp = angular.module("TicTacToeApp", [])

TicTacToeApp.controller("gameCtrl", ["$scope", ($scope)->
  
  $scope.movesX = []
  $scope.movesO = []
  turn = 0
  $scope.checkboxes = {1:false, 2: false, 3:false, 4:false, 5:false, 6:false, 7:false, 8:false, 9:false}
  winners = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7],
  ]
  
  $scope.findWinner = ->
    for i in winners
#       console.log i.sort().join(",")
#       console.log $scope.movesO.sort().join(",")
      if i.sort().join(",") is $scope.movesO.sort().join(",")
        alert("Player O Wins!")
      else if i.sort().join(",") is $scope.movesX.sort().join(",")
        alert("Player X Wins!")
      
  $scope.toggle = ->
    if turn % 2 == 0
#       display x
    else
#       display O
  
  $scope.addMove = (position) ->
    turn++
#     console.log(position)
    if turn % 2 == 0
      $scope.movesX.push(position)
      console.log($scope.movesX, turn)
      $scope.player = "X"
    else
      $scope.movesO.push(position)
      console.log($scope.movesO, turn)
      $scope.player = "O"
      if turn >= 5
        $scope.findWinner()
    
  $scope.newGame = ->
    $scope.movesX = []
    $scope.movesO = []
    turn = null
    $scope.checkboxes = {1:false, 2: false, 3:false, 4:false, 5:false, 6:false, 7:false, 8:false, 9:false}
   
])