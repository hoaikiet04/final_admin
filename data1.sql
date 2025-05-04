
CREATE TABLE `User` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `fullname` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `phone_number` VARCHAR(20),
  `address` VARCHAR(255),
  `password` VARCHAR(255) NOT NULL,
  `role` TINYINT DEFAULT 0, -- 0 = user, 1 = admin
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` BOOLEAN DEFAULT 0
);

-- Danh Sách các loại điểm đến chia theo nhóm tui sẽ bổ sung thêm ví dụ: Du lịch biển, Du lịch núi, du lịch sinh thái ...
CREATE TABLE `Category` (
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255) NOT NULL
);


-- Chi tiết của một địa điểm
CREATE TABLE `Detail` (
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `category_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `thumbnail` varchar(255),
  `description` longtext,
  `length` int,
  `address` varchar(255),
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` BOOLEAN DEFAULT 0,
  FOREIGN KEY (`category_id`) REFERENCES `Category`(`id`)
);

-- Feedback khách hàng, này dùng js để hiển thị lên thôi nên kh nối khóa với mấy bảng khác, bảng này độc lập
CREATE TABLE `Feedback` (
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255),
  `phone_number` varchar(20),
  `subject_name` varchar(255),
  `content` TEXT NOT NULL
);

-- để xử lý giỏ hàng riêng biệt
CREATE TABLE `Cart` (
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `user_id` int NOT NULL,
  `detail_id` int NOT NULL,
  `num` int NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `User`(`id`),
  FOREIGN KEY (`detail_id`) REFERENCES `Detail`(`id`)
);


INSERT INTO `Detail` (
  `category_id`, `title`, `price`, `discount`, `thumbnail`, `description`,
  `length`, `address`
) VALUES
