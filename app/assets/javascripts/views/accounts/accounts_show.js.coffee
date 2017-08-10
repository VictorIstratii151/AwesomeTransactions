class AccountManager.Views.AccountsShow extends Backbone.View

    template: JST['accounts/show']

    events:
        'submit #create_new_transaction': 'createTransaction'
        'click #home_button': 'goHome'
        'submit #update_account_name': 'updateName'

    initialize: ->
        @collection.on('reset', @render, this)
        @model.on('change', @render, this)

        @transactions = new AccountManager.Collections.Transactions()
        @transactions.fetch({reset: true})
        @transactions.on('reset', @render, this)
        @transactions.on('add', @render, this)

    goHome: ->
        Backbone.history.navigate("/", true)

    updateName: (event) ->
        event.preventDefault()

        @model.set({name: $('#updated_account_name').val()})
        @model.save null,
            success: ->
                alert "Saved!"
            error: @handleError
            wait: true


    handleError: (account, response) ->
        if response.status == 422
          errors = $.parseJSON(response.responseText).errors
          for attribute, messages of errors
            alert "#{attribute} #{message}" for message in messages

    render: ->
        $(@el).html(@template(account: @model, currencies: @collection, transactions: @transactions.where(account_id: @model.get('id'))))
        this

    createTransaction: (event) ->
        event.preventDefault()

        attrs = amount: $('#new_transaction_amount').val(),
        description: $('#new_transaction_description').val(),
        transaction_date: $('#new_transaction_date').val(),
        account_id: @model.get('id')

        one = parseFloat(@model.get('balance'))
        two = parseFloat($('#new_transaction_amount').val())

        @transactions.create attrs

        @model.set({balance: one + two})
        @model.save()

    