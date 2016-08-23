#= require ./../default

trustedHtml = ($sce)->
  (html)->
    $sce.trustAsHtml(html)

trustedHtml.$inject = ["$sce"]

valPresent = ()->
  (val)->
    return false unless angular.isDefined(val) or val?
    return val.length > 0 if val? and angular.isDefined(val.length)
    val?

groupInto = ()->
  (array, count = 1)->
    return unless angular.isArray(array)

    length = array.length
    return array unless length > 1

    group_by = parseInt(length / parseInt(count))
    old_array = angular.extend([], array)
    new_array = []

    while old_array.length > 0
      extract_count = if (old_array.length - group_by) >= 0 then group_by else old_array.length
      new_array.push old_array.splice(0, extract_count)
    new_array

forLoop = ()->
  return (input, start, end)->
    input = new Array(end - start)

    i = 0
    while start < end
      input[i] = start
      start++
      i++

    return input
forLoop.$inject = []

angular
  .module "App"
  .filter "trustedHtml", trustedHtml
  .filter "valPresent", valPresent
  .filter "groupInto", groupInto
  .filter "forLoop", forLoop