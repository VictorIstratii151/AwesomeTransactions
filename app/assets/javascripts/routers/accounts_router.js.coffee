class AccountManager.Routers.Accounts extends Backbone.Router
    routes:
        '': 'index'
        

  
    index: ->
        alert "my home page"
        view = new AccountManager.Views.AccountsIndex()#collection: @collection)
        $('#accounts').html(view.render().el)



