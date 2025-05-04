
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- link css -->
    <link rel="stylesheet" href="../assets/admin/css/reset.css" />
    <link rel="stylesheet" href="../assets/admin/css/style.css" />
    <link rel="stylesheet" href="../assets/admin/css/custom.css" />
    <!-- link jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Thêm sửa xóa</title>
  </head>
  <body>
    <navbar class="navbar">
      <h1><a href="./index.php">Quản lý hệ thống</a></h1>
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
        </aside>

        <!-- main-content -->
        <div class="main-content" id="main-content">
          <!-- total Doanh thu -->
          <section class="total">
            <div class="total__item">
              <div class="total__card">
                <h5>Tổng Doanh Thu</h5>
                <a href="#">Xem chi tiết</a>
              </div>
            </div>

            <!-- total Khách hàng -->
            <div class="total__item">
              <div class="total__card">
                <h5>Tổng khách hàng</h5>
                <a href="#">Xem chi tiết</a>
              </div>
            </div>

            <!-- total Đơn hàng -->
            <div class="total__item">
              <div class="total__card">
                <h5>Tổng đơn hàng</h5>
                <a href="#">Xem chi tiết</a>
              </div>
            </div>

            <!-- total địa điểm -->
            <div class="total__item">
              <div class="total__card">
                <h5>Tổng địa điểm</h5>
                <a href="#">Xem chi tiết</a>
              </div>
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

          <!-- list  tour-->
          <section class="content-area">
            <!-- Nút thêm mới -->
            <div class="content-header">
              <h1>Cập nhật tour</h1>
              <button id="add-tour-btn" class="btn">Thêm mới</button>
            </div>
            
            <?php
            include "connect.php";

            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])) {
                $category_id = $_POST['category_id'];
                $title = $_POST['title'];
                $description = $_POST['description'];
                $address = $_POST['address'];

                $image = $_FILES['thumbnail']['name'];
                $image_tmp = $_FILES['thumbnail']['tmp_name'];
                $upload_dir = "../assets/admin/image/";

                if (move_uploaded_file($image_tmp, $upload_dir . $image)) {
                    $sql = "INSERT INTO Detail (category_id, title, description, thumbnail, address) 
                            VALUES ('$category_id', '$title', '$description', '$image', '$address')";
                    mysqli_query($conn, $sql);
                }
            }
            ?>

            <!-- Form thêm tour (ẩn ban đầu) -->
            <form id="add-tour-form" action="" method="POST" enctype="multipart/form-data" style="display: none;">  
              <label>Loại tour (Category):</label>
              <select name="category_id" required>
                <?php
                  include "./connect.php";
                  $result = mysqli_query($conn, "SELECT id, name FROM Category");
                  while ($row = mysqli_fetch_assoc($result)) {
                      echo "<option value='" . $row['id'] . "'>" . htmlspecialchars($row['name']) . "</option>";
                  }
                ?>
              </select><br>

              <label>Tiêu đề:</label>
              <input type="text" name="title" required><br>

              <label>Mô tả:</label>
              <textarea name="description" required></textarea><br>

              <label>Hình ảnh:</label>
              <input type="file" name="thumbnail" required><br>

              <label>Địa chỉ:</label>
              <input type="text" name="address" required><br>

              <button type="submit" name="submit">Thêm tour</button>
            </form>

            <!-- jQuery để hiển thị form khi nhấn nút -->
            <script>
              $("#add-tour-btn").on("click", function () {
                $("#add-tour-form").slideToggle();
              });
            </script>


            <!-- Tours Grid -->
            <div class="tours-grid" id="tours-container">
              <!-- Sample tour cards (will be replaced with dynamic content) -->
              <div class="tour-card">
                <img
                  src="./asset/image/tour_card1.jpg"
                  alt="Ha Long Bay"
                  class="tour-image"
                />
                <div class="tour-info">
                  <h3 class="tour-title">Ha Long Bay Tour</h3>
                  <p class="tour-location">Quang Ninh, Vietnam</p>
                  <p class="tour-price">2,500,000 VNĐ</p>
                  <div class="tour-actions">
                    <button class="btn btn-edit">Sửa</button>
                    <button class="btn btn-danger">Xóa</button>
                  </div>
                </div>
              </div>

              <div class="tour-card">
                <img
                  src="./asset/image/tour_card2.jpg"
                  alt="Hoi An"
                  class="tour-image"
                />
                <div class="tour-info">
                  <h3 class="tour-title">Hoi An Ancient Town</h3>
                  <p class="tour-location">Quang Nam, Vietnam</p>
                  <p class="tour-price">1,800,000 VNĐ</p>
                  <div class="tour-actions">
                    <button class="btn btn-edit">Sửa</button>
                    <button class="btn btn-danger">Xóa</button>
                  </div>
                </div>
              </div>

              <div class="tour-card">
                <img
                  src="./asset/image/tour_card3.jpg"
                  alt="Sapa"
                  class="tour-image"
                />
                <div class="tour-info">
                  <h3 class="tour-title">Sapa Trekking</h3>
                  <p class="tour-location">Lao Cai, Vietnam</p>
                  <p class="tour-price">3,200,000 VNĐ</p>
                  <div class="tour-actions">
                    <button class="btn btn-edit">Sửa</button>
                    <button class="btn btn-danger">Xóa</button>
                  </div>
                </div>
              </div>
            </div>

          </section>
        </div>
      </div>
    </main>
  </body>
</html>
