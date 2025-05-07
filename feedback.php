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
    <title>Phản hồi</title>
  </head>
  <body>
    <navbar class="navbar">
      <h1><a href="./index.php">Phản hồi</a></h1>
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


          <?php
          include "connect.php"; // kết nối CSDL

          $sql = "SELECT * FROM Feedback ORDER BY created_at DESC";
          $result = mysqli_query($conn, $sql);
          ?>

          <!-- list feedback -->
          <section class="container__list">
            <h2>Danh sách phản hồi</h2>

            <table>
              <thead>
                <tr>
                  <th>STT</th>
                  <th>Họ tên</th>
                  <th>Số điện thoại</th>
                  <th>Chủ đề</th>
                  <th>Nội dung</th>
                  <th>Ngày gửi</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $stt = 1;
                if (mysqli_num_rows($result) > 0) {
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>
                            <td>{$stt}</td>
                            <td>" . htmlspecialchars($row['fullname']) . "</td>
                            <td>" . htmlspecialchars($row['phone_number']) . "</td>
                            <td>" . htmlspecialchars($row['subject_name']) . "</td>
                            <td>" . nl2br(htmlspecialchars($row['content'])) . "</td>
                            <td>" . date('d/m/Y H:i', strtotime($row['created_at'])) . "</td>
                          </tr>";
                    $stt++;
                  }
                } else {
                  echo "<tr><td colspan='6'>Không có feedback nào.</td></tr>";
                }
                ?>
              </tbody>
            </table>
          </section>
        </div>
      </div>
    </main>
  </body>
</html>
