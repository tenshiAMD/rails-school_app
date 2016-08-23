#= require jquery

#= require angular
#= require angular-animate
#= require angular-aria
#= require angular-messages
#= require angular-route
#= require angular-sanitize
#= require angular-cookies
#= require angular-material

#= require ./libs/ngDraggable

#= require moment
#= require angular-moment
#= require angular-filter
#= require ng-rails-csrf
#= require angularjs-viewhead

#= require angular-resource
#= require angular-translate
#= require angular-translate-loader-partial
#= require angular-translate-storage-cookie
#= require angular-translate-storage-local

angular.module("App", ["ngAnimate", "ngAria", "ngMessages", "ngRoute", "ngSanitize",
                       "ngCookies", "ngMaterial", "ngDraggable", "angularMoment",
                       "angular.filter", "ng-rails-csrf", "viewhead", "ngResource",
                       "pascalprecht.translate"])
