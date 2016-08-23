#= require ./../../default

i18n = (translatePartialLoaderProvider)->
  translatePartialLoaderProvider.addPart "sessions"

i18n.$inject = ["$translatePartialLoaderProvider"]
angular
  .module "SessionApp", ["App"]
  .config i18n