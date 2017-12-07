angular.module('gi.commerce').directive 'giBoltOns'
, ['giDiscountCode', 'giCart', (giDiscountCode, giCart) ->
  restrict: 'E'
  templateUrl: 'gi.commerce.boltOns.html'
  link: ($scope, elem, attrs) ->


    $scope.changeBoltOnStatus = (boltOnItem) ->
      if boltOnItem.is_selected is true
        data = angular.copy(boltOnItem.getData())
        giCart.addItem(data.id, data.name, data.priceList, data.quantity, data.data, [], true)
      else
        index = giCart.getIndexById(boltOnItem.getParentId())
        giCart.removeItem(index)

]
