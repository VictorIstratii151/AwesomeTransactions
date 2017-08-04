class AccountManager.Routers.Accounts extends Backbone.Router
    routes:
        '': 'index'
        # 'accounts': 'listAccounts'
        # 'accounts/new': 'newAccount'
        'accounts/:id': 'show'

    initialize: ->
        @collection = new AccountManager.Collections.Accounts()
        @collection.fetch({reset: true})
        # @collection.reset($('#my_content').data('accountsg'))

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
    

    # listAccounts: ->
    #     view2 = new AccountManager.Views.AccountsListAccounts(collection: @collection)
    #     $('#my_content').html(view2.render().el)


    # newAccount: ->
    #     view3 = new AccountManager.Views.AccountsNewAccount(collection: @collection)
    #     $('#my_content').html(view3.render().el)