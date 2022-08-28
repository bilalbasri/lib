/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 22);
/******/ })
/************************************************************************/
/******/ ({

/***/ 0:
/***/ (function(module, exports) {

module.exports = jQuery;

/***/ }),

/***/ 22:
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(3);
module.exports = __webpack_require__(5);


/***/ }),

/***/ 3:
/***/ (function(module, exports, __webpack_require__) {

"use strict";


function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

(0, _jquery2['default'])(document).ready(function () {

    //check div length
    var content_right_count = 0;
    var content_left_count = 0;
    (0, _jquery2['default'])('#myDIV p').each(function () {
        content_right_count += (0, _jquery2['default'])(this).text().length;
    });
    (0, _jquery2['default'])('#divauthor p').each(function () {
        content_left_count += (0, _jquery2['default'])(this).text().length;
    });
    if (content_right_count < 500) {
        (0, _jquery2['default'])('#right_content_container').hide();
    }
    if (content_left_count < 100) {
        (0, _jquery2['default'])('#left_content_container').hide();
    }

    //right side
    //See more
    (0, _jquery2['default'])('#show_more_right').click(show_more_right);
    function show_more_right(e) {
        (0, _jquery2['default'])('#myDIV').removeClass('show_less');
        (0, _jquery2['default'])('#myDIV').addClass('show_more');

        var i = 'Voir Moins<i class="material-icons add">keyboard_arrow_up</i>';
        (0, _jquery2['default'])(this).html(i);
        (0, _jquery2['default'])(this).attr('id', 'show_less_right');
        (0, _jquery2['default'])('#show_less_right').click(show_less_right);
    };
    //see less
    function show_less_right() {
        (0, _jquery2['default'])('#myDIV').removeClass('show_more');
        (0, _jquery2['default'])('#myDIV').addClass('show_less');
        var i = 'Voir Plus<i class="material-icons add">keyboard_arrow_down</i>';
        (0, _jquery2['default'])(this).html(i);
        (0, _jquery2['default'])(this).attr('id', 'show_more_right');
        (0, _jquery2['default'])('#show_more_right').click(show_more_right);
    };
    //left side
    //See more
    (0, _jquery2['default'])('#show_more_left').click(show_more_left);
    function show_more_left(e) {
        (0, _jquery2['default'])('#divauthor').removeClass('show_less');
        (0, _jquery2['default'])('#divauthor').addClass('show_more');

        var i = 'Voir Moins<i class="material-icons add">keyboard_arrow_up</i>';
        (0, _jquery2['default'])(this).html(i);
        (0, _jquery2['default'])(this).attr('id', 'show_less_left');
        (0, _jquery2['default'])('#show_less_left').click(show_less_left);
    };
    //see less
    function show_less_left() {
        (0, _jquery2['default'])('#divauthor').removeClass('show_more');
        (0, _jquery2['default'])('#divauthor').addClass('show_less');
        var i = 'Voir Plus<i class="material-icons add">keyboard_arrow_down</i>';
        (0, _jquery2['default'])(this).html(i);
        (0, _jquery2['default'])(this).attr('id', 'show_more_left');
        (0, _jquery2['default'])('#show_more_left').click(show_more_left);
    };

    // Header burger menu - toggle class
    (0, _jquery2['default'])(document).on('click', '.header__toggle--button', function () {
        (0, _jquery2['default'])(this).toggleClass('menu__open');
        (0, _jquery2['default'])('body').toggleClass('hidden');
        (0, _jquery2['default'])('#header').toggleClass('menu__open');
        (0, _jquery2['default'])('.header__nav').toggleClass('menu__open');
    });

    // Go to top button
    (0, _jquery2['default'])(document).on('click', '.go-to-top', function (e) {
        e.preventDefault();
        (0, _jquery2['default'])('html,body').animate({
            scrollTop: 0
        }, 1000);
    });

    // Sticky menu
    var header = (0, _jquery2['default'])('#header');
    var headerHeight = (0, _jquery2['default'])('#header').outerHeight();
    var headerOffset = (0, _jquery2['default'])('#header').offset();
    var goToTop = (0, _jquery2['default'])('.go-to-top');
    (0, _jquery2['default'])(window).scroll(function () {
        var scroll = (0, _jquery2['default'])(window).scrollTop();
        if (scroll >= headerHeight) {
            header.addClass("sticky-active");
            goToTop.addClass("is-visible");
        } else {
            header.removeClass("sticky-active");
            goToTop.removeClass("is-visible");
        }
    });
    var checkHeaderSticky = setTimeout(function () {
        if (headerOffset.top >= headerHeight) {
            header.addClass("sticky-active");
            goToTop.addClass("is-visible");
        }
    }, 250);

    // Sliders : Features products
    if ((0, _jquery2['default'])('.featured-products').length) {
        (0, _jquery2['default'])('.featured-products').each(function () {
            var thisSection = (0, _jquery2['default'])(this),
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
                    responsive: [{
                        breakpoint: 992,
                        settings: "unslick"
                    }]
                });
            }
        });
        // Page products slider
        (0, _jquery2['default'])('.product__media .slider-for').not('.slick-initialized').slick({
            infinite: false,
            slidesToShow: 1,
            slidesToScroll: 1,
            swipeToSlide: true,
            dots: true,
            arrows: false,
            speed: 500
        });
    }

    /* Start Popups */
    (0, _jquery2['default'])(document).on('click', '.popup-close', function () {
        (0, _jquery2['default'])('body').removeClass('no-scroll');
        (0, _jquery2['default'])(this).parents('.popup').removeClass('active');
    });
    (0, _jquery2['default'])(document).on('mouseup', function (e) {
        var container = (0, _jquery2['default'])(".popup-inner");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            (0, _jquery2['default'])('body').removeClass('no-scroll');
            (0, _jquery2['default'])('.popup').removeClass('active');
        }
    });
    /* End popups */
});

/***/ }),

/***/ 5:
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ })

/******/ });