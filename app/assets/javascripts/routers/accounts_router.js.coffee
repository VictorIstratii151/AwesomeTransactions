class AccountManager.Routers.Accounts extends Backbone.Router
    routes:
        '': 'index'
        'accounts': 'listAccounts'
        'accounts/new': 'newAccount'
        # 'accounts/:id': 'show'

    initialize: ->
        @collection = new AccountManager.Collections.Accounts()
        @collection.fetch({reset: true})


    index: ->
        view = new AccountManager.Views.AccountsIndex()
        $('#greetings').html(view.render().el)

    listAccounts: ->
        view2 = new AccountManager.Views.AccountsListAccounts(collection: @collection)
        $('#accounts').html(view2.render().el)


    newAccount: ->
        view3 = new AccountManager.Views.AccountsNewAccount(collection: @collection)
        $('#new_account').html(view3.render().el)