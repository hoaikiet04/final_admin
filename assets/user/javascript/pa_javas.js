let slideIndex = 0;
showSlides();

function showSlides() {
    let slides = document.getElementsByClassName("slide");
    
    // Ẩn tất cả slide bằng cách bỏ class 'active'
    for (let i = 0; i < slides.length; i++) {
        slides[i].classList.remove("active");
    }
    
    // Tăng chỉ số và đặt lại nếu cần
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1;
    }
    
    // Thêm class 'active' cho slide hiện tại
    slides[slideIndex - 1].classList.add("active");
    
    // Chuyển slide mỗi 4 giây cho dễ chịu hơn
    setTimeout(showSlides, 4000);
}




// tạo phần slider cho hướng dẫn viên và đánh giá của  khách hàng.

const slidesWrapper = document.querySelector('.slides-wrapper');
        const slides = document.querySelectorAll('.review-slide');
        const prevButton = document.querySelector('.prev-button');
        const nextButton = document.querySelector('.next-button');
        let currentIndex = 0;
        let autoSlideInterval;

        // Hàm hiển thị slide theo index
        function showSlide(index) {
            if (index >= slides.length / 2) {
                currentIndex = 0;
            } else if (index < 0) {
                currentIndex = (slides.length / 2) - 1;
            } else {
                currentIndex = index;
            }
            slidesWrapper.style.transform = `translateX(-${currentIndex * 520}px)`; // 520px = 500px (slide chính) + 20px (gap)
        }

        // Hàm tự động chuyển slide
        function startAutoSlide() {
            autoSlideInterval = setInterval(() => {
                showSlide(currentIndex + 1);
            }, 3000);
        }

        // Dừng và khởi động lại tự động chuyển
        function resetAutoSlide() {
            clearInterval(autoSlideInterval);
            startAutoSlide();
        }

        // Xử lý nút "Tiến"
        nextButton.addEventListener('click', () => {
            showSlide(currentIndex + 1);
            resetAutoSlide();
        });

        // Xử lý nút "Lùi"
        prevButton.addEventListener('click', () => {
            showSlide(currentIndex - 1);
            resetAutoSlide();
        });

        // Khởi động tự động chuyển slide
        startAutoSlide();
// end tạo phần slider cho hướng dẫn viên và đánh giá của  khách hàng.
