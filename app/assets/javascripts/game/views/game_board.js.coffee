class GC.GameBoard extends Backbone.Marionette.ItemView
  className: 'game-board'
  template: 'game/templates/board'

  onShow: ->
    @$(".hole").each( (index, element) =>
      mole = new GC.Mole()
      target = $(element)

      # Events must be handled before rendering and appending to different node.
      mole.on("clicked", (-> @_onMoleClicked(mole)), @)
      target.append(mole.render().$el)
    )

  _onMoleClicked: (mole) ->
    # Mole is whacked only if it was outside
    if mole.isOutside()
      @trigger("mole:whacked")
