$(document).ready(function () {
    $('.menu-toggle').click(function () {
        if ($('.user-login.active').length == 0) {
            $('.menu-toggle').toggleClass('active')
            $('nav').toggleClass('active')
        }
    })
    $('.customer-button').click(function () {
        if ($(this).text().toLowerCase() == 'delete') {

        }
        else {
            $('.customer-' + $(this).text().toLowerCase() + '-form').toggleClass('active')
        }
    })
})