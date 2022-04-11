$(function () {
    // call the tablesorter plugin
    $("table").tablesorter({
        theme: 'blue'
    });

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
});