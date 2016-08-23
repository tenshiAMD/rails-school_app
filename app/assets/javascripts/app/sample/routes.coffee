#= require default

RouteProvider = ($locationProvider, $routeProvider)->

  $locationProvider.html5Mode
    enabled: true
    requireBase: false

  homeConfig =
    templateUrl: "/templates/home"
    controller: "HomeCtrl"
    controllerAs: "ctrl"

  $routeProvider
    .when "/", homeConfig
    .otherwise
      redirectTo: "/"

RouteProvider.$inject = ["$locationProvider", "$routeProvider"]

angular
  .module "SampleApp"
  .config RouteProvider