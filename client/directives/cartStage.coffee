angular.module('gi.commerce').directive 'giCartStage'
, ['giCart', 'giCountry'
, (Cart, Country) ->
  restrict : 'E'
  templateUrl: 'gi.commerce.cartStage.html'
  scope:
    model: '='
  link: ($scope, elem, attrs) ->
    $scope.cart = Cart
    
    $scope.$watch 'model.userCountry', (newVal) ->
      if newVal?
        Cart.setCountry(newVal.code)

]
