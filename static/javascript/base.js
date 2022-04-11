$(document).ready(function () {
    $('.menu-toggle').click(function () {
        if ($('.user-login.active').length == 0) {
            $('.menu-toggle').toggleClass('active')
            $('nav').toggleClass('active')
        }
    })
    $('.user-login').click(function () {
        if ($('.menu-toggle.active').length == 0) {
            $('.user-login').toggleClass('active')
        }
    })
})