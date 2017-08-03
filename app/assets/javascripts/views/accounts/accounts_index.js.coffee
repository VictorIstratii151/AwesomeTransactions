class AccountManager.Views.AccountsIndex extends Backbone.View

  template: JST['accounts/index']

  events:
    'submit #create_new_account': 'createAccount'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendAccount, this)
    @currencies = new AccountManager.Collections.Currencies()
    @currencies.fetch({reset: true})
    @currencies.on('reset', @render, this)

  render: ->
    $(@el).html(@template(currencies: @currencies))
    @collection.each(@appendAccount)
    this

  appendAccount: (account) =>
    accountView = new AccountManager.Views.Account(model: account, collection: @currencies)
    @$('#my_accounts').append(accountView.render().el)


  createAccount: (event) ->
    event.preventDefault()

    attrs = name: $('#new_account_name').val(),
    currency_id: $('#new_account_currency').val(),
    balance: 0

    @collection.create attrs,
      wait: true,
      success: -> 
        $('#create_new_account')[0].reset()
        alert "Created a new account!"
      error: @handleError
      

  handleError: (account, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
