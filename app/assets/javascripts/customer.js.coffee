$(document).ready ->

  format_selection = (item) ->
    item.customer.first_name

  format_result = (item) ->
    item.customer.last_name + ', ' + item.customer.first_name

  $("#e3").select2
    width: '40%'
    placeholder: 'Find Customer'
    id: (e) ->
      1
    ajax:
      url: '/customers/lookup_customer'
      dataType: 'json'
      data: (term, page) ->
        q: term
        page_limit: 10
      results: (data, page) ->
        results: data
    formatResult: format_result
    formatSelection: format_selection
    dropdownCssClass: 'bigdrop'
