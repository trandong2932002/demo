$(document).ready(function () {
  $.ajaxSetup({
    headers: {
      "X-CSRFToken": $('[name=csrfmiddlewaretoken]').val()
    }
  })
  // AJAX
  $("#edit_order_detail_form").submit(function (e) {
    e.preventDefault();
    var rowData = []
    $("#table_order tr").each(function (index) {
      if (index >= 4) {
        var row = []
        var productid = $(this).find('td:eq(1)').text()
        var unitprice = $(this).find('td:eq(2)').text()
        var quantity = $(this).find('td:eq(3)').text()
        var discount = $(this).find('td:eq(4)').text()
        var row = [productid, unitprice, quantity, discount]
        rowData.push(row)
      }
    })
    data = {
      'csrfmiddlewaretoken': $('input[name=csrfmiddlewaretoken]').val(),
      'row_data': rowData,
    }
    var serializedData = JSON.stringify(data)
    var pathname = window.location.pathname
    $.ajax({
      type: 'POST',
      url: pathname + '/post/ajax/order_detail',
      data: serializedData,
      success: function (response) {

      },
      error: function (response) { }
    })
  });

  // BUSSINESS LOGIC FORM CALC
  const product_price = JSON.parse(sessionStorage.getItem('product_price'))
  var productid = 1
  var unitprice = product_price[productid]
  $("#id_unitprice").val(unitprice)
  var quantity = $("#id_qty").val()
  var discount = $("#id_discount").val()
  var amount = quantity
  $("#id_amount").val(amount)

  $("#id_productid").on('change', function () {
    productid = this.value

    unitprice = product_price[productid]
    $("#id_unitprice").val(unitprice)

    amount = parseFloat(parseInt(quantity) * parseFloat(unitprice) * (1 - parseFloat(discount)))
    $("#id_amount").val(amount)
  });

  $("#id_qty").on('change', function () {
    quantity = this.value

    amount = parseFloat(parseInt(quantity) * parseFloat(unitprice) * (1 - parseFloat(discount)))
    $("#id_amount").val(amount)
  });

  $("#id_discount").on('change', function () {
    discount = this.value

    amount = parseFloat(parseInt(quantity) * parseFloat(unitprice) * (1 - parseFloat(discount)))
    $("#id_amount").val(amount)
  });

  // BUTTON
  $("#add_button").click(function () {
    if (!CheckAddValidForm()) {
      return
    }
    var row =
      `<tr>
      <td><input type="checkbox" name="" id="order_detail_check"></td>
      <td>${productid}</td>
      <td>${unitprice}</td>
      <td>${quantity}</td>
      <td>${discount}</td>
      </tr>`
    var jrow = $(row);
    $("#table_order").append(jrow)
    $("#table_order").trigger("update")
  })

  $("#delete_button").click(function () {
    $("#table_order tbody tr").each(function (index) {
      if ($(this).find("#order_detail_check").prop("checked")) {
        $(this).remove()
      }
    })
    $("#table_order").trigger("update")
  })

  $("#edit_button").click(function () {
    if (!CheckEditValidForm()) {
      return
    }
    // smell code, break DRY rule
    var row = null
    $("#table_order tbody tr").each(function (index) {
      if (productid === $(this).find('td:eq(1)').text()) {
        row = this
        return false
      }
    })
    $(row).find('td:eq(3)').html(quantity)
    $(row).find('td:eq(4)').html(discount)
  })


  // TABLE
  $("#table_order tbody").on("click", "tr", function () {
    var productid = $(this).find('td:eq(1)').text()
    $("#id_productid").val(productid)
    $("#id_productid").trigger("change")

    var quantity = $(this).find('td:eq(3)').text()
    $("#id_qty").val(quantity)
    $("#id_qty").trigger("change")

    var discount = $(this).find('td:eq(4)').text()
    $("#id_discount").val(discount)
    $("#id_discount").trigger("change")
  });

  // ADDITION FUNC
  function CheckValidForm() {
    var check = true
    if (quantity <= 0) {
      check = false
      $("#add_warning_quantity").css("display", "block")
    } else {
      $("#add_warning_quantity").css("display", "none")
    }

    if (discount < 0) {
      check = false
      $("#add_warning_discount").css("display", "block")
    } else {
      $("#add_warning_discount").css("display", "none")
    }
    return check
  };

  function CheckAddValidForm() {
    var check = true
    if (!CheckValidForm()) {
      return false
    }
    $("#table_order tbody tr").each(function (index) {
      if (productid === $(this).find('td:eq(1)').text()) {
        check = false
        return false
      }
    })
    if (!check) {
      $("#add_warning_exist").css("display", "block")
      $("#edit_warning_exist").css("display", "none")
      $("#edit_success").css("display", "none")
      $("#add_success").css("display", "none")
    } else {
      $("#add_success").css("display", "block")
      $("#edit_success").css("display", "none")
      $("#add_warning_exist").css("display", "none")
      $("#edit_warning_exist").css("display", "none")
    }
    return check
  }

  function CheckEditValidForm() {
    if (!CheckValidForm()) {
      return false
    }
    var exist = false
    $("#table_order tbody tr").each(function (index) {
      if (productid === $(this).find('td:eq(1)').text()) {
        exist = true
        return false
      }
    })

    if (!exist) {
      $("#edit_warning_exist").css("display", "block")
      $("#add_warning_exist").css("display", "none")
      $("#add_success").css("display", "none")
      $("#edit_success").css("display", "none")
    } else {
      $("#edit_warning_exist").css("display", "none")
      $("#add_warning_exist").css("display", "none")
      $("#add_success").css("display", "none")
      $("#edit_success").css("display", "block")
    }

    return exist
  }


});