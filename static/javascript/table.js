$(function () {
  // Make table cell focusable
  // http://css-tricks.com/simple-css-row-column-highlighting/
  if ($('.focus-highlight').length) {
    $('.focus-highlight').find('td, th')
      .attr('tabindex', '1')
      // add touch device support
      .on('touchstart', function () {
        $(this).focus();
      });
  }


  // initialize custom pager script BEFORE initializing tablesorter/tablesorter pager
  // custom pager looks like this:
  // 1 | 2 … 5 | 6 | 7 … 99 | 100
  //   _       _   _        _     adjacentSpacer
  //       _           _          distanceSpacer
  // _____               ________ ends (2 default)
  //         _________            aroundCurrent (1 default)

  var $table = $('table'),
    $pager = $('.pager');

  $.tablesorter.customPagerControls({
    table: $table,                   // point at correct table (string or jQuery object)
    pager: $pager,                   // pager wrapper (string or jQuery object)
    pageSize: '.left a',                // container for page sizes
    currentPage: '.right a',               // container for page selectors
    ends: 2,                        // number of pages to show of either end
    aroundCurrent: 1,                        // number of pages surrounding the current page
    link: '<a href="#">{page}</a>', // page element; use {page} to include the page number
    currentClass: 'current',                // current page class name
    adjacentSpacer: '<span> | </span>',       // spacer for page numbers next to each other
    distanceSpacer: '<span> &#133; <span>',   // spacer for page numbers away from each other (ellipsis = &amp;#133;)
    addKeyboard: true,                     // use left,right,up,down,pageUp,pageDown,home, or end to change current page
    pageKeyStep: 10                        // page step to use for pageUp and pageDown
  });

  // initialize tablesorter & pager
  $table
    .tablesorter({
      theme: 'blue',
      widgets: ['zebra', 'columns', 'filter']
    })
    .tablesorterPager({
      // target the pager markup - see the HTML block below
      container: $pager,
      size: 10,
      output: 'showing: {startRow} to {endRow} ({filteredRows})'
    });
});