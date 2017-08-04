class AccountManager.Views.AccountsShow extends Backbone.View

    template: JST['accounts/show']

    initialize: ->
        @collection.on('reset', @render, this)
        console.log @collection
        @model.on('change', @render, this)

    render: ->
        $(@el).html(@template(account: @model, currencies: @collection))
        this