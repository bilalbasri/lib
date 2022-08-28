import $ from 'jquery';

$(document).ready(function() {

    //check div length
    let content_right_count = 0;
    let content_left_count = 0;
    $('#myDIV p').each(function(){
        content_right_count += $(this).text().length;
    })
    $('#divauthor p').each(function(){
        content_left_count += $(this).text().length;
    })
    if(content_right_count < 500){
        $('#right_content_container').hide();
    }
    if(content_left_count < 100){
        $('#left_content_container').hide();
    }

    //right side
    //See more
    $('#show_more_right').click(show_more_right);
     function show_more_right (e) {
        $('#myDIV').removeClass('show_less');
        $('#myDIV').addClass('show_more');
       
        let i = 'Voir Moins<i class="material-icons add">keyboard_arrow_up</i>';
        $(this).html(i);
        $(this).attr('id','show_less_right');
        $('#show_less_right').click(show_less_right);
        
    };
    //see less
    function show_less_right() {
        $('#myDIV').removeClass('show_more');
         $('#myDIV').addClass('show_less');
        let i = 'Voir Plus<i class="material-icons add">keyboard_arrow_down</i>';
        $(this).html(i);
        $(this).attr('id','show_more_right');
        $('#show_more_right').click(show_more_right);
       
    };
     //left side
     //See more
     $('#show_more_left').click(show_more_left);
     function show_more_left(e) {
        $('#divauthor').removeClass('show_less');
        $('#divauthor').addClass('show_more');
       
        let i = 'Voir Moins<i class="material-icons add">keyboard_arrow_up</i>';
        $(this).html(i);
        $(this).attr('id','show_less_left');
        $('#show_less_left').click(show_less_left);
        
    };
    //see less
    function show_less_left() {
        $('#divauthor').removeClass('show_more');
         $('#divauthor').addClass('show_less');
        let i = 'Voir Plus<i class="material-icons add">keyboard_arrow_down</i>';
        $(this).html(i);
        $(this).attr('id','show_more_left');
        $('#show_more_left').click(show_more_left);
       
    };
   
    // Header burger menu - toggle class
    $(document).on('click', '.header__toggle--button', function () {
        $(this).toggleClass('menu__open');
        $('body').toggleClass('hidden');
        $('#header').toggleClass('menu__open');
        $('.header__nav').toggleClass('menu__open'); 
    });

    // Go to top button
    $(document).on('click', '.go-to-top', function (e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop: 0
        }, 1000);
    });

    // Sticky menu
    var header = $('#header');
    var headerHeight = $('#header').outerHeight();
    var headerOffset = $('#header').offset();
    var goToTop = $('.go-to-top');
    $(window).scroll(function() {    
        var scroll = $(window).scrollTop();
        if (scroll >= headerHeight) {
            header.addClass("sticky-active");
            goToTop.addClass("is-visible");
        } else {
            header.removeClass("sticky-active");
            goToTop.removeClass("is-visible");
        }
    });
    const checkHeaderSticky = setTimeout(function () {
        if (headerOffset.top >= headerHeight) {
            header.addClass("sticky-active");
            goToTop.addClass("is-visible");
        }
    }, 250);
    
    
    // Sliders : Features products
    if ($('.featured-products').length) {
        $('.featured-products').each(function () {
            var thisSection = $(this),
                thisProducts = thisSection.find('.products'),
                thisCard = thisSection.find('.product__card');
            if (thisCard.length > 6) {
                // Featured products slider
                thisProducts.not('.slick-initialized').slick({
                    infinite: false,
                    slidesToShow: 6,
                    slidesToScroll: 1,
                    swipeToSlide: true,
                    dots: true,
                    arrows: true,
                    speed: 500,
                    responsive: [
                        {
                            breakpoint: 992,
                            settings: "unslick"
                        }
                    ]
                });
            }
        });
        // Page products slider
        $('.product__media .slider-for').not('.slick-initialized').slick({
            infinite: false,
            slidesToShow: 1,
            slidesToScroll: 1,
            swipeToSlide: true,
            dots: true,
            arrows: false,
            speed: 500,
        });
        
    }

    /* Start Popups */
    $(document).on('click', '.popup-close', function () {
        $('body').removeClass('no-scroll');
        $(this).parents('.popup').removeClass('active');
    });
    $(document).on('mouseup', function (e) {
        var container = $(".popup-inner");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            $('body').removeClass('no-scroll');
            $('.popup').removeClass('active');
        }
    });
    /* End popups */

});
