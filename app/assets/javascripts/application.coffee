# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require turbolinks
#= require_tree .

App = (->
  init = ->
    initClipboard()
    initEditor()
    bindEditor()

  initClipboard = ->
    client = new ZeroClipboard(document.getElementById('install-copy'))

    client.on 'ready', (readyEvent) ->
      client.on 'aftercopy', (event) ->
        console.log 'Copied', event

  initEditor = ->
    editor().setTheme('ace/theme/tomorrow_night')
    editor().getSession().setMode('ace/mode/handlebars')
    editor().setFontSize(16)
    editor().setShowPrintMargin(false)
    editor().setShowFoldWidgets(false)
    editor().setShowInvisibles(false)

    $.get($('.install a').prop('href')).then (resp) ->
      editor().setValue(resp, 1)
      renderBrowser()

  editor = ->
    window.ace.edit('editor')

  renderBrowser = ->
    src = "data:text/html;charset=utf-8,#{encodeURIComponent(editor().getValue())}"
    original_embed = $('#browser')
    new_embed = original_embed.clone()
    new_embed.prop('src', src)
    original_embed.replaceWith(new_embed)

  bindEditor = ->
    editor().getSession().on('change', _.debounce(renderBrowser, 1000, {
      leading: false
      trailing: true
    }))

  return {
    init: init
  }
)()

window.onerror = (e) ->
  debugger

$(-> App.init())
