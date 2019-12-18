-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2018 at 08:40 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mobilestorenew`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE IF NOT EXISTS `bill` (
`id` int(11) NOT NULL,
  `full_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `total` int(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `full_name`, `email`, `phone`, `address`, `total`) VALUES
(5, NULL, '', '', '', 0),
(6, 'Ngô Tiến Đạt', 'datngo.bk@gmail.com', '0981192092', 'Đông Anh - Hà Nội', 52999000);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE IF NOT EXISTS `bill_detail` (
  `bill_id` int(11) NOT NULL DEFAULT '0',
  `phone_id` int(11) NOT NULL DEFAULT '0',
  `number` int(11) DEFAULT NULL,
  `price_unit` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`bill_id`, `phone_id`, `number`, `price_unit`) VALUES
(6, 2, 1, 29000000),
(6, 9, 1, 23999000);

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
`id` int(11) NOT NULL,
  `title` varchar(1000) CHARACTER SET utf16 COLLATE utf16_vietnamese_ci NOT NULL,
  `img` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `intro` text CHARACTER SET utf16 COLLATE utf16_vietnamese_ci NOT NULL,
  `author` text CHARACTER SET utf16 COLLATE utf16_vietnamese_ci NOT NULL,
  `posted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `img`, `intro`, `author`, `posted_at`, `content`) VALUES
(1, 'Team Tin Tức TGDĐ đã có HTC Desire 12, Desire 12 Plus: Sẽ sớm trên tay', '11_800x450.png', 'Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus.', 'admin', '2018-05-11 02:09:41', '<p>Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus. Và ngay sau đó, Team Tin Tức TGDĐ đã có 2 em ấy trong tay. Bọn mình sẽ sớm trên tay để gửi đến các bạn!Dưới đây sẽ là một số ảnh chụp với bộ đôi HTC Desire mới ngay trong hôm nay, mời các bạn cùng chiêm ngưỡng.</p><br/> <img src="/MobileStore/resources/theme1/images/blogs/13_800x450.png" alt=""/><br/><p>Nhắc lại một xíu về cấu hình, HTC Desire 12 có màn hình chỉ 5.5 inch tỉ lệ 18:9 với độ phân giải HD và camera trước - sau 5/13 MP. Máy sử dụng bộ vi xử lý MediaTek 6739 kết hợp với 3 GB RAM.Trên HTC Desire 12 không được tích hợp cảm biến vân tay, và thiết bị xuất hiện với các phiên bản màu đen, bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/14_800x450.png"/><br/><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9258_800x451.jpg"/><br/><p>Còn đối với HTC Desire 12+ thì máy được trang bị màn hình LCD IPS 5.99 inch độ phân giải 1.440 x 720 px, camera kép mặt sau 13 MP + 2 MP và camera selfie 8MP.Chưa hết, máy còn sử dụng bộ vi xử lý Snapdragon 450 đi kèm 3 GB RAM, chạy hệ điều hành Android 8 Oreo và cảm biến vân tay ở mặt lưng. Được biết, HTC Desire 12+ cũng có hai phiên bản màu đen và bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9261_800x451.jpg"/><br/><p>Nhìn chung, thiết kế của HTC Desire 12 và Desire 12 Plus đã khá quen thuộc, nhưng lần này HTC đã làm màn hình với tỉ lệ 18:9. Tuy nhiên, mình nghĩ bấy nhiêu đây đã đủ để HTC fan đứng ngồi không yên rồi đúng không nào?Hãy tiếp tục theo dõi trang tin tức Thế giới Di Động để đón đọc các bài đánh giá chi tiết hơn về bộ đôi smartphone này nhé!</p>'),
(2, 'Team Tin Tức TGDĐ đã có HTC Desire 12, Desire 12 Plus: Sẽ sớm trên tay', '11_800x450.png', 'Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus.', 'admin', '2018-05-11 02:09:45', '<p>Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus. Và ngay sau đó, Team Tin Tức TGDĐ đã có 2 em ấy trong tay. Bọn mình sẽ sớm trên tay để gửi đến các bạn!Dưới đây sẽ là một số ảnh chụp với bộ đôi HTC Desire mới ngay trong hôm nay, mời các bạn cùng chiêm ngưỡng.</p><br/> <img src="/MobileStore/resources/theme1/images/blogs/13_800x450.png" alt=""/><br/><p>Nhắc lại một xíu về cấu hình, HTC Desire 12 có màn hình chỉ 5.5 inch tỉ lệ 18:9 với độ phân giải HD và camera trước - sau 5/13 MP. Máy sử dụng bộ vi xử lý MediaTek 6739 kết hợp với 3 GB RAM.Trên HTC Desire 12 không được tích hợp cảm biến vân tay, và thiết bị xuất hiện với các phiên bản màu đen, bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/14_800x450.png"/><br/><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9258_800x451.jpg"/><br/><p>Còn đối với HTC Desire 12+ thì máy được trang bị màn hình LCD IPS 5.99 inch độ phân giải 1.440 x 720 px, camera kép mặt sau 13 MP + 2 MP và camera selfie 8MP.Chưa hết, máy còn sử dụng bộ vi xử lý Snapdragon 450 đi kèm 3 GB RAM, chạy hệ điều hành Android 8 Oreo và cảm biến vân tay ở mặt lưng. Được biết, HTC Desire 12+ cũng có hai phiên bản màu đen và bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9261_800x451.jpg"/><br/><p>Nhìn chung, thiết kế của HTC Desire 12 và Desire 12 Plus đã khá quen thuộc, nhưng lần này HTC đã làm màn hình với tỉ lệ 18:9. Tuy nhiên, mình nghĩ bấy nhiêu đây đã đủ để HTC fan đứng ngồi không yên rồi đúng không nào?Hãy tiếp tục theo dõi trang tin tức Thế giới Di Động để đón đọc các bài đánh giá chi tiết hơn về bộ đôi smartphone này nhé!</p>'),
(3, 'Team Tin Tức TGDĐ đã có HTC Desire 12, Desire 12 Plus: Sẽ sớm trên tay', '11_800x450.png', 'Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus.', 'admin', '2018-05-11 02:09:41', '<p>Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus. Và ngay sau đó, Team Tin Tức TGDĐ đã có 2 em ấy trong tay. Bọn mình sẽ sớm trên tay để gửi đến các bạn!Dưới đây sẽ là một số ảnh chụp với bộ đôi HTC Desire mới ngay trong hôm nay, mời các bạn cùng chiêm ngưỡng.</p><br/> <img src="/MobileStore/resources/theme1/images/blogs/13_800x450.png" alt=""/><br/><p>Nhắc lại một xíu về cấu hình, HTC Desire 12 có màn hình chỉ 5.5 inch tỉ lệ 18:9 với độ phân giải HD và camera trước - sau 5/13 MP. Máy sử dụng bộ vi xử lý MediaTek 6739 kết hợp với 3 GB RAM.Trên HTC Desire 12 không được tích hợp cảm biến vân tay, và thiết bị xuất hiện với các phiên bản màu đen, bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/14_800x450.png"/><br/><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9258_800x451.jpg"/><br/><p>Còn đối với HTC Desire 12+ thì máy được trang bị màn hình LCD IPS 5.99 inch độ phân giải 1.440 x 720 px, camera kép mặt sau 13 MP + 2 MP và camera selfie 8MP.Chưa hết, máy còn sử dụng bộ vi xử lý Snapdragon 450 đi kèm 3 GB RAM, chạy hệ điều hành Android 8 Oreo và cảm biến vân tay ở mặt lưng. Được biết, HTC Desire 12+ cũng có hai phiên bản màu đen và bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9261_800x451.jpg"/><br/><p>Nhìn chung, thiết kế của HTC Desire 12 và Desire 12 Plus đã khá quen thuộc, nhưng lần này HTC đã làm màn hình với tỉ lệ 18:9. Tuy nhiên, mình nghĩ bấy nhiêu đây đã đủ để HTC fan đứng ngồi không yên rồi đúng không nào?Hãy tiếp tục theo dõi trang tin tức Thế giới Di Động để đón đọc các bài đánh giá chi tiết hơn về bộ đôi smartphone này nhé!</p>'),
(4, 'Team Tin Tức TGDĐ đã có HTC Desire 12, Desire 12 Plus: Sẽ sớm trên tay', '11_800x450.png', 'Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus.', 'admin', '2018-05-11 02:09:41', '<p>Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus. Và ngay sau đó, Team Tin Tức TGDĐ đã có 2 em ấy trong tay. Bọn mình sẽ sớm trên tay để gửi đến các bạn!Dưới đây sẽ là một số ảnh chụp với bộ đôi HTC Desire mới ngay trong hôm nay, mời các bạn cùng chiêm ngưỡng.</p><br/> <img src="/MobileStore/resources/theme1/images/blogs/13_800x450.png" alt=""/><br/><p>Nhắc lại một xíu về cấu hình, HTC Desire 12 có màn hình chỉ 5.5 inch tỉ lệ 18:9 với độ phân giải HD và camera trước - sau 5/13 MP. Máy sử dụng bộ vi xử lý MediaTek 6739 kết hợp với 3 GB RAM.Trên HTC Desire 12 không được tích hợp cảm biến vân tay, và thiết bị xuất hiện với các phiên bản màu đen, bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/14_800x450.png"/><br/><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9258_800x451.jpg"/><br/><p>Còn đối với HTC Desire 12+ thì máy được trang bị màn hình LCD IPS 5.99 inch độ phân giải 1.440 x 720 px, camera kép mặt sau 13 MP + 2 MP và camera selfie 8MP.Chưa hết, máy còn sử dụng bộ vi xử lý Snapdragon 450 đi kèm 3 GB RAM, chạy hệ điều hành Android 8 Oreo và cảm biến vân tay ở mặt lưng. Được biết, HTC Desire 12+ cũng có hai phiên bản màu đen và bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9261_800x451.jpg"/><br/><p>Nhìn chung, thiết kế của HTC Desire 12 và Desire 12 Plus đã khá quen thuộc, nhưng lần này HTC đã làm màn hình với tỉ lệ 18:9. Tuy nhiên, mình nghĩ bấy nhiêu đây đã đủ để HTC fan đứng ngồi không yên rồi đúng không nào?Hãy tiếp tục theo dõi trang tin tức Thế giới Di Động để đón đọc các bài đánh giá chi tiết hơn về bộ đôi smartphone này nhé!</p>'),
(5, 'Team Tin Tức TGDĐ đã có HTC Desire 12, Desire 12 Plus: Sẽ sớm trên tay', '11_800x450.png', 'Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus.', 'admin', '2018-05-11 02:09:41', '<p>Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus. Và ngay sau đó, Team Tin Tức TGDĐ đã có 2 em ấy trong tay. Bọn mình sẽ sớm trên tay để gửi đến các bạn!Dưới đây sẽ là một số ảnh chụp với bộ đôi HTC Desire mới ngay trong hôm nay, mời các bạn cùng chiêm ngưỡng.</p><br/> <img src="/MobileStore/resources/theme1/images/blogs/13_800x450.png" alt=""/><br/><p>Nhắc lại một xíu về cấu hình, HTC Desire 12 có màn hình chỉ 5.5 inch tỉ lệ 18:9 với độ phân giải HD và camera trước - sau 5/13 MP. Máy sử dụng bộ vi xử lý MediaTek 6739 kết hợp với 3 GB RAM.Trên HTC Desire 12 không được tích hợp cảm biến vân tay, và thiết bị xuất hiện với các phiên bản màu đen, bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/14_800x450.png"/><br/><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9258_800x451.jpg"/><br/><p>Còn đối với HTC Desire 12+ thì máy được trang bị màn hình LCD IPS 5.99 inch độ phân giải 1.440 x 720 px, camera kép mặt sau 13 MP + 2 MP và camera selfie 8MP.Chưa hết, máy còn sử dụng bộ vi xử lý Snapdragon 450 đi kèm 3 GB RAM, chạy hệ điều hành Android 8 Oreo và cảm biến vân tay ở mặt lưng. Được biết, HTC Desire 12+ cũng có hai phiên bản màu đen và bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9261_800x451.jpg"/><br/><p>Nhìn chung, thiết kế của HTC Desire 12 và Desire 12 Plus đã khá quen thuộc, nhưng lần này HTC đã làm màn hình với tỉ lệ 18:9. Tuy nhiên, mình nghĩ bấy nhiêu đây đã đủ để HTC fan đứng ngồi không yên rồi đúng không nào?Hãy tiếp tục theo dõi trang tin tức Thế giới Di Động để đón đọc các bài đánh giá chi tiết hơn về bộ đôi smartphone này nhé!</p>'),
(6, 'Team Tin Tức TGDĐ đã có HTC Desire 12, Desire 12 Plus: Sẽ sớm trên tay', '11_800x450.png', 'Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus.', 'admin', '2018-05-11 02:09:41', '<p>Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus. Và ngay sau đó, Team Tin Tức TGDĐ đã có 2 em ấy trong tay. Bọn mình sẽ sớm trên tay để gửi đến các bạn!Dưới đây sẽ là một số ảnh chụp với bộ đôi HTC Desire mới ngay trong hôm nay, mời các bạn cùng chiêm ngưỡng.</p><br/> <img src="/MobileStore/resources/theme1/images/blogs/13_800x450.png" alt=""/><br/><p>Nhắc lại một xíu về cấu hình, HTC Desire 12 có màn hình chỉ 5.5 inch tỉ lệ 18:9 với độ phân giải HD và camera trước - sau 5/13 MP. Máy sử dụng bộ vi xử lý MediaTek 6739 kết hợp với 3 GB RAM.Trên HTC Desire 12 không được tích hợp cảm biến vân tay, và thiết bị xuất hiện với các phiên bản màu đen, bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/14_800x450.png"/><br/><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9258_800x451.jpg"/><br/><p>Còn đối với HTC Desire 12+ thì máy được trang bị màn hình LCD IPS 5.99 inch độ phân giải 1.440 x 720 px, camera kép mặt sau 13 MP + 2 MP và camera selfie 8MP.Chưa hết, máy còn sử dụng bộ vi xử lý Snapdragon 450 đi kèm 3 GB RAM, chạy hệ điều hành Android 8 Oreo và cảm biến vân tay ở mặt lưng. Được biết, HTC Desire 12+ cũng có hai phiên bản màu đen và bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9261_800x451.jpg"/><br/><p>Nhìn chung, thiết kế của HTC Desire 12 và Desire 12 Plus đã khá quen thuộc, nhưng lần này HTC đã làm màn hình với tỉ lệ 18:9. Tuy nhiên, mình nghĩ bấy nhiêu đây đã đủ để HTC fan đứng ngồi không yên rồi đúng không nào?Hãy tiếp tục theo dõi trang tin tức Thế giới Di Động để đón đọc các bài đánh giá chi tiết hơn về bộ đôi smartphone này nhé!</p>'),
(7, 'Team Tin Tức TGDĐ đã có HTC Desire 12, Desire 12 Plus: Sẽ sớm trên tay', '11_800x450.png', 'Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus.', 'admin', '2018-05-11 02:09:41', '<p>Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus. Và ngay sau đó, Team Tin Tức TGDĐ đã có 2 em ấy trong tay. Bọn mình sẽ sớm trên tay để gửi đến các bạn!Dưới đây sẽ là một số ảnh chụp với bộ đôi HTC Desire mới ngay trong hôm nay, mời các bạn cùng chiêm ngưỡng.</p><br/> <img src="/MobileStore/resources/theme1/images/blogs/13_800x450.png" alt=""/><br/><p>Nhắc lại một xíu về cấu hình, HTC Desire 12 có màn hình chỉ 5.5 inch tỉ lệ 18:9 với độ phân giải HD và camera trước - sau 5/13 MP. Máy sử dụng bộ vi xử lý MediaTek 6739 kết hợp với 3 GB RAM.Trên HTC Desire 12 không được tích hợp cảm biến vân tay, và thiết bị xuất hiện với các phiên bản màu đen, bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/14_800x450.png"/><br/><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9258_800x451.jpg"/><br/><p>Còn đối với HTC Desire 12+ thì máy được trang bị màn hình LCD IPS 5.99 inch độ phân giải 1.440 x 720 px, camera kép mặt sau 13 MP + 2 MP và camera selfie 8MP.Chưa hết, máy còn sử dụng bộ vi xử lý Snapdragon 450 đi kèm 3 GB RAM, chạy hệ điều hành Android 8 Oreo và cảm biến vân tay ở mặt lưng. Được biết, HTC Desire 12+ cũng có hai phiên bản màu đen và bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9261_800x451.jpg"/><br/><p>Nhìn chung, thiết kế của HTC Desire 12 và Desire 12 Plus đã khá quen thuộc, nhưng lần này HTC đã làm màn hình với tỉ lệ 18:9. Tuy nhiên, mình nghĩ bấy nhiêu đây đã đủ để HTC fan đứng ngồi không yên rồi đúng không nào?Hãy tiếp tục theo dõi trang tin tức Thế giới Di Động để đón đọc các bài đánh giá chi tiết hơn về bộ đôi smartphone này nhé!</p>'),
(8, 'Team Tin Tức TGDĐ đã có HTC Desire 12, Desire 12 Plus: Sẽ sớm trên tay', '11_800x450.png', 'Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus.', 'admin', '2018-05-11 02:09:41', '<p>Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus. Và ngay sau đó, Team Tin Tức TGDĐ đã có 2 em ấy trong tay. Bọn mình sẽ sớm trên tay để gửi đến các bạn!Dưới đây sẽ là một số ảnh chụp với bộ đôi HTC Desire mới ngay trong hôm nay, mời các bạn cùng chiêm ngưỡng.</p><br/> <img src="/MobileStore/resources/theme1/images/blogs/13_800x450.png" alt=""/><br/><p>Nhắc lại một xíu về cấu hình, HTC Desire 12 có màn hình chỉ 5.5 inch tỉ lệ 18:9 với độ phân giải HD và camera trước - sau 5/13 MP. Máy sử dụng bộ vi xử lý MediaTek 6739 kết hợp với 3 GB RAM.Trên HTC Desire 12 không được tích hợp cảm biến vân tay, và thiết bị xuất hiện với các phiên bản màu đen, bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/14_800x450.png"/><br/><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9258_800x451.jpg"/><br/><p>Còn đối với HTC Desire 12+ thì máy được trang bị màn hình LCD IPS 5.99 inch độ phân giải 1.440 x 720 px, camera kép mặt sau 13 MP + 2 MP và camera selfie 8MP.Chưa hết, máy còn sử dụng bộ vi xử lý Snapdragon 450 đi kèm 3 GB RAM, chạy hệ điều hành Android 8 Oreo và cảm biến vân tay ở mặt lưng. Được biết, HTC Desire 12+ cũng có hai phiên bản màu đen và bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9261_800x451.jpg"/><br/><p>Nhìn chung, thiết kế của HTC Desire 12 và Desire 12 Plus đã khá quen thuộc, nhưng lần này HTC đã làm màn hình với tỉ lệ 18:9. Tuy nhiên, mình nghĩ bấy nhiêu đây đã đủ để HTC fan đứng ngồi không yên rồi đúng không nào?Hãy tiếp tục theo dõi trang tin tức Thế giới Di Động để đón đọc các bài đánh giá chi tiết hơn về bộ đôi smartphone này nhé!</p>'),
(9, 'Team Tin Tức TGDĐ đã có HTC Desire 12, Desire 12 Plus: Sẽ sớm trên tay', '11_800x450.png', 'Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus.', 'admin', '2018-05-11 02:09:41', '<p>Mới đây, HTC đã ra mắt bộ đôi smartphone tầm trung hỗ trợ màn hình tỉ lệ 18:9 là HTC Desire 12 và Desire 12 Plus. Và ngay sau đó, Team Tin Tức TGDĐ đã có 2 em ấy trong tay. Bọn mình sẽ sớm trên tay để gửi đến các bạn!Dưới đây sẽ là một số ảnh chụp với bộ đôi HTC Desire mới ngay trong hôm nay, mời các bạn cùng chiêm ngưỡng.</p><br/> <img src="/MobileStore/resources/theme1/images/blogs/13_800x450.png" alt=""/><br/><p>Nhắc lại một xíu về cấu hình, HTC Desire 12 có màn hình chỉ 5.5 inch tỉ lệ 18:9 với độ phân giải HD và camera trước - sau 5/13 MP. Máy sử dụng bộ vi xử lý MediaTek 6739 kết hợp với 3 GB RAM.Trên HTC Desire 12 không được tích hợp cảm biến vân tay, và thiết bị xuất hiện với các phiên bản màu đen, bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/14_800x450.png"/><br/><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9258_800x451.jpg"/><br/><p>Còn đối với HTC Desire 12+ thì máy được trang bị màn hình LCD IPS 5.99 inch độ phân giải 1.440 x 720 px, camera kép mặt sau 13 MP + 2 MP và camera selfie 8MP.Chưa hết, máy còn sử dụng bộ vi xử lý Snapdragon 450 đi kèm 3 GB RAM, chạy hệ điều hành Android 8 Oreo và cảm biến vân tay ở mặt lưng. Được biết, HTC Desire 12+ cũng có hai phiên bản màu đen và bạc.</p><br/><img src="/MobileStore/resources/theme1/images/blogs/dscf9261_800x451.jpg"/><br/><p>Nhìn chung, thiết kế của HTC Desire 12 và Desire 12 Plus đã khá quen thuộc, nhưng lần này HTC đã làm màn hình với tỉ lệ 18:9. Tuy nhiên, mình nghĩ bấy nhiêu đây đã đủ để HTC fan đứng ngồi không yên rồi đúng không nào?Hãy tiếp tục theo dõi trang tin tức Thế giới Di Động để đón đọc các bài đánh giá chi tiết hơn về bộ đôi smartphone này nhé!</p>');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
`id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'Apple'),
(2, 'Samsung'),
(3, 'Sony'),
(4, 'Nokia'),
(5, 'Vivo'),
(6, 'Asus'),
(7, 'Huawei'),
(8, 'MEIZU'),
(9, 'Wiko'),
(10, 'Xiaomi'),
(11, 'Mobiistar');

-- --------------------------------------------------------

--
-- Table structure for table `contact_info`
--

CREATE TABLE IF NOT EXISTS `contact_info` (
  `phone` varchar(20) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE IF NOT EXISTS `phone` (
`id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `screen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `os` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `front_camera` int(11) DEFAULT NULL,
  `following_camera` int(11) DEFAULT NULL,
  `cpu` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ram` double DEFAULT NULL,
  `memory` double DEFAULT NULL,
  `memory_card` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `sim` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `battery` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `image` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`id`, `name`, `screen`, `os`, `front_camera`, `following_camera`, `cpu`, `ram`, `memory`, `memory_card`, `sim`, `battery`, `brand_id`, `image`, `price`, `amount`) VALUES
(2, 'iPhone X 64GB', '2436 x 1125 pixel', '	iOS 11', 7, 12, 'Apple A11 Bionic', 3, 64, 'không có', NULL, '2716 mAh', 1, '636483223586180190_1;636483223586024189_2;636483223586180190_3;636483223586024189_4', 29000000, NULL),
(3, 'Xiaomi Redmi 5 Plus', '1080 x 2160 Pixels', 'Android 7.1', 5, 12, 'Snapdragon 625', 3, 32, '256', 'Nano SIM & Micro SIM', '4000 mAh', 10, '636549777491044706_1;636549777491668662_2;636549777491668662_3;636549777491668662_4', 3990000, NULL),
(4, 'Xiaomi Redmi 4X', '720 x 1280 pixels', 'Android 6.0 (Marshma', 5, 13, NULL, 3, 32, 'Qualcomm Snapdragon 435', '	Micro+Nano', '4100 mAh', 10, '636453072940146775_1;636453072940146775_2;636453072940146775_3;636453072940146775_4', 3690000, NULL),
(6, 'Wiko U Pulse', '5.5 inch', 'Android 7.0 Nougat', 8, 13, 'MTK 6737, 4 Nhân, 1.3GHz Quad Core', 3, 32, '128', NULL, '3000 mAh', 9, '636048668918046639_MEIZU-M3-note-gold;', 2990000, NULL),
(7, 'Samsung Galaxy S8', '5.8 inch Super AMOLED (2560 x 1440 pixel)', 'Android 7.0 (Nougat)', 8, 12, 'Exynos 8895, 8 Nhân, Lõi Tám (lõi T? 2.3GHz + lõi ', 4, 64, '256', 'Nano-SIM', '3000', 2, '636396217066191623_1;636396217066191623_2;636396217066191623_3;636396217066191623_4', 15900000, NULL),
(8, 'iPhone 7 Plus 128GB', '5.5 inch (1920 x 1080 pixels)', 'IOS10', 7, 12, 'Apple A10', 3, 256, 'không có', '1 Sim', '11.1 Wh (2900 mAh)', 1, '636159465434419320_ip7p-jet-1;636159465562964968_ip7p-jet-3;636159465566553014_ip7p-jet-2', 21999000, 100),
(9, 'iPhone 7 Plus 256GB', '5.5 inch (1920 x 1080 pixels)', 'IOS10', 7, 12, 'Apple A10', 3, 256, 'không có', '1 Sim', '11.1 Wh (2900 mAh)', 1, '636159465434419320_ip7p-jet-1;636159465562964968_ip7p-jet-3;636159465566553014_ip7p-jet-2', 23999000, 100),
(10, 'iPhone 6 32GB (2017)', '4.7 inch (1334 x 750 pixels)', 'IOS10', 1, 8, 'Apple A8 2 nhân 64-bit, 2 Nhân, 1.4 GHz', 1, 32, 'không có', '1 sim', '1810mAh', 1, '636506509527994185_iphone6-32GB;636506509528306435_iphone6-32GB-2;636506509527838060_iphone6-32GB-1', 8499000, 999),
(11, 'Samsung Galaxy Note 8 256GB', ' 6.3 inch', 'Android7.1.1(Nougat)', 8, 12, ' Exynos 8895, 8 Nhân, Lõi Tám (lõi Tứ 2.3GHz + lõi', 6, 256, '256', 'nano sim', 'Li-Ion 3300 mAh', 2, '636486694734648848_1;636159465566553014_ip7p-jet-2;636486695952803636_3', 22490000, 800),
(12, 'iPhone 6 64GB (2017)', '4.7 inch (1334 x 750 pixels)', 'IOS10', 1, 8, 'Apple A8 2 nhân 64-bit, 2 Nhân, 1.4 GHz', 1, 64, 'không có', '1 sim', '1810mAh', 1, '636506509527994185_iphone6-32GB;636506509528306435_iphone6-32GB-2;636506509527838060_iphone6-32GB-1', 9499000, 999),
(13, 'iPhone 6 128GB (2017)', '4.7 inch (1334 x 750 pixels)', 'IOS10', 1, 8, 'Apple A8 2 nhân 64-bit, 2 Nhân, 1.4 GHz', 1, 128, 'không có', '1 sim', '1810mAh', 1, '636506509527994185_iphone6-32GB;636506509528306435_iphone6-32GB-2;636506509527838060_iphone6-32GB-1', 10499000, 999),
(14, 'Samsung Galaxy Note 8 64GB', ' 6.3 inch', 'Android7.1.1(Nougat)', 8, 12, ' Exynos 8895, 8 Nhân, Lõi Tám (lõi Tứ 2.3GHz + lõi', 6, 64, '256', 'nano sim', 'Li-Ion 3300 mAh', 2, '636486694734648848_1;636159465566553014_ip7p-jet-2;636486695952803636_3', 20490000, 800),
(15, 'Xiaomi Redmi 3X', '720 x 1280 pixels', 'Android 6.0 (Marshma', 5, 13, NULL, 3, 32, 'Qualcomm Snapdragon 435', '	Micro+Nano', '4100 mAh', 10, '636453072940146775_1;636453072940146775_2;636453072940146775_3;636453072940146775_4', 3090000, NULL),
(16, 'Wiko U Pulse Plus', '5.5 inch', 'Android 7.0 Nougat', 8, 13, 'MTK 6737, 4 Nhân, 1.3GHz Quad Core', 3, 32, '128', NULL, '3000 mAh', 9, '636048668918046639_MEIZU-M3-note-gold;', 3490000, NULL),
(17, 'Xiaomi Redmi 5', '1080 x 2160 Pixels', 'Android 7.1', 5, 12, 'Snapdragon 625', 3, 32, '256', 'Nano SIM & Micro SIM', '4000 mAh', 10, '636549777491044706_1;636549777491668662_2;636549777491668662_3;636549777491668662_4', 3490000, NULL),
(18, 'iPhone 7 Plus 64GB', '5.5 inch (1920 x 1080 pixels)', 'IOS10', 7, 12, 'Apple A10', 3, 256, 'không có', '1 Sim', '11.1 Wh (2900 mAh)', 1, '636159465434419320_ip7p-jet-1;636159465562964968_ip7p-jet-3;636159465566553014_ip7p-jet-2', 21999000, 100),
(19, 'iPhone X 128GB', '2436 x 1125 pixel', '	iOS 11', 7, 12, 'Apple A11 Bionic', 3, 64, 'không có', NULL, '2716 mAh', 1, '636483223586180190_1;636483223586024189_2;636483223586180190_3;636483223586024189_4', 30100000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `name` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `username` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `password` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
 ADD PRIMARY KEY (`bill_id`,`phone_id`), ADD KEY `phone_id` (`phone_id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
 ADD PRIMARY KEY (`id`), ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `phone`
--
ALTER TABLE `phone`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_detail`
--
ALTER TABLE `bill_detail`
ADD CONSTRAINT `bill_detail_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
ADD CONSTRAINT `bill_detail_ibfk_2` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`);

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
