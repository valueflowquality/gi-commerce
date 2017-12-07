angular.module('gi.commerce').factory 'giBoltOnItem'
, ['$rootScope'
, ($rootScope) ->

  boltOnItem = (id, name, priceList, quantity, data, is_selected=false, counts=1) ->
    @setId(id)
    @setData(data.id, name, priceList, quantity, data)
    @is_selected = is_selected
    @setQuantity(counts)


  boltOnItem.prototype.setData = (id, name, priceList, quantity, data) ->
    @_data =
      id: id
      name: name
      priceList: priceList
      quantity: quantity
      data: data

  boltOnItem.prototype.getData = () ->
    @_data

  boltOnItem.prototype.setId = (id) ->
    if (id)
      @_id = id
    else
      console.error('An ID must be provided')

  boltOnItem.prototype.getId = () ->
    @_id

  boltOnItem.prototype.getParentId = () ->
    @_data.id

  boltOnItem.prototype.getName = () ->
    @_data.name

  boltOnItem.prototype.setQuantity = (counts) ->
    @_quantity = counts

  boltOnItem.prototype.getQuantity = () ->
    @_quantity

  boltOnItem.prototype.increase = () ->
    unless @_quantity
      @_quantity = 0
    @_quantity++

  boltOnItem.prototype.decrease = () ->
    unless @_quantity
      @_quantity = 0
    if @_quantity <= 0
      @_quantity = 0
    else
      --@_quantity

  boltOnItem.prototype.getPrice = (priceInfo) ->
    marketCode = priceInfo.marketCode

    if @_data.priceList?.prices?[marketCode]?
      @_data.priceList.prices[marketCode]
    else
      0


  boltOnItem

]
