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

  start: ->
    @stopped = false
    @_tic()

  stop: ->
    @stopped = true
    @_resetBoard()

  _tic: ->
    @_resetBoard()
    @$(".mole").eq(Math.floor(Math.random()*8)).addClass("out")
    unless @stopped
      setTimeout((=>@_tic()), 500+Math.random()*1500)

  _resetBoard: ->
    @$(".mole").removeClass("out")

  _onMoleClicked: (mole) ->
    # Mole is whacked only if it was outside
    if mole.isOutside()
      mole.backIn()
      @trigger("mole:whacked")
