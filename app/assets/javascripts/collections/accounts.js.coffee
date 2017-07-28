class AccountManager.Collections.Accounts extends Backbone.Collection
  url: '/api/accounts'
  model: AccountManager.Models.Account
  