$(document).ready(function () {
  $('.button').click(function () {
    if ($(this)[0].value.toLowerCase() == 'delete') {
    }
    else {
      $('.' + $(this)[0].value.toLowerCase() + '-form').toggleClass('active')
    }
  });
  $("table.tablesorter tbody tr").click(function () {
    row_data = $(this)[0].innerText.split("\t")
    // edit button
    $(".edit-form div input").each(function (index) {
      $(".edit-form #" + $(this).attr("id")).attr("value", row_data[index])
    });
    // delete button
    $(".delete-form #id_delete_id").attr("value", row_data[0])
    // change url of customeremployee
    $('#customeremployee-url').attr('href', '/customeremployee/' + row_data[0])
  });
})

$(function () {
  // form submit
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