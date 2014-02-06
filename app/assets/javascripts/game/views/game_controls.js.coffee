class GC.GameControls extends Backbone.Marionette.ItemView
  className: "game-controls"
  template: "game/templates/controls"

  events:
    "click button": "_buttonClicked"

  reset:->
    button = @$("button")
    button.removeProp("disabled")
    button.removeClass("started")
    button.html("RESTART GAME")

  _buttonClicked: (event) ->
    button = $(event.target)

    unless button.hasClass("started")
      button.addClass("started")
      button.prop("disabled", "disabled")
      button.html("GAME IN PROGRESS")
      @trigger("start_clicked")
