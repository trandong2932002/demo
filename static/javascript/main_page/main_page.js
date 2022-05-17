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
        // change upper bound of axis y
        myChart2.config._config.options.scales.y.max = Math.round(Math.max(...order_discount) * 1.1)
        // update chart
        myChart2.update()
      },
      error: function (response) {
      },
    });
  });

  $("#revenue_form").submit(function (e) {
    e.preventDefault();
    var serializedData = $(this).serialize();
    $.ajax({
      type: 'POST',
      url: "post/ajax/revenue",
      data: serializedData,
      success: function (response) {
        console.log(response)
        var revenue_datasets = response.revenue_datasets
        var revenue_labels = []
        response.revenue_labels.forEach(element => {
          revenue_labels.push(GetMonthYear(element))
        });
        // change upper bound of axis y
        if (response.type != 10) { // only 1 category
          myChart3.config._config.options.scales.y.max = Math.round(Math.max(...revenue_datasets[0].data) * 1.1)
        } else { // all category
          var max = Math.round(Math.max(...revenue_datasets[0].data) * 1.1)
          for (let index = 1; index < revenue_datasets.length; index++) {
            var temp = Math.round(Math.max(...revenue_datasets[index].data) * 1.1)
            if (temp > max) {
              max = temp
            }
          }
          myChart3.config._config.options.scales.y.max = max
        }
        // change dataset
        myChart3.data.datasets = revenue_datasets
        console.log(myChart3.data)
        // change label
        myChart3.data.labels = revenue_labels
        // update chart
        myChart3.update()
      },
      error: function (response) {
      },
    });
  });

  // Addition func
  function GetMonthYear(date) {
    var temp = new Date(date)
    var month = temp.toLocaleString('default', { month: 'short' });
    var year = temp.getFullYear()
    return month + ' ' + year
  }
})