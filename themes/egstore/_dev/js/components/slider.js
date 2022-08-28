import $ from 'jquery';

$(document).ready(() => {
    if ($('#hpSlider').length) {
        /*homepage slider*/
        $('#hpSlider .slick-slider').not('.slick-initialized').slick({
            draggable: true,
            dots: true,
            arrows: false,
            autoplay: true,
            infinite: hswrap,
            speed: hsinterval,
            pauseOnHover: hspause == 'hover' ? true : false ,
            fade: true,
            cssEase: 'cubic-bezier(0.5, 0, 0.4, 0.8)',
            touchThreshold: 100,
            responsive: [{
                breakpoint: 1100,
                settings: {
                  arrows: false,
                }
            }]
        });
    }

    if ($(window).width() > 767 && $('.wrapper-hp-bloc-slide').length) {
        $('.lanceurs.md1 .wrapper-hp-bloc-slide').not('.slick-initialized').slick({
          infinite: false,
          slidesToShow: 3,
          slidesToScroll: 1,
          dots: false,
          arrows: true,
          responsive: [{
              breakpoint: 1025,
              settings: {
                slidesToShow: 3,
                arrows: false
              }
            },
            {
              breakpoint: 992,
              settings: {
                slidesToShow: 2
              }
            }
          ]
        });
    }
});


