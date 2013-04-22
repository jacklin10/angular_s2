angular.module('customer_app', ['customerService'])
  .config(['$routeProvider', function($provider) {
    console.log($provider);
    $provider
      .when('/', { templateUrl: '/assets/customers/index.html', controller: 'CustomerCtrl' })
      ;
  }])
  .config(["$httpProvider", function(provider) {
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }]);
