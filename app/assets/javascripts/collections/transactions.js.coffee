class AccountManager.Collections.Transactions extends Backbone.Collection
  url: '/api/transactions'
  model: AccountManager.Models.Transaction
  