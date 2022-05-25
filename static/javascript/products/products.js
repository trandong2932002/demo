$(document).ready(function () {
  // select row -> add id to edit, delete forms, add id into url of cusemp
  $("table.tablesorter tbody tr").click(function () {
    row_data = $(this)[0].innerText.split("\t")
    // edit button
    $(".edit-form div input").each(function (index) {
      $(".edit-form #" + $(this).attr("id")).attr("value", row_data[index])
    });
    // delete button
    $(".delete-form #id_delete_id").attr("value", row_data[0])
  });
})  