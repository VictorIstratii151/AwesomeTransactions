class AccountManager.Collections.Currencies extends Backbone.Collection
  url: '/api/currencies'
  model: AccountManager.Models.Currency
  