jQuery ->
  $('.nested-form').on('click', 'a.nested-remove-link', (e) ->
    e.preventDefault()
    $(this).prev('input[type=hidden]').val("1")
    $(this).parents('.nested-form-model').hide())
  
  $('.nested-form a.nested-add-link').on('click', (e) ->
    new_id = new Date().getTime()
    
    content = $(this).siblings('.nested-form-model').first().clone()
    content.html(content.html().replace(/\_\d+\_/g, '_' + new_id + '_').replace(/\[\d+\]/g, '[' + new_id + ']'))
    content.find('input').val('')
    content.find('textarea').html('')
  
    $(content).insertBefore(this))

  $('.import-file').on('click', (e) ->
    $('#import_modal').modal())

  $('.recommend-modal').on('click', (e) ->
    $('#recommend_modal #user_recommended_resource_resource_id').val($(this).data('id'))
    $('#recommend_modal').modal())
    
  $('.modal-footer .submit').on('click', (e) ->
    $(this).parents('.modal-footer').siblings('.modal-body').find('form').submit())