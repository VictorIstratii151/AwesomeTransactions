class AccountManager.Views.AccountsNewAccount extends Backbone.View

  template: JST['accounts/new']

  events:
    'submit #create_new_account': 'createAccount'

  initialize: ->
    @collection.on('reset', @render, this)

    @currencies = new AccountManager.Collections.Currencies()
    @currencies.fetch({reset: true})
    @currencies.on('reset', @render, this)
        
  render: ->
    $(@el).html(@template(accounts: @collection, currencies: @currencies))
    this

  createAccount: (event) ->
    event.preventDefault()
    @collection.create name: $('#new_account_name').val(), currency_id: $('#new_account_currency').val(), balance: 0
    $('#create_new_account')[0].reset()

