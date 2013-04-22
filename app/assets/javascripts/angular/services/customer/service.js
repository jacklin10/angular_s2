angular.module('customerService', ['ngResource', 'ui']).
  factory('Customers', function($resource) {
    console.log('getting custoemrs');
    return $resource('/customers.json', {}, {
      index: { method: 'GET', isArray: false},
      create: { method: 'POST' }
    });
  }).
  factory('Customer', function($resource) {
    return $resource('/customers', {}, {
      show: { method: 'GET' },
      update: { method: 'PUT' }
    });
  });
