class GC.GameBoard extends Backbone.Marionette.ItemView
  className: 'game-board'
  template: 'game/templates/board'

  onShow: ->
    # Create a new Mole in every hole
    @$(".hole").each( (index, element) =>
      mole = new GC.Mole()
      target = $(element)

      # Events must be handled before rendering and appending to different node.
      mole.on("clicked", (-> @_onMoleClicked(mole)), @)
      target.append(mole.render().$el)
    )

  # Start the game
  start: ->
    @stopped = false
    @_tic()

  # Stop the game after the current tic
  stop: ->
    @stopped = true
    @_resetBoard()

  # Perform the mole jumping logic.
  # This should be extracted to some strategy class if the logic
  # becomes "smarter".
  _tic: ->
    @_resetBoard()
    @$(".mole").eq(Math.floor(Math.random()*8)).addClass("out")
    unless @stopped
      setTimeout((=>@_tic()), 500+Math.random()*1500)

  # Not very nice.
  # TODO: keep the Mole objects cached so actions can be performed on them
  # and not directly on the DOM
  _resetBoard: ->
    @$(".mole").removeClass("out")

  _onMoleClicked: (mole) ->
    # Mole is whacked only if it was outside
    if mole.isOutside()
      mole.backIn()
      @trigger("mole:whacked")
