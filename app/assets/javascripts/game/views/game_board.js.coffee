class GC.GameBoard extends Backbone.Marionette.ItemView
  className: 'game-board'
  template: 'game/templates/board'

  onShow: ->
    @$(".hole").each( (index, element) ->
      mole = new GC.Mole()
      $(element).append(mole.render().$el)
    )