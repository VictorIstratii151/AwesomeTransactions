class AccountManager.Routers.Accounts extends Backbone.Router
    routes:
        '': 'index'
        'accounts': 'listAccounts'
        # 'accounts/:id': 'show'

    initialize: ->
        @collection = new AccountManager.Collections.Accounts()
        @collection.fetch({reset: true})

    index: ->
        # alert "my home page"
        view = new AccountManager.Views.AccountsIndex()#collection: @collection)
        $('#greetings').html(view.render().el)



    listAccounts: ->
        alert "my accounts page"
        view2 = new AccountManager.Views.AccountsListAccounts()
        $('#accounts').html(view2.render().el)

