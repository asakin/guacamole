# This is the main application
# It only sets up the basic regions of the app
gc.app = new Backbone.Marionette.Application()

gc.app.addRegions({
  mainContainer:  "#game-container"
})

# Allow history with push state
gc.app.on("initialize:after", ->
  gc.app.mainContainer.show(new GC.MainController())
)

# Start the JS application
$( ->
  gc.app.start()
)
