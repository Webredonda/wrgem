# *************************************
#
#   Application
#
#
# *************************************

# -------------------------------------
#   requirements
# -------------------------------------
#= require requirements


# -------------------------------------
#   vendor
# -------------------------------------

#= require pickadate/lib/picker
#= require pickadate/lib/picker.date
#= require pickadate/lib/translations/pt_BR
#= require jqueryui/ui/core
#= require jqueryui/ui/widget
#= require jqueryui/ui/mouse
#= require Slidebars/distribution/0.10.2/slidebars

# -------------------------------------
#   components
# -------------------------------------

#= require components/_accordion
#= require components/behavior
#= require components/_slidebar_options

# -------------------------------------
#   inbox
# -------------------------------------
ready = ->
  # autosize textareas
  $.behavior('autosize').autosize()

  # Fastclick
  FastClick.attach document.body

  $(window).resize(resize).resize()
$(document).ready(ready)
$(document).on('page:load', ready)

