$(document).ready(function () {
  // Listener
  $("#select_all").click(function (e) { 
    $("#table_customer_filter tbody tr:visible td input#cus_check").each(function() {
      $(this).prop("checked", true)
    })
  });

  $("#deselect_all").click(function (e) { 
    $("#table_customer_filter tbody tr:visible td input#cus_check").each(function() {
      $(this).prop("checked", false)
    })
  });

  // AJAX
  $("#customer_filter_form").submit(function (e) {
    e.preventDefault();
    var serializedData = $(this).serialize();
    $.ajax({
      type: 'POST',
      url: 'post/ajax/customer_filter',
      data: serializedData,
      success: function (response) {
        // delete old row from table
        var row_length = $("#table_customer_filter tr").length
        for (let i = 4; i < row_length; i++) {
          $("#table_customer_filter tr")[4].remove()
        }
        // add new row into table
        var customer_filter = response.customer_filter
        customer_filter.forEach(element => {
          console.log(element)
          var row =
          `<tr>
          <td><input type="checkbox" name="" id="cus_check"></td>
          <td>${GetStringNotNull(element.custid)}</td>
          <td>${GetStringNotNull(element.companyname)}</td>
          <td>${GetStringNotNull(element.contactname)}</td>
          <td>${GetStringNotNull(element.phone)}</td>
          <td>${GetStringNotNull(element.fax)}</td>
          <td>${GetStringNotNull(element.qty)}</td>
          <td>${GetStringNotNull(element.amount)}</td>
          </tr>`
          var jrow = $(row);
          $("#table_customer_filter").append(jrow)
        });
        // fetch
        $("#table_customer_filter").trigger("update")
      },
      error: function (response) {
      }
    });
  });

  // Addition func
  function GetStringNotNull(item) {
    return item === null ? "" : item
  }
});