window.AccountManager =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new AccountManager.Routers.Accounts()
    Backbone.history.start({pushState: true})

$(document).ready ->
  AccountManager.initialize()
