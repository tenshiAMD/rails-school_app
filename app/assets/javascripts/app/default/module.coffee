#= require ./../../default

i18n = (translatePartialLoaderProvider)->
  translatePartialLoaderProvider.addPart "default"

i18n.$inject = ["$translatePartialLoaderProvider"]
angular
  .module "DefaultApp", ["CommonApp"]
  .config i18n