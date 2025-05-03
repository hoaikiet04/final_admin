// $(document).ready(function () {
//     $('.item-slider').slick({
//         autoplay: true, // Tự động chuyển slide
//         autoplaySpeed: 2000, // Thời gian chuyển slide (2 giây)
//         dots: false, // Ẩn dots điều hướng
//         arrows: true, // Hiển thị nút điều hướng
//         prevArrow: $('.inner-prev'), // Sử dụng nút prev tùy chỉnh
//         nextArrow: $('.inner-next'), // Sử dụng nút next tùy chỉnh
//     });
// });

// $(document).ready(function () {
//     $('.item-slider').slick({
//         autoplay: true, // Tự động chuyển slide
//         autoplaySpeed: 2000, // Thời gian chuyển slide (2 giây)
//         dots: false, // Ẩn dots điều hướng
//         arrows: true, // Hiển thị nút điều hướng
//         prevArrow: $('.inner-prev'), // Sử dụng nút prev tùy chỉnh
//         nextArrow: $('.inner-next'), // Sử dụng nút next tùy chỉnh
//         fade: true, // Hiệu ứng fade khi chuyển slide
//     });

//     // Đồng bộ nội dung với slide
//     $('.item-slider').on('beforeChange', function (event, slick, currentSlide, nextSlide) {
//         // Ẩn tất cả các nội dung
//         $('.slides .inner-slide').removeClass('slick-active');
//         // Hiển thị nội dung của slide tiếp theo
//         $('.slides .inner-slide').eq(nextSlide).addClass('slick-active');
//     });

//     // Hiển thị nội dung của slide đầu tiên khi trang được tải
//     $('.slides .inner-slide').eq(0).addClass('slick-active');
// });


// $(document).ready(function () {
//     $('.item-slider').slick({
//         autoplay: true, // Tự động chuyển slide
//         autoplaySpeed: 2000, // Thời gian chuyển slide (2 giây)
//         dots: false, // Ẩn dots điều hướng
//         arrows: true, // Hiển thị nút điều hướng
//         prevArrow: $('.inner-prev'), // Sử dụng nút prev tùy chỉnh
//         nextArrow: $('.inner-next'), // Sử dụng nút next tùy chỉnh
//         fade: true, // Hiệu ứng fade khi chuyển slide
//     });

//     // Đồng bộ nội dung với slide
//     $('.item-slider').on('beforeChange', function (event, slick, currentSlide, nextSlide) {
//         // Ẩn tất cả các nội dung
//         $('.slides .inner-slide').removeClass('slick-active');
//         // Hiển thị nội dung của slide tiếp theo
//         $('.slides .inner-slide').eq(nextSlide).addClass('slick-active');
//     });

//     // Hiển thị nội dung của slide đầu tiên khi trang được tải
//     $('.slides .inner-slide').eq(0).addClass('slick-active');
// });


// section-one
// $('.item-slider').slick({
//     dots: true,
//     infinite: true,
//     speed: 500,
//     fade: true,
//     cssEase: 'linear'
//   });


$(document).ready(function(){
  // Initialize Image Slider
  $('.item-slider').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: '.slides',
      autoplay: true,
      autoplaySpeed: 4000,
  });

  // Initialize Content Slider
  $('.slides').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: true,
      prevArrow: $('.inner-prev'),
      nextArrow: $('.inner-next'),
      asNavFor: '.item-slider',
      dots: true,
      fade: true,
      autoplay: true,
      autoplaySpeed: 4000,
  });

  // Ensure text is visible by forcing a refresh
  $('.slides').on('afterChange', function(event, slick, currentSlide){
      $('.inner-slide').removeClass('slick-active');
      $('.inner-slide').eq(currentSlide).addClass('slick-active');
  });
});
// End section-one