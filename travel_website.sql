-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 04, 2025 lúc 09:01 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `travel_website`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Nghỉ dưỡng'),
(2, 'Khám phá'),
(3, 'Văn hóa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail`
--

CREATE TABLE `detail` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `detail`
--

INSERT INTO `detail` (`id`, `category_id`, `title`, `thumbnail`, `description`, `address`, `created_at`, `updated_at`, `deleted`) VALUES
(7, 1, 'Tour Đà Nẵng - Biển Mỹ Khê', 'danang.jpg', 'Thư giãn tại bãi biển Mỹ Khê nổi tiếng và tham quan bán đảo Sơn Trà.', 'Đà Nẵng', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(8, 1, 'Du lịch Nha Trang 3N2Đ', 'nhatrang.jpg', 'Tham quan Vinpearl, tắm biển và thưởng thức hải sản tươi sống.', 'Nha Trang, Khánh Hòa', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(9, 1, 'Khu nghỉ dưỡng Tam Đảo 2N1Đ', 'tamdao.jpg', 'Trải nghiệm không khí mát mẻ và dịch vụ spa tại resort đồi núi.', 'Tam Đảo, Vĩnh Phúc', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(10, 1, 'Kỳ nghỉ dưỡng Đà Lạt 3N2Đ', 'dalatresort.jpg', 'Resort view thung lũng, có bữa sáng và hồ bơi nước ấm.', 'Đà Lạt, Lâm Đồng', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(11, 1, 'Tour đảo Nam Du', 'namdu.jpg', 'Khám phá biển hoang sơ, lặn ngắm san hô và cắm trại trên đảo.', 'Kiên Giang', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(12, 2, 'Trekking Tà Năng - Phan Dũng', 'tanang.jpg', 'Hành trình leo núi, cắm trại giữa rừng và ngắm bình minh trên đỉnh.', 'Lâm Đồng - Bình Thuận', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(13, 2, 'Leo núi Bà Đen', 'baden.jpg', 'Chinh phục nóc nhà Nam Bộ và thưởng ngoạn cáp treo hiện đại.', 'Tây Ninh', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(14, 2, 'Thám hiểm động Thiên Đường', 'thienduong.jpg', 'Khám phá vẻ đẹp kỳ ảo của hang động tại Phong Nha.', 'Quảng Bình', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(15, 2, 'Tour rừng tràm Trà Sư', 'trasu.jpg', 'Đi thuyền xuyên rừng, ngắm cảnh thiên nhiên sinh thái độc đáo.', 'An Giang', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(16, 2, 'Khám phá hồ Ba Bể', 'babe.jpg', 'Trải nghiệm chèo thuyền và khám phá núi rừng nguyên sinh Bắc Kạn.', 'Bắc Kạn', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(17, 3, 'Tour Hà Nội – Văn Miếu – Lăng Bác', 'hanoi.jpg', 'Khám phá Thủ đô với các công trình lịch sử và văn hóa tiêu biểu.', 'Hà Nội', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(18, 3, 'Tham quan thành nhà Hồ', 'thanhnhaho.jpg', 'Di sản văn hóa thế giới với kiến trúc đá độc đáo thời Trần.', 'Thanh Hóa', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(19, 3, 'Lễ hội Gióng – Sóc Sơn', 'giong.jpg', 'Trải nghiệm lễ hội truyền thống tưởng nhớ Thánh Gióng.', 'Hà Nội', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(20, 3, 'Lễ hội hoa Đà Lạt', 'hoadalat.jpg', 'Ngắm hoa rực rỡ và các hoạt động nghệ thuật sôi động.', 'Đà Lạt, Lâm Đồng', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(21, 3, 'Di tích Mỹ Sơn – Quảng Nam', 'myson.jpg', 'Tham quan đền tháp Chăm cổ kính – di sản văn hóa UNESCO.', 'Duy Xuyên, Quảng Nam', '2025-05-03 09:13:48', '2025-05-03 09:13:48', 0),
(24, 1, 'Trà Vinh', 'thuytien.jpg', 'Trà Vinh mảnh đất dừa sáp', 'Trà Vinh', '2025-05-04 19:03:38', '2025-05-04 19:03:38', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `fullname`, `email`, `phone_number`, `subject_name`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Võ Thiên Bảo', 'thienbao.vo@gmail.com', '0901122334', 'Trải nghiệm tour Đà Lạt', 'Chuyến đi rất tuyệt vời, dịch vụ tốt, hướng dẫn viên thân thiện và nhiệt tình.', '2025-05-05 01:36:45', '2025-05-05 01:36:45'),
(2, 'Ngô Hải Yến', 'haiyen.ngo@gmail.com', '0912233445', 'Dịch vụ đặt tour', 'Giao diện dễ sử dụng, đặt tour nhanh chóng và tiện lợi, mình rất hài lòng.', '2025-05-05 01:36:45', '2025-05-05 01:36:45'),
(3, 'Đặng Quang Huy', 'quanghuy.dang@gmail.com', '0988776655', 'Đội ngũ hỗ trợ', 'Nhân viên hỗ trợ nhiệt tình, phản hồi nhanh, cảm giác được quan tâm chu đáo.', '2025-05-05 01:36:45', '2025-05-05 01:36:45'),
(4, 'Bùi Minh Châu', 'minhchau.bui@gmail.com', '0977332211', 'Tour miền Tây', 'Hành trình rất thú vị, đồ ăn ngon, lịch trình hợp lý, đáng trải nghiệm.', '2025-05-05 01:36:45', '2025-05-05 01:36:45'),
(5, 'Trịnh Ngọc Lan', 'ngoclan.trinh@gmail.com', '0966888777', 'Hệ thống thanh toán', 'Thanh toán nhanh, dễ dàng, không gặp lỗi, hệ thống hoạt động mượt mà.', '2025-05-05 01:36:45', '2025-05-05 01:36:45'),
(6, 'Lý Quốc Hưng', 'quochung.ly@gmail.com', '0933667788', 'Tour Nha Trang', 'Phong cảnh đẹp, biển xanh trong, rất thích hợp cho nghỉ dưỡng cùng gia đình.', '2025-05-05 01:36:45', '2025-05-05 01:36:45'),
(7, 'Tạ Bảo Ngọc', 'baongoc.ta@gmail.com', '0911223344', 'Giao diện website', 'Website thiết kế bắt mắt, thông tin rõ ràng, dễ tìm kiếm các tour yêu thích.', '2025-05-05 01:36:45', '2025-05-05 01:36:45'),
(8, 'Hồ Anh Dũng', 'anhdung.ho@gmail.com', '0944556677', 'Chất lượng dịch vụ', 'Mình rất hài lòng với chất lượng dịch vụ, nhân viên chuyên nghiệp và vui vẻ.', '2025-05-05 01:36:45', '2025-05-05 01:36:45'),
(9, 'Phan Thị Kim Oanh', 'kimoanh.phan@gmail.com', '0900998877', 'Tour Phú Quốc', 'Tour tổ chức tốt, đảo đẹp, di chuyển thuận tiện, mọi thứ rất hợp lý.', '2025-05-05 01:36:45', '2025-05-05 01:36:45'),
(10, 'Cao Thanh Tùng', 'thanhtung.cao@gmail.com', '0977996655', 'Tư vấn khách hàng', 'Bạn tư vấn rất dễ thương, hỗ trợ chi tiết, cảm giác rất yên tâm khi đặt tour.', '2025-05-05 01:36:45', '2025-05-05 01:36:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(4) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `phone_number`, `address`, `password`, `role`, `created_at`, `updated_at`, `deleted`) VALUES
(2, 'Trần Khánh Linh', 'khanhlinh.tran@gmail.com', '0987654321', '45A Nguyễn Huệ, Quận 1, TP.HCM', '123456', 0, '2025-05-04 19:12:04', '2025-05-04 21:14:50', 1),
(3, 'Lê Gia Huy', 'giahuy.le@gmail.com', '0933444555', '78 Hai Bà Trưng, Quận 3, TP.HCM', '123456', 0, '2025-05-04 19:12:04', '2025-05-04 19:37:18', 1),
(4, 'Phạm Thùy Dương', 'thuyduong.pham@gmail.com', '0909988776', '321 CMT8, Quận 10, TP.HCM', '123456', 0, '2025-05-04 19:12:04', '2025-05-04 19:42:09', 1),
(5, 'Đỗ Minh Anh', 'minhanh.do@gmail.com', '0966123456', '654 Trường Chinh, Tân Bình, TP.HCM', '123456', 0, '2025-05-04 19:12:04', '2025-05-04 19:32:58', 1),
(8, 'Lê Hoàng Anh', 'hoanganhle@gmail.com', '0909090909', 'Quận Bình Thạnh, TP. Hồ Chí Minh', 'anhhoangle', 0, '2025-05-05 00:08:22', '2025-05-05 01:05:25', 1),
(9, 'Phạm Ngọc Bích', 'bichpham@gmail.com', '0938123456', 'TP. Thủ Đức, TP. Hồ Chí Minh', 'bichmatkhau', 0, '2025-05-05 00:08:22', '2025-05-05 00:56:24', 1),
(10, 'Đỗ Thanh Tùng', 'thanhtungdo@gmail.com', '0977778888', 'Quận Tân Bình, TP. Hồ Chí Minh', 'tungpass123', 0, '2025-05-05 00:08:22', '2025-05-05 00:14:42', 1),
(11, 'Võ Thiên Bảo', 'thienbao.vo@gmail.com', '0901122334', '12 Nguyễn Văn Cừ, Quận 5, TP.HCM', '123456', 0, '2025-05-05 01:25:54', '2025-05-05 01:25:54', 0),
(12, 'Ngô Hải Yến', 'haiyen.ngo@gmail.com', '0912233445', '89 Trần Hưng Đạo, Quận 1, TP.HCM', '123456', 0, '2025-05-05 01:25:54', '2025-05-05 01:25:54', 0),
(13, 'Đặng Quang Huy', 'quanghuy.dang@gmail.com', '0988776655', '105 Phạm Ngũ Lão, Quận 1, TP.HCM', '123456', 0, '2025-05-05 01:25:54', '2025-05-05 01:25:54', 0),
(14, 'Bùi Minh Châu', 'minhchau.bui@gmail.com', '0977332211', '300 Điện Biên Phủ, Bình Thạnh, TP.HCM', '123456', 0, '2025-05-05 01:25:54', '2025-05-05 01:25:54', 0),
(15, 'Trịnh Ngọc Lan', 'ngoclan.trinh@gmail.com', '0966888777', '88 Tô Hiến Thành, Quận 10, TP.HCM', '123456', 0, '2025-05-05 01:25:54', '2025-05-05 01:25:54', 0),
(16, 'Lý Quốc Hưng', 'quochung.ly@gmail.com', '0933667788', '45 Hoàng Sa, Quận 3, TP.HCM', '123456', 0, '2025-05-05 01:25:54', '2025-05-05 01:25:54', 0),
(17, 'Tạ Bảo Ngọc', 'baongoc.ta@gmail.com', '0911223344', '19 Nguyễn Đình Chiểu, Quận 3, TP.HCM', '123456', 0, '2025-05-05 01:25:54', '2025-05-05 01:25:54', 0),
(18, 'Hồ Anh Dũng', 'anhdung.ho@gmail.com', '0944556677', '567 Nguyễn Oanh, Gò Vấp, TP.HCM', '123456', 0, '2025-05-05 01:25:54', '2025-05-05 01:25:54', 0),
(19, 'Phan Thị Kim Oanh', 'kimoanh.phan@gmail.com', '0900998877', '23 Đường số 3, Quận 7, TP.HCM', '123456', 0, '2025-05-05 01:25:54', '2025-05-05 01:25:54', 0),
(20, 'Cao Thanh Tùng', 'thanhtung.cao@gmail.com', '0977996655', '42 Phạm Văn Đồng, Thủ Đức, TP.HCM', '123456', 0, '2025-05-05 01:25:54', '2025-05-05 01:25:54', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `detail_id` (`detail_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `detail`
--
ALTER TABLE `detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`detail_id`) REFERENCES `detail` (`id`);

--
-- Các ràng buộc cho bảng `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
