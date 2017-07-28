window.AccountManager =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new AccountManager.Routers.Accounts()
    Backbone.history.start()

$(document).ready ->
  AccountManager.initialize()
