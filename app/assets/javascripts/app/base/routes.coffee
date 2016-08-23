#= require ./module

LocationPath = ($route, $rootScope, $location)->
  original = $location.path
  $location.path = (path, reload)->
    if reload is false
      lastRoute = $route.current
      un = $rootScope.$on "$locationChangeSuccess", ->
        $route.current = lastRoute
        un()
    original.apply $location, [path]
LocationPath.$inject = ["$route", "$rootScope", "$location"]

RouteProvider = ($locationProvider)->
  $locationProvider.html5Mode
    enabled: true
    requireBase: false
RouteProvider.$inject = ["$locationProvider"]

angular
  .module "CommonApp"
  .config RouteProvider
  .run LocationPath
