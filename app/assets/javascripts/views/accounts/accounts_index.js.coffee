class AccountManager.Views.AccountsIndex extends Backbone.View

  template: JST['accounts/index']

 
  render: ->
    $(@el).html(@template())
    this