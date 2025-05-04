-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 04, 2025 lúc 09:40 PM
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
(8, 1, 'Du lịch Nha Trang ', 'nhatrang.jpg', 'Tham quan Vinpearl, tắm biển và thưởng thức hải sản tươi sống.', 'Nha Trang, Khánh Hòa', '2025-05-03 09:13:48', '2025-05-05 02:12:17', 0),
(9, 1, 'Khu nghỉ dưỡng Tam Đảo ', 'tamdao.jpg', 'Trải nghiệm không khí mát mẻ và dịch vụ spa tại resort đồi núi.', 'Tam Đảo, Vĩnh Phúc', '2025-05-03 09:13:48', '2025-05-05 02:12:35', 0),
(10, 1, 'Kỳ nghỉ dưỡng Đà Lạt ', 'dalatresort.jpg', 'Resort view thung lũng, có bữa sáng và hồ bơi nước ấm.', 'Đà Lạt, Lâm Đồng', '2025-05-03 09:13:48', '2025-05-05 02:12:46', 0),
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
(24, 1, 'Trà Vinh', 'thuytien.jpg', 'Trà Vinh mảnh đất dừa sáp', 'Trà Vinh', '2025-05-04 19:03:38', '2025-05-04 19:03:38', 0),
(25, 1, 'Resort biển Phú Quốc ', 'phuquocresort.jpg', 'Tận hưởng kỳ nghỉ dưỡng sang trọng tại resort ven biển với dịch vụ cao cấp.', 'Phú Quốc, Kiên Giang', '2025-05-05 02:11:20', '2025-05-05 02:11:53', 0),
(26, 1, 'Kỳ nghỉ tại Six Senses Ninh Vân Bay', 'ninhvanbay.jpg', 'Resort biệt lập giữa thiên nhiên hoang sơ, lý tưởng để thư giãn và phục hồi năng lượng.', 'Nha Trang, Khánh Hòa', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(27, 1, 'Vinpearl Resort Hạ Long', 'vinhalong.jpg', 'Thư giãn tại resort nằm trên đảo riêng biệt giữa vịnh biển Hạ Long.', 'Hạ Long, Quảng Ninh', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(28, 1, 'Ana Mandara Villas Đà Lạt', 'anamandara.jpg', 'Trải nghiệm phong cách nghỉ dưỡng kiểu Pháp giữa rừng thông lãng mạn.', 'Đà Lạt, Lâm Đồng', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(29, 1, 'Fusion Maia Đà Nẵng', 'fusionmaia.jpg', 'Resort kết hợp nghỉ dưỡng và chăm sóc sức khỏe với spa trọn gói.', 'Đà Nẵng', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(30, 1, 'Khu du lịch Bình Quới', 'binhquoi.jpg', 'Không gian làng quê miền Tây giữa lòng thành phố.', 'Bình Thạnh, TP.HCM', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(31, 1, 'Resort Hồ Tràm', 'hotram.jpg', 'Nghỉ dưỡng tại bãi biển Hồ Tràm hoang sơ, yên tĩnh.', 'Bà Rịa - Vũng Tàu', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(32, 2, 'Khám phá Cù Lao Chàm', 'culaocam.jpg', 'Lặn ngắm san hô và khám phá cuộc sống ngư dân đảo.', 'Hội An, Quảng Nam', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(33, 2, 'Tour khám phá thác Bản Giốc', 'bangioc.jpg', 'Tham quan một trong những thác nước đẹp nhất Việt Nam.', 'Cao Bằng', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(34, 2, 'Thám hiểm rừng quốc gia Cát Tiên', 'cattien.jpg', 'Khám phá hệ sinh thái rừng nguyên sinh và các loài động vật quý hiếm.', 'Đồng Nai', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(35, 2, 'Du ngoạn Mù Cang Chải mùa lúa chín', 'mucangchai.jpg', 'Chiêm ngưỡng ruộng bậc thang vàng óng tuyệt đẹp.', 'Yên Bái', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(36, 2, 'Hành trình chinh phục đỉnh Fansipan', 'fansipan.jpg', 'Leo núi hoặc đi cáp treo lên nóc nhà Đông Dương.', 'Lào Cai', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(37, 3, 'Khám phá cố đô Huế', 'hue.jpg', 'Thăm Đại Nội, lăng tẩm vua chúa và trải nghiệm văn hóa cung đình.', 'Huế, Thừa Thiên Huế', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(38, 3, 'Tham quan phố cổ Hội An', 'hoian.jpg', 'Dạo chơi phố cổ đèn lồng, thưởng thức đặc sản và tìm hiểu di sản UNESCO.', 'Hội An, Quảng Nam', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(39, 3, 'Lễ hội chùa Hương', 'chuahuong.jpg', 'Hành hương, lễ Phật và du thuyền qua suối Yến.', 'Mỹ Đức, Hà Nội', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(40, 3, 'Trải nghiệm chợ nổi Cái Răng', 'cairang.jpg', 'Khám phá nét văn hóa miền Tây sông nước.', 'Cần Thơ', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(41, 3, 'Tham quan Văn miếu Trấn Biên', 'tranbien.jpg', 'Di tích văn hóa lâu đời, biểu tượng truyền thống hiếu học.', 'Biên Hòa, Đồng Nai', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(42, 3, 'Lễ hội Kate của người Chăm', 'kate.jpg', 'Tìm hiểu văn hóa dân tộc Chăm tại tháp Pô Nagar.', 'Ninh Thuận', '2025-05-05 02:11:20', '2025-05-05 02:11:20', 0),
(43, 1, 'Khu du lịch sinh thái Làng Bè', 'langbe.jpg', 'Thư giãn trong khung cảnh miền quê sông nước, thưởng thức đặc sản cá lóc nướng trui.', 'Cái Bè, Tiền Giang', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(44, 1, 'Khu nghỉ dưỡng Cồn Phụng', 'conphung.jpg', 'Trải nghiệm không gian xanh ven sông Tiền, thưởng thức kẹo dừa và đờn ca tài tử.', 'Bến Tre', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(45, 1, 'Khu du lịch sinh thái Mỹ Khánh', 'mykhanh.jpg', 'Nơi lý tưởng để thư giãn cuối tuần với hồ bơi, vườn trái cây và dịch vụ nghỉ dưỡng.', 'Phong Điền, Cần Thơ', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(46, 1, 'Nghỉ dưỡng tại khu du lịch Tân Lộc', 'tanloc.jpg', 'Trải nghiệm nhà cổ và cuộc sống miền Tây xưa.', 'Thốt Nốt, Cần Thơ', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(47, 1, 'Homestay Cù Lao Tân Qui', 'tanqui.jpg', 'Nghỉ ngơi tại homestay giữa cù lao xanh mát và tham quan vườn cây trái.', 'Trà Vinh', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(48, 1, 'Khu nghỉ dưỡng Măng Đen', 'mangden.jpg', 'Không khí mát lạnh, hồ nước và rừng thông lý tưởng để nghỉ dưỡng.', 'Kon Tum', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(49, 2, 'Khám phá rừng tràm U Minh Hạ', 'uminhha.jpg', 'Trải nghiệm rừng ngập mặn nguyên sinh và hệ sinh thái đa dạng.', 'Cà Mau', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(50, 2, 'Tham quan rừng ngập mặn Năm Căn', 'namcan.jpg', 'Đi xuồng máy xuyên rừng và tìm hiểu hệ động thực vật rừng mặn.', 'Cà Mau', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(51, 2, 'Chèo xuồng ở Cồn Sơn', 'conson.jpg', 'Tìm hiểu làng bè nuôi cá và thưởng thức bánh dân gian.', 'Cần Thơ', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(52, 2, 'Khám phá cồn Chim', 'conchim.jpg', 'Đi xe đạp xuyên đồng lúa, bắt cá, làm bánh cùng người dân địa phương.', 'Trà Vinh', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(53, 2, 'Lặn bắt sò huyết ở Gành Hào', 'ganhhao.jpg', 'Trải nghiệm làm ngư dân và ăn hải sản tươi sống.', 'Bạc Liêu', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(54, 2, 'Khám phá núi Cấm', 'nuicam.jpg', 'Leo núi, tham quan chùa và chiêm ngưỡng tượng Phật lớn.', 'An Giang', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(55, 2, 'Trải nghiệm mùa nước nổi ở Đồng Tháp Mười', 'nuocnoi.jpg', 'Đi xuồng qua rừng tràm, bắt cá và ngắm hoa sen nở.', 'Đồng Tháp', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(56, 3, 'Tham quan chùa Dơi', 'chuadoi.jpg', 'Ngôi chùa Khmer cổ kính, nơi trú ngụ của hàng nghìn con dơi.', 'Sóc Trăng', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(57, 3, 'Lễ hội Nghinh Ông Cần Giờ', 'nghinhong.jpg', 'Lễ hội truyền thống tôn vinh nghề biển và cầu ngư may mắn.', 'TP.HCM', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(58, 3, 'Tham quan chùa Hang', 'chuahang.jpg', 'Ngôi chùa nằm bên bờ biển với tượng Quan Âm quay ra khơi.', 'Trà Vinh', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(59, 3, 'Khám phá Làng hoa Sa Đéc', 'langhoa.jpg', 'Làng nghề truyền thống với hàng ngàn loài hoa rực rỡ quanh năm.', 'Sa Đéc, Đồng Tháp', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(60, 3, 'Tham quan nhà Công tử Bạc Liêu', 'congtubaclieu.jpg', 'Ngôi biệt thự cổ phản ánh lối sống xa hoa một thời.', 'Bạc Liêu', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(61, 3, 'Lễ hội Ok Om Bok', 'okom.jpg', 'Lễ hội cúng trăng đặc sắc của người Khmer Nam Bộ.', 'Trà Vinh', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0),
(62, 3, 'Tìm hiểu chợ nổi Ngã Năm', 'nganam.jpg', 'Chợ nổi tấp nập nơi giao thoa 5 con sông – nét văn hóa sông nước độc đáo.', 'Sóc Trăng', '2025-05-05 02:26:41', '2025-05-05 02:26:41', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

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
