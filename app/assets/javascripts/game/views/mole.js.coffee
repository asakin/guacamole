class GC.Mole extends Backbone.Marionette.ItemView
  className: 'mole-container'
  template: 'game/templates/mole'

  events:
    "click .mole": "_onMoleClicked"

  isOutside: ->
    @$(".mole").hasClass("out")
    
  _onMoleClicked: ->
    @trigger("clicked")
