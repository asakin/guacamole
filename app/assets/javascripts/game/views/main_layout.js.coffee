class GC.MainLayout extends Backbone.Marionette.Layout
  template: 'game/templates/main_layout'
  className: 'game-console'

  regions:
    game_board: '.game-board-container'
    score_board: '.score-board-container'
    controls: '.controls-container'

  onShow: ->
    gameBoard    = new GC.GameBoard()
    scoreBoard   = new GC.ScoreBoard()
    gameControls = new GC.GameControls()

    @game_board.show(gameBoard)
    @score_board.show(scoreBoard)
    @controls.show(gameControls)

