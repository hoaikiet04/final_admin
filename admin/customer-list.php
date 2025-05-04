<?php
include "connect.php";

// Xử lý trước khi gửi bất kỳ nội dung HTML nào
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['delete_selected']) && !empty($_POST['selected_ids'])) {
    $ids = implode(',', array_map('intval', $_POST['selected_ids']));
    $delete_sql = "UPDATE User SET deleted = 1 WHERE id IN ($ids)";
    
    if (!mysqli_query($conn, $delete_sql)) {
        echo "Lỗi truy vấn: " . mysqli_error($conn);
        exit;
    }

    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}
?>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- link css -->
    <link rel="stylesheet" href="../assets/admin/css/reset.css" />
    <link rel="stylesheet" href="../assets/admin/css/style.css" />
    <link rel="stylesheet" href="../assets/admin/css/table.css" />
    <!-- link jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>123</title>
  </head>
  <body>
    <navbar class="navbar">
      <h1><a href="./index.php">Danh sách khách hàng</a></h1>
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

          <!-- Bookings Management Section -->
          <section class="bookings-container">

          <?php
            $sql = "SELECT * FROM User WHERE deleted = 0";
            $result = mysqli_query($conn, $sql);
          ?>

            <section class="bookings-container">
              <form method="POST" action="">
                <div class="bookings-header">
                  <h2 class="bookings-title">Danh sách người dùng</h2>
                  <div class="d-flex gap-10">
                    <button type="submit" name="delete_selected" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa những người dùng đã chọn?');">
                      Xóa đã chọn
                    </button>
                  </div>
                </div>

                <table>
                  <tr>
                    <th><input type='checkbox' id='checkAll'></th>
                    <th>STT</th>
                    <th>Họ tên</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ</th>
                    <th>Mật khẩu</th>
                  </tr>
                <?php
                  $stt = 1;
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>
                            <td><input type='checkbox' name='selected_ids[]' value='" . $row['id'] . "'></td>
                            <td>" . $stt++ . "</td>
                            <td>" . htmlspecialchars($row['fullname']) . "</td>
                            <td>" . htmlspecialchars($row['email']) . "</td>
                            <td>" . htmlspecialchars($row['phone_number']) . "</td>
                            <td>" . htmlspecialchars($row['address']) . "</td>
                            <td>" . htmlspecialchars($row['password']) . "</td>
                          </tr>";
                  }
                ?>
                </table>
              </form>

              <script>
                document.getElementById('checkAll').onclick = function () {
                  var checkboxes = document.getElementsByName('selected_ids[]');
                  for (var checkbox of checkboxes) {
                    checkbox.checked = this.checked;
                  }
                };
              </script>


          </section>
        </div>
      </div>
    </main>
  </body>
</html>
