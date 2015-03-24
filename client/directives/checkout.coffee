angular.module('gi.commerce').directive 'giCheckout'
, ['giCart'
, (giCart) ->
  restrict : 'E',
  scope:
    model: '='
  templateUrl: 'gi.commerce.checkout.html'
  link: ($scope, element, attrs) ->
    $scope.cart = giCart
]