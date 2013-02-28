jQuery ->
  $('.nested-form').on('click', 'a.nested-remove-link', (e) ->
    e.preventDefault()
    $(this).prev('input[type=hidden]').val("1")
    $(this).parent('.nested-form-model').hide())

  $('.nested-form a.nested-add-link').on('click', (e) ->
    new_id = new Date().getTime()
    
    content = "<div class='nested-form-model'>" +
      "<label for='resource_authors_attributes_" + new_id + "_name'>Name:</label>" +
      "<input id='resource_authors_attributes_" + new_id + "_name' name='resource[authors_attributes]["+ new_id + "][name]' size='30' type='text'>" +
      "<input id='resource_authors_attributes_" + new_id + "__destroy' name='resource[authors_attributes]["+ new_id + "][_destroy]' type='hidden' value='false'>" +
      "<a href='#' class='nested-remove-link'>Remove</a>"
      "</div>"

    $(content).insertBefore(this))