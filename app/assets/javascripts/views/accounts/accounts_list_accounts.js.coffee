class AccountManager.Views.AccountsListAccounts extends Backbone.View

  template: JST['accounts/list_accounts']

  initialize: ->

    @currencies = new AccountManager.Collections.Currencies()
    @currencies.fetch({reset: true})
    @currencies.on('reset', @render, this)
        
  render: ->
    $(@el).html(@template(accounts: @collection, currencies: @currencies))
    this