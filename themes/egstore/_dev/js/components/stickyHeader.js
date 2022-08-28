import $ from "jquery";

$(document).ready(function() {

    /*---Body padding---*/
    var header_height = $("#header").innerHeight();
    $("body").css("padding-top", header_height);
    /*---END body padding---*/


    var didScroll;
    var activateSticky = $('#header').outerHeight() + 50;

    $(window).scroll(function(event){
        didScroll = true;
    });

    setInterval(function() {
        if (didScroll) {
            hasScrolled();
            didScroll = false;
        }
    }, 280);

    function hasScrolled() {
        var st = $(this).scrollTop();
        // scrolled passed the height of header
        setTimeout(function () {
            if (st > activateSticky) {
                $('#header').addClass("sticky");
            } else {
                $('#header').removeClass("sticky");
            }
        },350);
    }

});