class GC.MainController extends Backbone.Marionette.Layout
  template: 'game/templates/main_layout'
  className: 'game-console'

  pointsPerWhack:    10
  timePerGame:       30000

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

    @_registerEvents()

  _registerEvents: ->
    # Start the game
    @gameControls.on("start_clicked", @_startGame, @)

    # Whack a Mole
    @gameBoard.on("mole:whacked", @_onMoleWhacked, @)

  _startGame: ->
    @scoreBoard.reset()
    @counter = @timePerGame/1000
    @scoreBoard.setTime(@counter)

    @interval = setInterval((=>
      if @counter == 0
        @_resetGame()
        clearInterval(@interval)
      else
        @counter--
        @counter = 0 if @counter < 0
        @scoreBoard.setTime(@counter)

    ), 1000)

    @gameBoard.start(@timePerGame)

  _resetGame: ->
    @gameBoard.stop()
    @gameControls.reset()

  _onMoleWhacked: ->
    @scoreBoard.increment(@pointsPerWhack)