<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- link css -->
    <link rel="stylesheet" href="./assets/css/reset.css?v=<?= time(); ?>" />
    <link rel="stylesheet" href="./assets/css/style.css?v=<?= time(); ?>" />
    <!-- link jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Danh sách người dùng</title>
  </head>
  <body>
    <navbar class="navbar">
      <h1><a href="./index.php">Danh sách người dùng</a></h1>
      <div class="search-bar">
        <div class="inner-user-auth">
          <a href="../SignInOn/logout.php">
            <i class="fa-solid fa-right-from-bracket"></i>
              Đăng xuất
          </a>
        </div>
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
                >Người dùng</a
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
                <h5>Khám phá Việt Nam cùng chúng tôi!</h5>
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
                <h5>Tìm kiếm tour dễ dàng, nhanh chóng</h5>
              </div>
            </div>

            <div class="total__item">
              <div class="total__card">
                <img src="https://cdn-icons-png.flaticon.com/512/684/684908.png" alt="Map Icon" class="total__icon" />
                <h5>Hơn 100+ địa điểm hấp dẫn</h5>
              </div>
            </div>
          </section>

          <!-- Bookings Management Section -->
          <section class="bookings-container">

          <?php
            include "./connect.php";
            $sql = "SELECT * FROM users WHERE deleted = 0";
            $result = mysqli_query($conn, $sql);
          ?>

            <section class="bookings-container">
            <form id="delete-users-form">
              <div class="bookings-header">
                <h2 class="bookings-title">Danh sách người dùng</h2>
              </div>

              <table>
                <tr>
                  <th>Xóa</th>
                  <th>STT</th>
                  <th>Họ tên</th>
                  <th>Email</th>
                  <th>Mật khẩu</th>
                </tr>
                <?php
                  $stt = 1;
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr id='user-{$row['id']}'>
                            <td><button class='btn btn-danger btn-delete-user' data-id='{$row['id']}'>Xóa</button></td>
                            <td>" . $stt++ . "</td>
                            <td>" . htmlspecialchars($row['fullname']) . "</td>
                            <td>" . htmlspecialchars($row['email']) . "</td>
                            <td class='ellipsis'>" . htmlspecialchars($row['password']) . "</td>
                          </tr>";
                  }
                ?>
              </table>
            </form>

            <script>
              $(document).on("click", ".btn-delete-user", function () {
                const userId = $(this).data("id");
                if (!confirm("Bạn có chắc chắn muốn xóa người dùng này?")) return;

                $.ajax({
                  url: "delete_user.php",
                  method: "POST",
                  data: { id: userId },
                  success: function (res) {
                    if (res.trim() === "success") {
                      $("#user-" + userId).remove();
                    } else {
                      alert("Xóa thất bại.");
                    }
                  },
                  error: function () {
                    alert("Lỗi kết nối đến máy chủ.");
                  },
                });
              });
            </script>

          </section>
        </div>
      </div>
    </main>
  </body>
</html>
