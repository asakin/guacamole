class GC.ScoreBoard extends Backbone.Marionette.Layout
  className: "score-board"
  template: "game/templates/scores"

  initialize: ->
    @score = 0
    @time = "N/A"

  serializeData: ->
    score: @score
    time:  @time

  increment: (ammount) ->
    @score += ammount
    @_updateScoreView()

  setTime: (time) ->
    @time = time
    @_updateTimeView()

  reset: ->
    @score = 0
    @time = "N/A"
    @_updateScoreView()

  _updateScoreView: ->
    @$(".current-score").html(@score)

  _updateTimeView: ->
    @$(".current-time").html(@time)

