// header 
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

// end header

function createCalendar(inputId, calendarId) {
    const input = document.getElementById(inputId);
    const cleandar = document.getElementById(calendarId);
    let currentDate = new Date();
    let selectedDate = null;

    function renderCalendar() {
        cleandar.innerHTML = '';

        // tạo header: tháng, năm và nút điều hướng
        const header = document.createElement('div');
        header.className = "cleandar-header";
        const prevMonth = document.createElement('button');
        prevMonth.innerText = '\u25C4';
        prevMonth.onclick = () => {
            currentDate.setMonth(currentDate.getMonth() - 1);
            renderCalendar();
        };
        const nextMonth = document.createElement('button');
        nextMonth.innerText = '\u25BA';
        nextMonth.onclick = () => {
            currentDate.setMonth(currentDate.getMonth() + 1);
            renderCalendar();
        };
        const monthYear = document.createElement('span');
        monthYear.innerText = `${currentDate.toLocaleString('vi', {month: 
        'long'})} ${currentDate.getFullYear()}`;
        header.appendChild(prevMonth);
        header.appendChild(monthYear);
        header.appendChild(nextMonth);
        cleandar.appendChild(header);

        // grid: tên ngày trong tuần
    const grid = document.createElement('div');
    grid.className = 'cleandar-grid';
    const daysOfWeek = ["T2", "T3", "T4", "T5", "T6", "T7", "CN"];
    daysOfWeek.forEach(day => {
        const dayName = document.createElement('div');
        dayName.className = 'day-name';
        dayName.innerText = day;
        grid.appendChild(dayName);
    });

    // grid: các ngày trong tháng
    const firstDay = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
    const lastDay = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
    const startDay = firstDay.getDay() === 0 ? 6 : firstDay.getDay() - 1;
    const today = new Date();

    // thêm ô trống trước ngày đầu tiên
    for (let i = 0; i < startDay; i++) {
        const emptyDay = document.createElement('div');
        emptyDay.className = 'day disabled';
        grid.appendChild(emptyDay);
    }

    // thêm các ngày 
    for (let i = 1; i <= lastDay.getDate(); i++) {
        const day = document.createElement('div');
        day.className = 'day';
        day.innerText = i;
        const dayDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), i);
        if (selectedDate && dayDate.toDateString() === selectedDate.toDateString()) {
            day.className += ' selected';
        }
        day.onclick = () => {
            selectedDate = dayDate;
            input.value = dayDate.toISOString().split('T')[0];
            renderCalendar();
        };
        grid.appendChild(day);
    }

    cleandar.appendChild(grid);

    // actions: Today, Clear, Apply
    const actions = document.createElement('div');
    actions.className = "cleandar-actions";

    const todayBtn = document.createElement('button');
    todayBtn.className = 'cleandar-today';
    todayBtn.innerText = 'Today';
    todayBtn.onclick = () => {
        selectedDate = new Date();
        input.value = selectedDate.toISOString().split('T')[0];
        currentDate = new Date(selectedDate);
        renderCalendar();
    };

    const clearBtn = document.createElement('button');
    clearBtn.className = 'cleandar-clear';
    clearBtn.innerText = 'Clear';
    clearBtn.onclick = () => {
        selectedDate = null;
        input.value = '';
        renderCalendar();
    };

    const applyBtn = document.createElement('button');
    applyBtn.className = 'cleandar-apply';
    applyBtn.innerText = 'Apply';
    applyBtn.onclick = () => {
        cleandar.classList.remove('show');
    };

    actions.appendChild(todayBtn);
    actions.appendChild(clearBtn);
    actions.appendChild(applyBtn);
    cleandar.appendChild(actions);
    }

    // hiển thị lịch khi focus
    input.addEventListener('focus', () => {
        cleandar.classList.add('show');
        renderCalendar();
    });

    // ẩn lịch khi click ra ngoài 
    document.addEventListener('click', (e) => {
        if (!cleandar.contains(e.target) && e.target !== input && !cleandar.querySelector('.cleandar-actions').contains(e.target)) {
            cleandar.classList.remove('show');
        }
    });
    renderCalendar();
}

// khởi tạo lịch cho cả hai trường ngày 
createCalendar('startDate', 'startDateCleandar');
createCalendar('endDate', 'endDateCleandar');

function handleSearch(event) {
    event.preventDefault();
    const form = document.getElementById('tourForm');
    const formDate = {
        destination: form.destination.value,
        tourType: form.tourType.value,
        startDate: form.startDate.value,
        endDate: form.endDate.value,
        guests: form.guests.value
    };
    console.log('Dữ liệu tìm kiếm:', formDate);
    alert('Đã tìm kiếm tour với thông tin: ' + JSON.stringify(formDate));
}

function handleReset() {
    const form = document. getElementById('tourForm');
    form.reset();
    form.destination.value = '';
    form.tourType.value = '';
    form.startDate.value = '';
    form.endDate.value = '';
    form.guests.value = 1;
    // gọi lại rendercarlendar để cập nhật giao diện
    document.querySelectorAll('.cleandar').forEach(cleandar => {
        cleandar.classList.remove('show');
    });
}

function closeNotification() {
    document.getElementById('notification').style.display = 'none';
  }

  function handleLogin() {
    localStorage.setItem('isLoggedIn', 'true');
    closeNotification();
  }

  function handleRegister() {
    localStorage.setItem('isLoggedIn', 'true');
    closeNotification();
  }

  window.onload = function() {
    const isLoggedIn = localStorage.getItem('isLoggedIn');
    if (!isLoggedIn) {
      document.getElementById('notification').style.display = 'flex';
    }
  };