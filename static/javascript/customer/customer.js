$(document).ready(function () {
  $('.button').click(function () {
    if ($(this)[0].value.toLowerCase() == 'delete') {
    }
    else {
      $('.' + $(this)[0].value.toLowerCase() + '-form').toggleClass('active')
    }
  });
  // select row -> add id to edit, delete forms, add id into url of cusemp
  $("table.tablesorter tbody tr").click(function () {
    row_data = $(this)[0].innerText.split("\t")
    // edit button
    $(".edit-form div input").each(function (index) {
      $(".edit-form #" + $(this).attr("id")).attr("value", row_data[index + 1])
    });
    // delete button
    $(".delete-form #id_delete_id").attr("value", row_data[1])
  });
})

