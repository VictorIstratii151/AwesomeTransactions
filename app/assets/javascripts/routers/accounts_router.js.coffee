class AccountManager.Routers.Accounts extends Backbone.Router
    routes:
        '': 'index'
        'accounts/:id': 'show'

    initialize: ->
        @collection = new AccountManager.Collections.Accounts()
        @collection.fetch({reset: true})
        # @collection.reset($('#my_content').data('accounts'))

        @currencies = new AccountManager.Collections.Currencies()
        @currencies.fetch({reset: true})
        @currencies.on('reset', @render, this)


    index: ->
        view = new AccountManager.Views.AccountsIndex(collection: @collection)
        $('#my_content').html(view.render().el)

    show: (id) ->
        # @account = @collection.findWhere(id: +id)
        @account = new AccountManager.Models.Account({id: +id})
        @account.fetch({reset: true})

        view = new AccountManager.Views.AccountsShow(model: @account, collection: @currencies)
        $('#my_content').html(view.render().el)