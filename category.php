<?php include './connect.php'; // Kết nối cơ sở dữ liệu ?>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- link css -->
    <link rel="stylesheet" href="./assets/css/reset.css" />
    <link rel="stylesheet" href="./assets/css/style.css" />
    <link rel="stylesheet" href="./assets/css/table.css" />
    <link rel="stylesheet" href="./assets/css/total_section.css" />
    <!-- link jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Danh sách đại điểm</title>
  </head>
  <body>
    <navbar class="navbar">
      <h1><a href="./index.php">Danh sách tour hiện có</a></h1>
      <div class="search-bar">
        <input type="text" placeholder="Tìm kiếm cho ..." />
        <button>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 448 512"
            height="20px"
            margin="0 auto"
            fill="#28a745"
          >
            <path
              d="M384 432c8.8 0 16-7.2 16-16l0-320c0-8.8-7.2-16-16-16L64 80c-8.8 0-16 7.2-16 16l0 320c0 8.8 7.2 16 16 16l320 0zm64-16c0 35.3-28.7 64-64 64L64 480c-35.3 0-64-28.7-64-64L0 96C0 60.7 28.7 32 64 32l320 0c35.3 0 64 28.7 64 64l0 320zM224 352c-6.7 0-13-2.8-17.6-7.7l-104-112c-6.5-7-8.2-17.2-4.4-25.9s12.5-14.4 22-14.4l208 0c9.5 0 18.2 5.7 22 14.4s2.1 18.9-4.4 25.9l-104 112c-4.5 4.9-10.9 7.7-17.6 7.7z"
            />
          </svg>
        </button>
      </div>
    </navbar>

    <main>
      <div class="container">
        <!-- sidebar -->
        <aside class="sidebar">
          <!-- section custom tour -->
          <section>
            <h5>Cập nhật tour</h5>
            <div class="menu-items">
              <a href="./custom.php" data-page="custom.php">Chỉnh sửa tour</a>
              <a href="./category.php" data-page="category.php"
                >Danh mục tour</a
              >
            </div>
          </section>

          <!-- section manage list -->
          <section>
            <h5>Quản lý</h5>
            <div class="menu-items">
              <a href="./customer-list.php" data-page="customer-list.php"
                >Danh sách khách hàng</a
              >
              <a href="./feedback.php" data-page="feedback.php">Phản hồi</a>
            </div>
          </section>
          <script>
            $(document).ready(function () {
              // Add collapsed class to all menu headers initially
              $(".sidebar h5").addClass("collapsed");

              // Toggle menu items when clicking on the header
              $(".sidebar h5").click(function () {
                $(this).toggleClass("collapsed");
                $(this).next(".menu-items").slideToggle(300);
              });
            });
          </script>
        </aside>

        <!-- main-content -->
        <div class="main-content" id="main-content">
        <section class="total aesthetic-info">
            <div class="total__item">
              <div class="total__card">
                <img src="https://cdn-icons-png.flaticon.com/512/201/201623.png" alt="Globe Icon" class="total__icon" />
                <h5>Khám phá thế giới cùng chúng tôi!</h5>
              </div>
            </div>

            <div class="total__item">
              <div class="total__card">
                <img src="https://cdn-icons-png.flaticon.com/512/942/942748.png" alt="Customer Icon" class="total__icon" />
                <h5>Hơn 10,000 khách hàng hài lòng</h5>
              </div>
            </div>

            <div class="total__item">
              <div class="total__card">
                <img src="https://cdn-icons-png.flaticon.com/512/2910/2910791.png" alt="Order Icon" class="total__icon" />
                <h5>Đặt tour dễ dàng, nhanh chóng</h5>
              </div>
            </div>

            <div class="total__item">
              <div class="total__card">
                <img src="https://cdn-icons-png.flaticon.com/512/684/684908.png" alt="Map Icon" class="total__icon" />
                <h5>Hơn 100+ địa điểm hấp dẫn</h5>
              </div>
            </div>
          </section>

          <!-- Danh sách tour hiện có  -->
          <section class="container__list">
          <h2>Danh sách địa điểm du lịch</h2>
          <table>
            <thead>
              <tr>
                <th>STT</th>
                <th>Thể loại</th>
                <th>Tiêu đề</th>
                <th>Mô tả</th>
                <th>Hình ảnh</th>
                <th>Địa chỉ</th>
                <th>Ngày tạo</th>
              </tr>
            </thead>
            <tbody>
              <?php 
              // Truy vấn kết hợp Detail với Category
              $sql = "SELECT d.id, c.name AS category_name, d.title, d.description, d.thumbnail, d.address, d.created_at
                      FROM tours d
                      JOIN Category c ON d.category_id = c.id
                      WHERE d.deleted = 0
                      ORDER BY d.created_at DESC";

              $result = $conn->query($sql);
              
              // Kiểm tra kết quả truy vấn
              if ($result->num_rows > 0) {
                  $stt = 1;
                  while ($row = $result->fetch_assoc()) {
                      echo "<tr>";
                      echo "<td>" . $stt++ . "</td>";
                      echo "<td>" . htmlspecialchars($row['category_name']) . "</td>";
                      echo "<td>" . htmlspecialchars($row['title']) . "</td>";
                      echo "<td>" . nl2br(htmlspecialchars($row['description'])) . "</td>";
                      echo "<td><img src='./assets/image/" . htmlspecialchars($row['thumbnail']) . "' alt='Ảnh' class='thumbnail'></td>";
                      echo "<td>" . htmlspecialchars($row['address']) . "</td>";
                      echo "<td>" . htmlspecialchars($row['created_at']) . "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='7'>Không có dữ liệu.</td></tr>";
              }
              $conn->close();
              ?>
            </tbody>
          </table>
          </section>
        </div>
      </div>
    </main>
  </body>
</html>
