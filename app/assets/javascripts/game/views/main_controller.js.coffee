class GC.MainController extends Backbone.Marionette.Layout
  template: 'game/templates/main_layout'
  className: 'game-console'

  pointsPerWhack: 10

  regions:
    game_board_region: '.game-board-container'
    score_board_region: '.score-board-container'
    controls_region: '.controls-container'

  onShow: ->
    @gameBoard    = new GC.GameBoard()
    @scoreBoard   = new GC.ScoreBoard()
    @gameControls = new GC.GameControls()

    @game_board_region.show(@gameBoard)
    @score_board_region.show(@scoreBoard)
    @controls_region.show(@gameControls)

    @gameBoard.on("mole:whacked", @_onMoleWhacked, @)


  _onMoleWhacked: ->
    @scoreBoard.increment(@pointsPerWhack)