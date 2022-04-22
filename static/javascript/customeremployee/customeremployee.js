$(function () {
  // form submit: callback before submit
  $('form#checkbox-checked').submit(function (e) {
    e.preventDefault();
    var checkbox_results = ''
    $(':checkbox').each(function (index) {
      checkbox_index = $(this).parents()[1].children[1].innerText
      checkbox_checked = $(this).is(':checked')
      checkbox_results += checkbox_index + '_' + checkbox_checked + ','
    })
    // save button
    $(".save-form #id_checkbox").attr("value", checkbox_results)
    $(this).unbind() // bind -> run this func again, and again -> infinite loop
    $(this).submit()
  })
})