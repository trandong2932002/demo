$(document).ready(function () {
  $("#shipped_date_form").submit(function (e) {
    e.preventDefault();
    var serializedData = $(this).serialize();
    $.ajax({
      type: 'POST',
      // url: "{% url 'main_page:shipped_date' %}", ?? not found ?? 
      url: "post/ajax/shipped_date",
      data: serializedData,
      success: function (response) {
        var shipped_date = response.shipped_date
        // change dataset
        myChart1.data.datasets[0].data = shipped_date
        // update chart
        myChart1.update()
      },
      error: function (response) {
      },
    });
  });

  $("#order_discount_form").submit(function (e) {
    e.preventDefault();
    var serializedData = $(this).serialize();
    $.ajax({
      type: 'POST',
      url: "post/ajax/order_discount",
      data: serializedData,
      success: function (response) {
        var order_discount_labels = []
        var order_discount = []
        response.order_discount.forEach(element => {
          order_discount_labels.push(element.discount)
          order_discount.push(element.count)
        });
        // change dataset
        myChart2.data.datasets[0].data = order_discount
        // change label
        myChart2.data.labels = order_discount_labels
        // update chart
        myChart2.update()
      },
      error: function (response) {
      },
    });
  });
})