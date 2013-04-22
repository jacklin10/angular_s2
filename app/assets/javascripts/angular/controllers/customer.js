function CustomerCtrl($scope, $location, Customers, Customer) {
  console.log('CustomerCtrl');
  $scope.counter = 0;
  console.log($scope.counter);
  $scope.customer = {name: 'guest', last: 'visitor'};

  $scope.group = 'Dummy Content';

  // $scope.$watch('version4', function(newVal,oldVal){
  //   console.log("--- suck it ----");
  //   console.log(newVal,oldVal);
  // });

  $scope.select2GroupConfig = {
    formatResult: function(item) {
      console.log("format result");
      console.log(item);
      console.log(item.customer.first_name);
      // return item.customer;
      return "Fakeed";
    },
    formatSelection: function(item) {
      console.log("format selection");
      console.log(item);
      // console.log(item.customer.first_name);
      // return item.customer.first_name;
      return "ballz";
    },
    ajax: {
      dataType: 'json',
      url: '/customers/lookup_customer',
      data: function (term, page) {
        return { q: term };
      },
      results: function (data, page) {
        return { results: data };
      }
    }
  };

  $scope.select2GroupConfig.initSelection = function ( el, fn ) {
    fn({ id: 2, text: 'Some group' });
  };


  // $scope.version4 = {
  //   data: function() {
  //      return {'results': $scope.data};
  //   },
  //   id: function (e) { return '1' },
  //   placeholder: 'Find Customer',
  //   formatResult: function(item) {
  //     console.log("format result");
  //     console.log(item);
  //     // return item.customer;
  //     return item.customer.first_name;
  //   },
  //   formatSelection: function(item) {
  //     console.log("format selection");
  //     $scope.ballz = item.customer.first_name;
  //     $scope.version4model = ["idk"];
  //     return item.customer.first_name;
  //   },
  //   ajax: {
  //     dataType: 'json',
  //     url: '/customers/lookup_customer',
  //     data: function (term, page) {
  //       return { q: term, page_limit: 10 };
  //     },
  //     results: function (data, page) {
  //       console.log("results");
  //       console.log(data);
  //       // console.log(data[0].customer.first_name);
  //       // $scope.customer.first_name= "donkeydick";
  //       return { results: data };
  //     }
  //   }
  // }

  };

