class AccountManager.Views.AccountsListAccounts extends Backbone.View

  template: JST['accounts/list_accounts']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template(accounts: @collection))
    this