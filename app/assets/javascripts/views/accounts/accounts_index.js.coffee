class AccountManager.Views.AccountsIndex extends Backbone.View

  template: JST['accounts/index']

  events:
    'submit #create_new_account': 'createAccount'

  initialize: ->
    @currencies = new AccountManager.Collections.Currencies()
    @currencies.fetch({reset: true})
    @currencies.on('reset', @render, this)

    @collection.on('reset', @render, this)
    @collection.on('add', @render, this)



  render: ->
    $(@el).html(@template(accounts: @collection, currencies: @currencies))
    this


  createAccount: (event) ->
    event.preventDefault()

    @collection.create name: $('#new_account_name').val(), currency_id: $('#new_account_currency').val(), balance: 0,
      wait: true
