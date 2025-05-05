
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
            include "./connect.php";

            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])) {
                $category_id = $_POST['category_id'];
                $title = $_POST['title'];
                $description = $_POST['description'];
                $address = $_POST['address'];

                $image = $_FILES['thumbnail']['name'];
                $image_tmp = $_FILES['thumbnail']['tmp_name'];
                $upload_dir = "./assets/image/";

                if (move_uploaded_file($image_tmp, $upload_dir . $image)) {
                    $sql = "INSERT INTO tours (category_id, title, description, thumbnail, address) 
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
            <?php
            include "./connect.php";

            $sql = "SELECT tours.id, tours.title, tours.thumbnail, tours.address, Category.name AS category_name
                    FROM tours
                    JOIN Category ON tours.category_id = Category.id
                    WHERE tours.deleted = 0";

            $result = mysqli_query($conn, $sql);
            ?>

            <div class="tours-grid" id="tours-container">
            <?php while ($row = mysqli_fetch_assoc($result)) : ?>
              <div class="tour-card" id="tour-<?= $row['id'] ?>">
                <img src="./assets/image/<?= htmlspecialchars($row['thumbnail']) ?>" alt="<?= htmlspecialchars($row['title']) ?>" class="tour-image" />
                <div class="tour-info">
                  <h3 class="tour-title"><?= htmlspecialchars($row['title']) ?></h3>
                  <p class="tour-location"><?= htmlspecialchars($row['address']) ?></p>
                  <div class="tour-actions">
                    <form method="POST" action="delete_detail.php" style="display:inline">
                      <input type="hidden" name="id" value="<?= $row['id'] ?>">
                      <button type="button" class="btn btn-danger btn-delete" data-id="<?= $row['id'] ?>">Xóa</button>
                    </form>
                  </div>
                </div>
              </div>
            <?php endwhile; ?>


            </div>
            <script>
            $(document).ready(function () {
              $(".btn-delete").click(function () {
                const tourId = $(this).data("id");
                const confirmed = confirm("Bạn có chắc chắn muốn xóa?");
                if (confirmed) {
                  $.ajax({
                    url: "delete_detail.php",
                    type: "POST",
                    data: { id: tourId },
                    success: function (response) {
                      if (response.trim() === "success") {
                        $("#tour-" + tourId).remove();
                      } else {
                        alert("Xóa thất bại hoặc có lỗi xảy ra.");
                      }
                    },
                    error: function () {
                      alert("Lỗi kết nối server.");
                    },
                  });
                }
              });
            });
            </script>
          </section>
        </div>
      </div>
    </main>
  </body>
</html>
