#= require ./../module

defaultTheme =
  primary: "blue"
  accent: "cyan"
  warn: "red"
  background: "grey"

themeConfig = ($mdThemingProvider)->

  $mdThemingProvider.theme("default")
    .primaryPalette defaultTheme.primary,
      'default': '800'
      'hue-1': '500'
      'hue-2': '200'
      'hue-3': 'A100'
    .accentPalette defaultTheme.accent,
      'default': 'A200'
      'hue-1': 'A100'
      'hue-2': 'A400'
      'hue-3': 'A700'
    .warnPalette defaultTheme.warn,
      'default': 'A200'
      'hue-1': 'A100'
      'hue-2': 'A400'
      'hue-3': 'A700'
    .backgroundPalette(defaultTheme.background)
  $mdThemingProvider.alwaysWatchTheme(true)

themeConfig.$inject = ["$mdThemingProvider"]

angular
  .module "CommonApp"
  .config themeConfig