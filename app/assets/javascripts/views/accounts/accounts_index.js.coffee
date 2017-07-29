class AccountManager.Views.AccountsIndex extends Backbone.View

  template: JST['accounts/index']

  # initialize: ->
  #   @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template())#accounts: @collection))
    this