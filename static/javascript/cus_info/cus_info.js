$(document).ready(function () {

  // add form
  $(".manager .manager-button").find("[data-bs-target=\"#add_order\"]").click(function () {
    var custid = window.location.href.split("/").at(-1)
    $(".add-form .modal-body form .input-box #id_custid").val(custid)
  });

  // edit + delete form
  $("#table_order tbody tr").click(function () {
    row_data = $(this)[0].innerText.split("\t")

    // edit form
    orderdate = parseDateFromString(row_data[3])
    requireddate = parseDateFromString(row_data[4])
    shippedddate = parseDateFromString(row_data[5])

    date_arr = [
      new Date(orderdate[0], orderdate[1], orderdate[2]),
      new Date(requireddate[0], requireddate[1], requireddate[2]),
      new Date(shippedddate[0], shippedddate[1], shippedddate[2]),
    ]

    // insert data into edit form
    $(".edit-form .modal-body form .input-box").each(function (index) {
      // select all input and select fields
      var field = $(this).find("input, select")
      // field is input
      if ($(field).is("input")) {
        // field is input:date
        if ($(field).attr("type") == "date") {
          $(field).val(date_arr[index - 2].toDateInputValue())
        }
        // field is input:<other>
        else {
          $(field).val(row_data[index + 1])
        }
      }
      // field is select
      else if ($(field).is("select")) {
        $(field).val(row_data[index + 1])
      };
    });
    $(".edit-form #order_id").val(row_data[0])

    // edit button to open edit order detail
    if (!(date_arr[0] < date_arr[2])) {
      $("#Orderdetail_" + row_data[0] + " #edit_order_detail").attr("onclick", "window.open('/customerinformation/" + row_data[1] + "/" + row_data[0] + "','_blank')")
    }

    // delete
    $(".delete-form #id_delete_id").val(row_data[0])
  });

  $("#goto_customer_employee").click(function() {
    var custid = window.location.href.split('/')[4]
    $(this).attr("onclick", "window.open('/customeremployee/" + custid + "','_blank')")
    
  })

  // PARSE FUNC
  function parseDateFromString(date) {
    const months = [
      'Jan.', 'Feb.', 'March', 'April', 'May', 'June', 'July', 'Aug.', 'Sep.', 'Oct.', 'Nov.', 'Dec.'
    ]

    if (date.length != 0) {
      var temp = date.split(',')
      var year = temp[1].slice(-4)
      var month_day = temp[0].split(' ')
      var day = ("0" + month_day[1]).slice(-2)
      var month = ("0" + (months.indexOf(month_day[0]) + 1)).slice(-2)
    } else {
      var year = "0000";
      var month = "01";
      var day = "01";
    }


    return [year, month, day]
  };

  Date.prototype.toDateInputValue = (function () {
    var local = new Date(this);
    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
    return local.toJSON().slice(0, 10);
  });

})

