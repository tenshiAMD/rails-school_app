#= require ./../module

i18n = ($translateProvider, $translatePartialLoaderProvider)->
  $translateProvider.useLoader "$translatePartialLoader",
    urlTemplate: "/locales/{part}/{lang}.json"

  $translateProvider.preferredLanguage("en").useSanitizeValueStrategy('escaped').useLocalStorage()
i18n.$inject = ["$translateProvider", "$translatePartialLoaderProvider"]

i18nRunner = ($rootScope, $translate)->
  $rootScope.$on "$translatePartialLoaderStructureChanged", ->
    $translate.refresh()
i18nRunner.$inject = ["$rootScope", "$translate"]

i18nErrorHandler = ($q, $log)->
  (part, lang)->
    $log.error "/locales/#{part}/#{lang} part was not loaded."
    $q.when {}

angular.module "CommonApp"
  .config i18n
  .run i18nRunner