function CustomerCtrl($scope, $location, Customers, Customer) {
  $scope.customers = {
    data: [
      {id: 1, username: "jacklin10",
        name: "Joe Acklin", email: "jacklin10@gmail.com", text: "Joe Acklin"},
      {id: 1, username: "zacheryph",
        name: "Zachery Hostens", email: "zacheryph@gmail.com", text: "Zachery Hostens"}
    ]
  };
};
