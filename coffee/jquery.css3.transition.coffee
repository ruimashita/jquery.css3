(($) ->

  # Ref: http://api.jquery.com/jQuery.cssHooks/
  getVendorPropertyName = (prop) ->
    prefixes = ["Moz", "Webkit", "O", "ms"]
    div = document.createElement("div")

    return prop  if prop of div.style

    _prop = prop.charAt(0).toUpperCase() + prop.substr(1)
    for prefix in prefixes
      vendorProp = prefix + _prop
      return vendorProp  if vendorProp of div.style


  support =
    transition : getVendorPropertyName("transition")
    transitionProperty : getVendorPropertyName("transitionProperty")
    transitionDuration : getVendorPropertyName("transitionDuration")
    transitionTimingFunction : getVendorPropertyName("transitionTimingFunction")
    transitionDelay : getVendorPropertyName("transitionDelay")


  $.cssHooks.transition =
    get: (elem) ->
      elem.style[support.transition]
    set: (elem, value) ->
      elem.style[support.transition] = value

  $.cssHooks.transitionProperty =
    get: (elem) ->
      elem.style[support.transitionProperty]
    set: (elem, value) ->
      elem.style[support.transitionProperty] = value

  $.cssHooks.transitionDuration =
    get: (elem) ->
      elem.style[support.transitionDuration]
    set: (elem, value) ->
      elem.style[support.transitionDuration] = value

  $.cssHooks.transitionTimingFunction =
    get: (elem) ->
      elem.style[support.transitionTimingFunction]
    set: (elem, value) ->
      elem.style[support.transitionTimingFunction] = value

  $.cssHooks.transitionDelay =
    get: (elem) ->
      elem.style[support.transitionDelay]
    set: (elem, value) ->
      elem.style[support.transitionDelay] = value


) jQuery
