#= require ./../module

HomeCtrl = ()->

  console.log('HomeCtrl: running!')

HomeCtrl.$inject = []

angular
  .module "SampleApp"
  .controller "HomeCtrl", HomeCtrl
