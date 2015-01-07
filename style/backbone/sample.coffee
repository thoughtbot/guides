# app.coffee
window.App =
  initialize: ->
    App.router = new App.Router()
    Backbone.history.start(pushState: true)

$(document).ready ->
  App.initialize()

# collections/photos.coffee
class App.Photos extends Backbone.Collection

# models/photo.coffee
class App.Photo extends Backbone.Model

# router.coffee
class App.Router extends Backbone.Router

# views/photo.coffee
class App.PhotoView extends Backbone.View
