$(document).ready(function () {
    // select row -> add id to edit, delete forms, add id into url of cusemp
    $("table.tablesorter tbody tr").click(function () {
      row_data = $(this)[0].innerText.split("\t")
      // change url of order detail
      $('#orderdetail-url').attr('href', '/customerinfomation/' + row_data[2] + '/' + row_data[1])
    });
  })
  
  