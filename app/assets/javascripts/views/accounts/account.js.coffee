class AccountManager.Views.Account extends Backbone.View

  template: JST['accounts/account']

  render: ->
    $(@el).html(@template())
    this
