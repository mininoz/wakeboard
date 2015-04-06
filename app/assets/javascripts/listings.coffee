$(document).on "page:change", ->
  $('form').on 'change', '.price_from', ->
    $('.price_from').val($(this).val())

  $('form').on 'change', '.price_to', ->
    $('.price_to').val($(this).val())

  $('form').on 'change', '.board_year', ->
    $('.board_year').val($(this).val())

  $('form').on 'change', '.board_brand', ->
    $('.board_brand').val($(this).val())

  $('form').on 'change', '.board_size_from', ->
    $('.board_size_from').val($(this).val())

  $('form').on 'change', '.board_size_to', ->
    $('.board_size_to').val($(this).val())

  $('form').on 'change', '.boot_year', ->
    $('.boot_year').val($(this).val())

  $('form').on 'change', '.boot_brand', ->
    $('.boot_brand').val($(this).val())

  $('form').on 'change', '.boot_size_from', ->
    $('.boot_size_from').val($(this).val())

  $('form').on 'change', '.boot_size_to', ->
    $('.boot_size_to').val($(this).val())