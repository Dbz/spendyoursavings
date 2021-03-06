Kitties.Models.Order = Backbone.Model.extend({
  // url: function() {
  //   return "api/orders";
  // },
  urlRoot: 'api/orders',
  
  initialize: function(options) {
    if(options.listing) {
      this._listing = options.listing;
      this.amount = options.amount;
    }
  },
  
  listing: function() {
    this._listing = this._listing || new Kitties.Models.Listing({}, {});
    return this._listing
  },
  
  parse: function(data) {
    if(data.listing) {
      var listingParams = this.listing().parse(data.listing);
      this.listing().set(listingParams);
      delete data.listing;
    }
    return data;
  }

});
