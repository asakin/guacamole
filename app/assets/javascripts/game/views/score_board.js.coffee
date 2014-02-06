class GC.ScoreBoard extends Backbone.Marionette.Layout
  className: "score-board"
  template: "game/templates/scores"

  initialize: ->
    @score = 0

  serializeData: ->
    score: @score

  increment: (ammount) ->
    @score += ammount
    @_updateScore()

  reset: ->
    @_updateScore()

  _updateScore: ->
    @$(".current-score").html(@score)

