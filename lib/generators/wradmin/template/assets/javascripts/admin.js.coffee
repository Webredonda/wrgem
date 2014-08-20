# -------------------------------------
#   Imports
# -------------------------------------
#= require jquery-1.10.2
#= require jquery-ui-1.9.1
#= require js/bootstrap.min
#= require jquery.remotipart

#= require smooth-sliding-menu

#= require console-numbering
#= require to-do-admin
#= require jquery.sparkline
#= require sparkline-chart
#= require select-checkbox

#= require jPushMenu
#= require side-chats
#= require scroll/jquery.nanoscroller
#= require kalendar/kalendar
#= require kalendar/edit-kalendar

#= require validation/parsley.min
#= require validation/demo-formvalidation

#= require redactor-rails

#= require bootstrap-datepicker/js/bootstrap-datepicker

#= require form-components

#= require light-box/js/lightbox-2.6.min
#= require light-box/js/modernizr.custom



#= require jquery-fileupload/basic
#= require jquery-fileupload/vendor/tmpl

humanize = (size) ->
  units = ["bytes", "KB", "MB", "GB", "TB", "PB"]
  ord = Math.floor(Math.log(size) / Math.log(1024))
  ord = Math.min(Math.max(0, ord), units.length - 1)
  s = Math.round((size / Math.pow(1024, ord)) * 100) / 100
  s + " " + units[ord]




jQuery ->
  $('#fileupload').fileupload
    dataType: "script"
    timeout: 600000
    limitConcurrentUploads: 3

    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('#galleries').append(data.context)
        data.context.find('.details .image span').html(humanize(file.size))
        data.submit()
      else
        alert("#{file.name} is not a gif, jpeg, or png image file")

    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar span.upload').css('width', progress + '%')

    done: (e, data) ->
      data.context.remove()

    fail: (e, data) ->
      data.context.find('.bar').removeClass("progress").addClass("error")
      data.context.find('.details .image').css('background-image', "url('../img/dialog-warning.png')")
      alert("#{data.files[0].name} não conseguiu fazer o upload.")

  $("form.simple_form[data-remote=true]").submit ->
    $("#preload").css("background", "rgba(0, 0, 0, 0.7)").fadeIn()
    return

  $("form.simple_form[data-remote=true]").bind "ajax:success", ->
    $("#preload").css("background", "rgba(0, 0, 0, 0.9)").fadeOut()
  return




$(document).ready ->
  $('.alert.alert-success').fadeIn().delay(3000).fadeOut()

$(window).load ->
  $("#preload").delay(1000).fadeOut 500

  $(".form-group.image").fadeOut()
  $(".form-group.image .col-sm-9 img").parent().parent().parent().fadeIn()

  $("#admin_advertisement_local").change ->
    index = $(this).val() - 1
    $(".form-group.image input.file").val("")
    $(".form-group.image").fadeOut()
    $(".form-group.image:eq("+index+")").fadeIn()













