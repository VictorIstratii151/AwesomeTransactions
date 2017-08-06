class AccountManager.Views.Account extends Backbone.View

  template: JST['accounts/account']

  events:
    'click #account_info': 'showAccount'
    'click #account_remove': 'deleteAccount'

  initialize: ->
    @collection.on('reset', @render, this)

  showAccount: ->
    Backbone.history.navigate("accounts/#{@model.get('id')}", true)

  deleteAccount: (event) ->
    event.preventDefault()

    @model.destroy
        success: ->
          alert "Deleted successfully."
        error: @handleError
        wait: true


  render: ->
    $(@el).html(@template(account: @model, currencies: @collection))
    this


  handleError: (account, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

