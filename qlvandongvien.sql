-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th5 14, 2024 lúc 04:55 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlvandongvien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `athlete`
--

CREATE TABLE `athlete` (
  `id` bigint NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dob` date DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `coach` bigint DEFAULT NULL,
  `specialize_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  `glycemic_index` varchar(255) DEFAULT NULL,
  `heartbeat` varchar(255) DEFAULT NULL,
  `pathological` varchar(255) DEFAULT NULL,
  `physical` varchar(255) DEFAULT NULL,
  `physical_classification` varchar(255) DEFAULT NULL,
  `stress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `athlete`
--

INSERT INTO `athlete` (`id`, `description`, `dob`, `height`, `weight`, `coach`, `specialize_id`, `user_id`, `blood_group`, `blood_pressure`, `bmi`, `glycemic_index`, `heartbeat`, `pathological`, `physical`, `physical_classification`, `stress`) VALUES
(1, '<div class=\"hatnote navigation-not-searchable\" role=\"note\">\"Messi\" đổi hướng tới đ&acirc;y. Đối với c&aacute;c định nghĩa kh&aacute;c, xem&nbsp;<a class=\"mw-disambig\" title=\"Messi (định hướng)\" href=\"https://vi.wikipedia.org/wiki/Messi_(%C4%91%E1%BB%8Bnh_h%C6%B0%E1%BB%9Bng)\">Messi (định hướng)</a>.</div>\n<table class=\"infobox vcard\"><caption class=\"fn\">Lionel Messi</caption>\n<tbody>\n<tr>\n<td colspan=\"4\"><span class=\"mw-default-size\"><a class=\"mw-file-description\" href=\"https://vi.wikipedia.org/wiki/T%E1%BA%ADp_tin:Lionel-Messi-Argentina-2022-FIFA-World-Cup_(cropped).jpg\"><img class=\"mw-file-element\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg/220px-Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg/330px-Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg 2x\" width=\"220\" height=\"299\" data-file-width=\"364\" data-file-height=\"494\"></a></span>\n<div>Messi thi đấu cho&nbsp;<a title=\"Đội tuyển b&oacute;ng đ&aacute; quốc gia Argentina\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tuy%E1%BB%83n_b%C3%B3ng_%C4%91%C3%A1_qu%E1%BB%91c_gia_Argentina\">Argentina</a>&nbsp;tại&nbsp;<a class=\"mw-redirect\" title=\"FIFA World Cup 2022\" href=\"https://vi.wikipedia.org/wiki/FIFA_World_Cup_2022\">FIFA World Cup 2022</a></div>\n</td>\n</tr>\n<tr>\n<th colspan=\"4\">Th&ocirc;ng tin c&aacute; nh&acirc;n</th>\n</tr>\n<tr>\n<th scope=\"row\">T&ecirc;n đầy đủ</th>\n<td class=\"nickname\" colspan=\"3\">Lionel Andr&eacute;s Messi<sup id=\"cite_ref-NameBirthHeight_1-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-NameBirthHeight-1\">[1]</a></sup></td>\n</tr>\n<tr>\n<th scope=\"row\">Ng&agrave;y sinh</th>\n<td colspan=\"3\">24 th&aacute;ng 6, 1987&nbsp;<span class=\"noprint\">(36&nbsp;tuổi)</span><sup id=\"cite_ref-NameBirthHeight_1-1\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-NameBirthHeight-1\">[1]</a></sup></td>\n</tr>\n<tr>\n<th scope=\"row\">Nơi sinh</th>\n<td class=\"birthplace\" colspan=\"3\"><a title=\"Rosario\" href=\"https://vi.wikipedia.org/wiki/Rosario\">Rosario</a>, Argentina</td>\n</tr>\n<tr>\n<th scope=\"row\">Chiều cao</th>\n<td colspan=\"3\">1,70&nbsp;m (5&nbsp;ft 7&nbsp;in)<sup id=\"cite_ref-NameBirthHeight_1-2\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-NameBirthHeight-1\">[1]</a></sup></td>\n</tr>\n<tr>\n<th scope=\"row\">Vị tr&iacute;</th>\n<td class=\"role\" colspan=\"3\"><a title=\"Tiền đạo (b&oacute;ng đ&aacute;)\" href=\"https://vi.wikipedia.org/wiki/Ti%E1%BB%81n_%C4%91%E1%BA%A1o_(b%C3%B3ng_%C4%91%C3%A1)\">Tiền đạo</a>,&nbsp;<a title=\"Tiền vệ (b&oacute;ng đ&aacute;)\" href=\"https://vi.wikipedia.org/wiki/Ti%E1%BB%81n_v%E1%BB%87_(b%C3%B3ng_%C4%91%C3%A1)\">tiền vệ tấn c&ocirc;ng</a></td>\n</tr>\n<tr>\n<th colspan=\"4\">Th&ocirc;ng tin đội</th>\n</tr>\n<tr>\n<th scope=\"row\">\n<div>Đội hiện nay</div>\n</th>\n<td class=\"org\" colspan=\"3\"><a title=\"Inter Miami CF\" href=\"https://vi.wikipedia.org/wiki/Inter_Miami_CF\">Inter Miami</a></td>\n</tr>\n<tr>\n<th scope=\"row\">Số &aacute;o</th>\n<td colspan=\"3\">10</td>\n</tr>\n<tr>\n<th colspan=\"4\">Sự nghiệp cầu thủ trẻ</th>\n</tr>\n<tr>\n<th scope=\"row\">Năm</th>\n<td colspan=\"3\"><strong>Đội</strong></td>\n</tr>\n<tr>\n<th scope=\"row\">1992&ndash;1995</th>\n<td colspan=\"3\">Grandoli</td>\n</tr>\n<tr>\n<th scope=\"row\">1995&ndash;2000</th>\n<td colspan=\"3\"><a title=\"Newell\'s Old Boys\" href=\"https://vi.wikipedia.org/wiki/Newell%27s_Old_Boys\">Newell\'s Old Boys</a></td>\n</tr>\n<tr>\n<th scope=\"row\">2000&ndash;2003</th>\n<td colspan=\"3\"><a title=\"FC Barcelona\" href=\"https://vi.wikipedia.org/wiki/FC_Barcelona\">Barcelona</a></td>\n</tr>\n<tr>\n<th colspan=\"4\">Sự nghiệp cầu thủ chuy&ecirc;n nghiệp*</th>\n</tr>\n<tr>\n<th scope=\"row\">Năm</th>\n<td><strong>Đội</strong></td>\n<td><strong><abbr title=\"Số trận ra s&acirc;n ở giải quốc gia\">ST</abbr></strong></td>\n<td><strong>(<abbr title=\"Số b&agrave;n thắng ở giải quốc gia\">BT</abbr>)</strong></td>\n</tr>\n<tr>\n<th scope=\"row\">2003&ndash;2004</th>\n<td><a title=\"FC Barcelona C\" href=\"https://vi.wikipedia.org/wiki/FC_Barcelona_C\">Barcelona C</a></td>\n<td>10</td>\n<td>(5)</td>\n</tr>\n<tr>\n<th scope=\"row\">2004&ndash;2005</th>\n<td><a class=\"mw-redirect\" title=\"FC Barcelona B\" href=\"https://vi.wikipedia.org/wiki/FC_Barcelona_B\">Barcelona B</a></td>\n<td>22</td>\n<td>(6)</td>\n</tr>\n<tr>\n<th scope=\"row\">2004&ndash;2021</th>\n<td><a title=\"FC Barcelona\" href=\"https://vi.wikipedia.org/wiki/FC_Barcelona\">Barcelona</a></td>\n<td>778</td>\n<td>(672)</td>\n</tr>\n<tr>\n<th scope=\"row\">2021&ndash;2023</th>\n<td><a title=\"Paris Saint-Germain F.C.\" href=\"https://vi.wikipedia.org/wiki/Paris_Saint-Germain_F.C.\">Paris Saint-Germain</a></td>\n<td>75</td>\n<td>(32)</td>\n</tr>\n<tr>\n<th scope=\"row\">2023&ndash;</th>\n<td><a title=\"Inter Miami CF\" href=\"https://vi.wikipedia.org/wiki/Inter_Miami_CF\">Inter Miami</a></td>\n<td>11</td>\n<td>(6)</td>\n</tr>\n<tr>\n<th colspan=\"4\">Sự nghiệp đội tuyển quốc gia<sup>&Dagger;</sup></th>\n</tr>\n<tr>\n<th scope=\"row\">Năm</th>\n<td><strong>Đội</strong></td>\n<td><strong><abbr title=\"Số trận ra s&acirc;n ở đội tuyển quốc gia\">ST</abbr></strong></td>\n<td><strong>(<abbr title=\"Số b&agrave;n thắng ở đội tuyển quốc gia\">BT</abbr>)</strong></td>\n</tr>\n<tr>\n<th scope=\"row\">2004&ndash;2005</th>\n<td><a class=\"mw-redirect\" title=\"Đội tuyển b&oacute;ng đ&aacute; U-20 quốc gia Argentina\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tuy%E1%BB%83n_b%C3%B3ng_%C4%91%C3%A1_U-20_qu%E1%BB%91c_gia_Argentina\">U20 Argentina</a></td>\n<td>18</td>\n<td>(14)</td>\n</tr>\n<tr>\n<th scope=\"row\">2008</th>\n<td><a title=\"Đội tuyển b&oacute;ng đ&aacute; U-23 quốc gia Argentina\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tuy%E1%BB%83n_b%C3%B3ng_%C4%91%C3%A1_U-23_qu%E1%BB%91c_gia_Argentina\">U23 Argentina</a></td>\n<td>5<sup id=\"cite_ref-U23_2-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-U23-2\">[&alpha;]</a></sup></td>\n<td>(2)</td>\n</tr>\n<tr>\n<th scope=\"row\">2005&ndash;</th>\n<td><a title=\"Đội tuyển b&oacute;ng đ&aacute; quốc gia Argentina\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tuy%E1%BB%83n_b%C3%B3ng_%C4%91%C3%A1_qu%E1%BB%91c_gia_Argentina\">Argentina</a></td>\n<td>180</td>\n<td>(<a class=\"mw-redirect\" title=\"Danh s&aacute;ch những b&agrave;n thắng quốc tế được ghi bởi Lionel Messi\" href=\"https://vi.wikipedia.org/wiki/Danh_s%C3%A1ch_nh%E1%BB%AFng_b%C3%A0n_th%E1%BA%AFng_qu%E1%BB%91c_t%E1%BA%BF_%C4%91%C6%B0%E1%BB%A3c_ghi_b%E1%BB%9Fi_Lionel_Messi\">106</a>)</td>\n</tr>\n<tr>\n<th colspan=\"4\">\n<div class=\"mw-collapsible mw-collapsed mw-made-collapsible\"><button class=\"mw-collapsible-toggle mw-collapsible-toggle-default mw-collapsible-toggle-collapsed\" tabindex=\"0\" type=\"button\" aria-expanded=\"false\"><span class=\"mw-collapsible-text\">hiện</span></button>\n<div>\n<div>Th&agrave;nh t&iacute;ch huy chương</div>\n</div>\n</div>\n</th>\n</tr>\n<tr>\n<td colspan=\"4\">\n<table>\n<tbody>\n<tr>\n<td>\n<table class=\"infobox biography vcard\">\n<tbody>\n<tr>\n<th colspan=\"2\">\n<div class=\"fn\">Lionel Messi</div>\n</th>\n</tr>\n<tr>\n<td colspan=\"2\"><a class=\"mw-file-description\" title=\"Chữ k&yacute; của Lionel Messi\" href=\"https://vi.wikipedia.org/wiki/T%E1%BA%ADp_tin:Firma_de_Lionel_Messi.svg\"><img class=\"mw-file-element\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Firma_de_Lionel_Messi.svg/150px-Firma_de_Lionel_Messi.svg.png\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/6/63/Firma_de_Lionel_Messi.svg/225px-Firma_de_Lionel_Messi.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/63/Firma_de_Lionel_Messi.svg/300px-Firma_de_Lionel_Messi.svg.png 2x\" alt=\"Chữ k&yacute; của Lionel Messi\" width=\"150\" height=\"114\" data-file-width=\"281\" data-file-height=\"213\"></a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td colspan=\"4\">*Số trận ra s&acirc;n v&agrave; số b&agrave;n thắng ở c&acirc;u lạc bộ tại giải quốc gia, ch&iacute;nh x&aacute;c t&iacute;nh đến 09:13, 14 th&aacute;ng 4 năm 2024 (UTC)<br>&Dagger; Số trận ra s&acirc;n v&agrave; số b&agrave;n thắng ở đội tuyển quốc gia, ch&iacute;nh x&aacute;c t&iacute;nh đến 02:35, 22 th&aacute;ng 11 năm 2023 (UTC)</td>\n</tr>\n</tbody>\n</table>\n<table class=\"vertical-navbox nowraplinks vcard hlist\">\n<tbody>\n<tr>\n<th>\n<table>\n<tbody>\n<tr>\n<td><span class=\"mw-image-border\"><a class=\"mw-file-description\" href=\"https://vi.wikipedia.org/wiki/T%E1%BA%ADp_tin:Lionel_Messi_20180626.jpg\"><img class=\"mw-file-element\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Lionel_Messi_20180626.jpg/90px-Lionel_Messi_20180626.jpg\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Lionel_Messi_20180626.jpg/135px-Lionel_Messi_20180626.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Lionel_Messi_20180626.jpg/180px-Lionel_Messi_20180626.jpg 2x\" alt=\"Lionel Messi\" width=\"90\" height=\"128\" data-file-width=\"701\" data-file-height=\"1000\"></a></span></td>\n<td>B&agrave;i viết n&agrave;y l&agrave; một phần của loạt b&agrave;i về<br><span class=\"vcard\"><span class=\"fn\"><a class=\"mw-selflink selflink\">Lionel Messi</a></span></span></td>\n</tr>\n</tbody>\n</table>\n</th>\n</tr>\n<tr>\n<td>\n<p><strong><a title=\"Cầu thủ b&oacute;ng đ&aacute;\" href=\"https://vi.wikipedia.org/wiki/C%E1%BA%A7u_th%E1%BB%A7_b%C3%B3ng_%C4%91%C3%A1\">Cầu thủ b&oacute;ng đ&aacute; chuy&ecirc;n nghiệp</a>&nbsp;<a title=\"Người Argentina\" href=\"https://vi.wikipedia.org/wiki/Ng%C6%B0%E1%BB%9Di_Argentina\">người Argentina</a></strong></p>\n<ul>\n<li><a class=\"mw-redirect\" title=\"Danh s&aacute;ch những b&agrave;n thắng quốc tế được ghi bởi Lionel Messi\" href=\"https://vi.wikipedia.org/wiki/Danh_s%C3%A1ch_nh%E1%BB%AFng_b%C3%A0n_th%E1%BA%AFng_qu%E1%BB%91c_t%E1%BA%BF_%C4%91%C6%B0%E1%BB%A3c_ghi_b%E1%BB%9Fi_Lionel_Messi\">B&agrave;n thắng quốc tế</a></li>\n<li><a title=\"Danh s&aacute;ch th&agrave;nh t&iacute;ch trong sự nghiệp của Lionel Messi\" href=\"https://vi.wikipedia.org/wiki/Danh_s%C3%A1ch_th%C3%A0nh_t%C3%ADch_trong_s%E1%BB%B1_nghi%E1%BB%87p_c%E1%BB%A7a_Lionel_Messi\">Th&agrave;nh t&iacute;ch sự nghiệp</a></li>\n<li><a title=\"Cạnh tranh giữa Messi&ndash;Ronaldo\" href=\"https://vi.wikipedia.org/wiki/C%E1%BA%A1nh_tranh_gi%E1%BB%AFa_Messi%E2%80%93Ronaldo\">Cạnh tranh giữa Messi&ndash;Ronaldo</a></li>\n<li><a title=\"Maradona mới\" href=\"https://vi.wikipedia.org/wiki/Maradona_m%E1%BB%9Bi\">Maradona mới</a></li>\n</ul>\n<hr>\n<p><strong><a title=\"Eponym\" href=\"https://vi.wikipedia.org/wiki/Eponym\">Eponym</a>&nbsp;v&agrave;&nbsp;<a title=\"Nghệ thuật c&ocirc;ng cộng\" href=\"https://vi.wikipedia.org/wiki/Ngh%E1%BB%87_thu%E1%BA%ADt_c%C3%B4ng_c%E1%BB%99ng\">nghệ thuật c&ocirc;ng cộng</a></strong></p>\n<ul>\n<li><a class=\"new\" title=\"Messi (b&aacute;o sư tử) (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Messi_(b%C3%A1o_s%C6%B0_t%E1%BB%AD)&amp;action=edit&amp;redlink=1\">B&aacute;o sư tử</a></li>\n<li><a class=\"new\" title=\"Nh&agrave; nguyện Sistine của B&oacute;ng đ&aacute; (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Nh%C3%A0_nguy%E1%BB%87n_Sistine_c%E1%BB%A7a_B%C3%B3ng_%C4%91%C3%A1&amp;action=edit&amp;redlink=1\">Nh&agrave; nguyện Sistine của B&oacute;ng đ&aacute;</a></li>\n</ul>\n<hr>\n<p><strong><a class=\"mw-redirect mw-disambig\" title=\"Phim\" href=\"https://vi.wikipedia.org/wiki/Phim\">Phim ảnh</a></strong></p>\n<ul>\n<li><a title=\"Messi (phim 2014)\" href=\"https://vi.wikipedia.org/wiki/Messi_(phim_2014)\"><em>Messi</em>&nbsp;(2014)</a></li>\n<li><a class=\"new\" title=\"Messi (phim 2017) (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Messi_(phim_2017)&amp;action=edit&amp;redlink=1\"><em>Messi</em>&nbsp;(2017)</a></li>\n<li><a class=\"new\" title=\"Messi and Maud (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Messi_and_Maud&amp;action=edit&amp;redlink=1\"><em>Messi and Maud</em>&nbsp;(2017)</a></li>\n<li><a class=\"new\" title=\"Take the Ball Pass the Ball (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Take_the_Ball_Pass_the_Ball&amp;action=edit&amp;redlink=1\"><em>Take the Ball Pass the Ball</em>&nbsp;(2018)</a></li>\n</ul>\n<hr>\n<p><strong>Gia đ&igrave;nh</strong></p>\n<ul>\n<li><a class=\"new\" title=\"Maxi Biancucchi (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Maxi_Biancucchi&amp;action=edit&amp;redlink=1\">Maxi Biancucchi</a></li>\n<li><a class=\"new\" title=\"Emanuel Biancucchi (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Emanuel_Biancucchi&amp;action=edit&amp;redlink=1\">Emanuel Biancucchi</a></li>\n</ul>\n<div class=\"mw-collapsible mw-collapsed mw-made-collapsible\"><button class=\"mw-collapsible-toggle mw-collapsible-toggle-default mw-collapsible-toggle-collapsed\" tabindex=\"0\" type=\"button\" aria-expanded=\"false\"><span class=\"mw-collapsible-text\">hiện</span></button>\n<div>Những người li&ecirc;n quan</div>\n</div>\n</td>\n</tr>\n<tr>\n<td>\n<div class=\"plainlinks hlist navbar mini\">\n<ul>\n<li class=\"nv-xem\"><a title=\"Bản mẫu:Loạt b&agrave;i về Lionel Messi\" href=\"https://vi.wikipedia.org/wiki/B%E1%BA%A3n_m%E1%BA%ABu:Lo%E1%BA%A1t_b%C3%A0i_v%E1%BB%81_Lionel_Messi\"><abbr title=\"Xem bản mẫu n&agrave;y\">x</abbr></a></li>\n<li class=\"nv-thảo luận\"><a class=\"new\" title=\"Thảo luận Bản mẫu:Loạt b&agrave;i về Lionel Messi (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Th%E1%BA%A3o_lu%E1%BA%ADn_B%E1%BA%A3n_m%E1%BA%ABu:Lo%E1%BA%A1t_b%C3%A0i_v%E1%BB%81_Lionel_Messi&amp;action=edit&amp;redlink=1\"><abbr title=\"Thảo luận bản mẫu n&agrave;y\">t</abbr></a></li>\n<li class=\"nv-sửa\"><a class=\"external text\" href=\"https://vi.wikipedia.org/w/index.php?title=B%E1%BA%A3n_m%E1%BA%ABu:Lo%E1%BA%A1t_b%C3%A0i_v%E1%BB%81_Lionel_Messi&amp;action=edit\"><abbr title=\"Sửa bản mẫu n&agrave;y\">s</abbr></a></li>\n</ul>\n</div>\n</td>\n</tr>\n</tbody>\n</table>\n<p><strong>Lionel Andr&eacute;s</strong>&nbsp;\"<strong>Leo</strong>\"&nbsp;<strong>Messi</strong><sup id=\"cite_ref-7\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-7\">[ghi ch&uacute; 1]</a></sup>&nbsp;(<small>ph&aacute;t &acirc;m&nbsp;<a title=\"Tiếng T&acirc;y Ban Nha\" href=\"https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_T%C3%A2y_Ban_Nha\">tiếng T&acirc;y Ban Nha</a>:&nbsp;</small><span class=\"IPA\" title=\"Ph&aacute;t &acirc;m theo IPA\">[ljoˈnel anˈdɾes ˈmesi]</span><small>&nbsp;&nbsp;<span class=\"nowrap\">(<a title=\"Phương tiện:Lionel Andr&eacute;s Messi - Name.ogg\" href=\"https://vi.wikipedia.org/wiki/Ph%C6%B0%C6%A1ng_ti%E1%BB%87n:Lionel_Andr%C3%A9s_Messi_-_Name.ogg\"><img class=\"mw-file-element\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Speaker_Icon.svg/13px-Speaker_Icon.svg.png\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/2/21/Speaker_Icon.svg/20px-Speaker_Icon.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/2/21/Speaker_Icon.svg/26px-Speaker_Icon.svg.png 2x\" width=\"13\" height=\"13\" data-file-width=\"500\" data-file-height=\"500\"></a>&nbsp;<a class=\"internal\" title=\"Lionel Andr&eacute;s Messi - Name.ogg\" href=\"https://upload.wikimedia.org/wikipedia/commons/0/09/Lionel_Andr%C3%A9s_Messi_-_Name.ogg\">nghe</a>)</span></small>; sinh ng&agrave;y 24 th&aacute;ng 6 năm 1987) l&agrave; một&nbsp;<a title=\"Cầu thủ b&oacute;ng đ&aacute;\" href=\"https://vi.wikipedia.org/wiki/C%E1%BA%A7u_th%E1%BB%A7_b%C3%B3ng_%C4%91%C3%A1\">cầu thủ b&oacute;ng đ&aacute;</a>&nbsp;chuy&ecirc;n nghiệp người Argentina hiện đang thi đấu ở vị tr&iacute;&nbsp;<a class=\"mw-redirect\" title=\"Tiền đạo\" href=\"https://vi.wikipedia.org/wiki/Ti%E1%BB%81n_%C4%91%E1%BA%A1o\">tiền đạo</a>&nbsp;v&agrave; l&agrave;&nbsp;<a title=\"Đội trưởng (b&oacute;ng đ&aacute;)\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tr%C6%B0%E1%BB%9Fng_(b%C3%B3ng_%C4%91%C3%A1)\">đội trưởng</a>&nbsp;của cả c&acirc;u lạc bộ&nbsp;<a title=\"Major League Soccer\" href=\"https://vi.wikipedia.org/wiki/Major_League_Soccer\">Major League Soccer</a>&nbsp;<a title=\"Inter Miami CF\" href=\"https://vi.wikipedia.org/wiki/Inter_Miami_CF\">Inter Miami</a>&nbsp;v&agrave;&nbsp;<a title=\"Đội tuyển b&oacute;ng đ&aacute; quốc gia Argentina\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tuy%E1%BB%83n_b%C3%B3ng_%C4%91%C3%A1_qu%E1%BB%91c_gia_Argentina\">đội tuyển b&oacute;ng đ&aacute; quốc gia Argentina</a>. Được xem l&agrave; một trong những cầu thủ vĩ đại nhất mọi thời đại, Messi giữ kỷ lục 8 lần gi&agrave;nh&nbsp;<a title=\"Quả b&oacute;ng v&agrave;ng ch&acirc;u &Acirc;u\" href=\"https://vi.wikipedia.org/wiki/Qu%E1%BA%A3_b%C3%B3ng_v%C3%A0ng_ch%C3%A2u_%C3%82u\">Quả b&oacute;ng v&agrave;ng</a>,<sup id=\"cite_ref-10\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-10\">[ghi ch&uacute; 2]</a></sup>&nbsp;6 lần gi&agrave;nh&nbsp;<a title=\"Chiếc gi&agrave;y v&agrave;ng ch&acirc;u &Acirc;u\" href=\"https://vi.wikipedia.org/wiki/Chi%E1%BA%BFc_gi%C3%A0y_v%C3%A0ng_ch%C3%A2u_%C3%82u\">Chiếc gi&agrave;y v&agrave;ng ch&acirc;u &Acirc;u</a>&nbsp;v&agrave; được xếp v&agrave;o&nbsp;<a class=\"extiw\" title=\"en:Ballon d\'Or Dream Team\" href=\"https://en.wikipedia.org/wiki/Ballon_d%27Or_Dream_Team#First_Team\">Ballon d\'Or Dream Team</a>&nbsp;v&agrave;o năm 2020. Trước khi rời c&acirc;u lạc bộ v&agrave;o năm 2021, anh đ&atilde; cống hiến to&agrave;n bộ sự nghiệp chuy&ecirc;n nghiệp của m&igrave;nh cho&nbsp;<a title=\"FC Barcelona\" href=\"https://vi.wikipedia.org/wiki/FC_Barcelona\">Barcelona</a>, tại đ&acirc;y anh đ&atilde; gi&agrave;nh được kỷ lục 34&nbsp;<a class=\"mw-redirect\" title=\"Th&agrave;nh t&iacute;ch v&agrave; kỷ lục của c&acirc;u lạc bộ Barcelona\" href=\"https://vi.wikipedia.org/wiki/Th%C3%A0nh_t%C3%ADch_v%C3%A0_k%E1%BB%B7_l%E1%BB%A5c_c%E1%BB%A7a_c%C3%A2u_l%E1%BA%A1c_b%E1%BB%99_Barcelona\">danh hiệu cấp c&acirc;u lạc bộ</a>, bao gồm 10&nbsp;<a title=\"La Liga\" href=\"https://vi.wikipedia.org/wiki/La_Liga\">La Liga</a>, 7&nbsp;<a class=\"mw-redirect\" title=\"Copa del Rey\" href=\"https://vi.wikipedia.org/wiki/Copa_del_Rey\">Copa del Rey</a>&nbsp;v&agrave; 4&nbsp;<a title=\"UEFA Champions League\" href=\"https://vi.wikipedia.org/wiki/UEFA_Champions_League\">UEFA Champions League</a>.<sup id=\"cite_ref-ucls_13-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-ucls-13\">[ghi ch&uacute; 3]</a></sup>&nbsp;Với đất nước của m&igrave;nh, anh đ&atilde; gi&agrave;nh được danh hiệu&nbsp;<a class=\"mw-redirect\" title=\"Copa Am&eacute;rica 2021\" href=\"https://vi.wikipedia.org/wiki/Copa_Am%C3%A9rica_2021\">Copa Am&eacute;rica 2021</a>&nbsp;v&agrave;&nbsp;<a class=\"mw-redirect\" title=\"FIFA World Cup 2022\" href=\"https://vi.wikipedia.org/wiki/FIFA_World_Cup_2022\">FIFA World Cup 2022</a>. L&agrave; một tay săn b&agrave;n cừ kh&ocirc;i v&agrave; đồng thời c&ograve;n l&agrave; một cầu thủ kiến tạo xuất sắc, Messi đang nắm giữ kỷ lục ghi nhiều b&agrave;n thắng nhất ở La Liga (474), nhiều hat-trick nhất ở La Liga (36) v&agrave; UEFA Champions League (8), nhiều pha kiến tạo nhất ở La Liga (192) v&agrave;&nbsp;<a class=\"mw-redirect\" title=\"Copa Am&eacute;rica\" href=\"https://vi.wikipedia.org/wiki/Copa_Am%C3%A9rica\">Copa Am&eacute;rica</a>&nbsp;(17), v&agrave; đồng thời c&ograve;n nắm giữ kỷ lục nam cầu thủ ghi nhiều b&agrave;n thắng quốc tế nhất khu vực Nam Mỹ (106). Anh đ&atilde; ghi được hơn 800 b&agrave;n thắng trong sự nghiệp ở cả cấp c&acirc;u lạc bộ v&agrave; đội tuyển quốc gia, đồng thời l&agrave; cầu thủ ghi nhiều b&agrave;n thắng nhất từ trước đến nay cho một c&acirc;u lạc bộ (672).</p>\n<p>Sinh ra ở&nbsp;<a title=\"Rosario\" href=\"https://vi.wikipedia.org/wiki/Rosario\">Rosario</a>, Messi đ&atilde; chuyển đến&nbsp;<a title=\"T&acirc;y Ban Nha\" href=\"https://vi.wikipedia.org/wiki/T%C3%A2y_Ban_Nha\">T&acirc;y Ban Nha</a>&nbsp;từ Argentina khi mới 13 tuổi để gia nhập Barcelona, nơi anh c&oacute; trận ra mắt ch&iacute;nh thức cho đội b&oacute;ng xứ Catalan ở tuổi 17 v&agrave;o th&aacute;ng 10 năm 2004. Kể từ đ&oacute;, anh dần l&agrave; cầu thủ chủ chốt của c&acirc;u lạc bộ trong ba năm tiếp theo. Trong&nbsp;<a class=\"new\" title=\"FC Barcelona m&ugrave;a giải 2008-09 (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=FC_Barcelona_m%C3%B9a_gi%E1%BA%A3i_2008-09&amp;action=edit&amp;redlink=1\">m&ugrave;a giải đầu ti&ecirc;n</a>&nbsp;kh&ocirc;ng bị gi&aacute;n đoạn bởi chấn thương, anh đ&atilde; gi&uacute;p Barcelona đạt được&nbsp;<a title=\"C&uacute; ăn ba (b&oacute;ng đ&aacute;)\" href=\"https://vi.wikipedia.org/wiki/C%C3%BA_%C4%83n_ba_(b%C3%B3ng_%C4%91%C3%A1)\">c&uacute; ăn ba</a>&nbsp;đầu ti&ecirc;n của lịch sử b&oacute;ng đ&aacute; T&acirc;y Ban Nha; v&agrave;o năm đ&oacute;, ở tuổi 22, Messi đ&atilde; gi&agrave;nh được&nbsp;<a title=\"Quả b&oacute;ng v&agrave;ng ch&acirc;u &Acirc;u\" href=\"https://vi.wikipedia.org/wiki/Qu%E1%BA%A3_b%C3%B3ng_v%C3%A0ng_ch%C3%A2u_%C3%82u\">Quả b&oacute;ng v&agrave;ng</a>&nbsp;lần đầu ti&ecirc;n. Ba m&ugrave;a giải th&agrave;nh c&ocirc;ng sau đ&oacute;, với việc Messi gi&agrave;nh được bốn Quả b&oacute;ng v&agrave;ng li&ecirc;n tiếp, anh trở th&agrave;nh cầu thủ đầu ti&ecirc;n gi&agrave;nh được giải thưởng n&agrave;y bốn lần li&ecirc;n tiếp. Trong&nbsp;<a class=\"new\" title=\"FC Barcelona m&ugrave;a giải 2011-12 (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=FC_Barcelona_m%C3%B9a_gi%E1%BA%A3i_2011-12&amp;action=edit&amp;redlink=1\">m&ugrave;a giải 2011&ndash;12</a>, anh lập kỷ lục tại La Liga v&agrave; ch&acirc;u &Acirc;u về số b&agrave;n thắng ghi được nhiều nhất trong một m&ugrave;a giải, đồng thời khẳng định m&igrave;nh l&agrave; cầu thủ ghi b&agrave;n nhiều nhất mọi thời đại của Barcelona. Hai m&ugrave;a giải tiếp theo, Messi về nh&igrave; tại Quả b&oacute;ng v&agrave;ng sau&nbsp;<a title=\"Cristiano Ronaldo\" href=\"https://vi.wikipedia.org/wiki/Cristiano_Ronaldo\">Cristiano Ronaldo</a>&nbsp;(<a class=\"mw-redirect\" title=\"Cạnh tranh giữa Messi-Ronaldo\" href=\"https://vi.wikipedia.org/wiki/C%E1%BA%A1nh_tranh_gi%E1%BB%AFa_Messi-Ronaldo\">đối thủ lớn nhất trong sự nghiệp</a>&nbsp;của anh), trước khi lấy lại phong độ tốt nhất của m&igrave;nh trong m&ugrave;a giải 2014&ndash;15, trở th&agrave;nh cầu thủ ghi b&agrave;n nhiều nhất mọi thời đại ở La Liga v&agrave; c&ugrave;ng Barcelona gi&agrave;nh c&uacute; ăn ba lịch sử lần thứ hai, sau đ&oacute; anh gi&agrave;nh Quả b&oacute;ng v&agrave;ng thứ năm v&agrave;o năm 2015. Messi đảm nhận tấm băng đội trưởng của Barcelona v&agrave;o năm 2018 v&agrave; v&agrave;o năm 2019, anh đ&atilde; gi&agrave;nh được&nbsp;<a title=\"Quả b&oacute;ng v&agrave;ng ch&acirc;u &Acirc;u 2019\" href=\"https://vi.wikipedia.org/wiki/Qu%E1%BA%A3_b%C3%B3ng_v%C3%A0ng_ch%C3%A2u_%C3%82u_2019\">Quả b&oacute;ng v&agrave;ng thứ s&aacute;u</a>. Sau khi hết hạn hợp đồng với Barcelona, anh k&yacute; hợp đồng với c&acirc;u lạc bộ Ph&aacute;p&nbsp;<a title=\"Paris Saint-Germain F.C.\" href=\"https://vi.wikipedia.org/wiki/Paris_Saint-Germain_F.C.\">Paris Saint-Germain</a>&nbsp;v&agrave;o th&aacute;ng 8 năm 2021 v&agrave; đ&atilde; cống hiến hai m&ugrave;a giải tại đ&acirc;y, gi&agrave;nh hai chức v&ocirc; địch&nbsp;<a title=\"Ligue 1\" href=\"https://vi.wikipedia.org/wiki/Ligue_1\">Ligue 1</a>. Messi gia nhập c&acirc;u lạc bộ Mỹ Inter Miami v&agrave;o th&aacute;ng 7 năm 2023, gi&agrave;nh chức v&ocirc; địch&nbsp;<a class=\"new\" title=\"Leagues Cup 2023 (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Leagues_Cup_2023&amp;action=edit&amp;redlink=1\">Leagues Cup 2023</a>&nbsp;v&agrave;o th&aacute;ng 8 c&ugrave;ng năm.</p>\n<p>Trong m&agrave;u &aacute;o đội tuyển Argentina, Messi l&agrave;&nbsp;<a title=\"Đội tuyển b&oacute;ng đ&aacute; quốc gia Argentina\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tuy%E1%BB%83n_b%C3%B3ng_%C4%91%C3%A1_qu%E1%BB%91c_gia_Argentina#C%C3%A1c_c%E1%BA%A7u_th%E1%BB%A7_ra_s%C3%A2n_nhi%E1%BB%81u_nh%E1%BA%A5t\">cầu thủ ra s&acirc;n nhiều nhất</a>&nbsp;v&agrave; cũng l&agrave;&nbsp;<a title=\"Đội tuyển b&oacute;ng đ&aacute; quốc gia Argentina\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tuy%E1%BB%83n_b%C3%B3ng_%C4%91%C3%A1_qu%E1%BB%91c_gia_Argentina#C%C3%A1c_c%E1%BA%A7u_th%E1%BB%A7_ghi_nhi%E1%BB%81u_b%C3%A0n_th%E1%BA%AFng_nh%E1%BA%A5t\">cầu thủ ghi nhiều b&agrave;n thắng nhất mọi thời đại</a>&nbsp;của đất nước qu&ecirc; hương anh. Ở cấp độ trẻ, anh đ&atilde; gi&agrave;nh chức v&ocirc; địch giải b&oacute;ng đ&aacute; trẻ thế giới năm 2005, kết th&uacute;c giải đấu với&nbsp;<a class=\"mw-redirect\" title=\"Giải v&ocirc; địch b&oacute;ng đ&aacute; U-20 thế giới\" href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_U-20_th%E1%BA%BF_gi%E1%BB%9Bi#Gi%E1%BA%A3i_th%C6%B0%E1%BB%9Fng\">Quả b&oacute;ng v&agrave;ng v&agrave; Chiếc gi&agrave;y v&agrave;ng</a>, gi&agrave;nh tấm huy chương v&agrave;ng tại&nbsp;<a title=\"B&oacute;ng đ&aacute; tại Thế vận hội M&ugrave;a h&egrave; 2008\" href=\"https://vi.wikipedia.org/wiki/B%C3%B3ng_%C4%91%C3%A1_t%E1%BA%A1i_Th%E1%BA%BF_v%E1%BA%ADn_h%E1%BB%99i_M%C3%B9a_h%C3%A8_2008\">Thế vận hội M&ugrave;a h&egrave; 2008</a>. Phong c&aacute;ch&nbsp;<a title=\"R&ecirc; b&oacute;ng\" href=\"https://vi.wikipedia.org/wiki/R%C3%AA_b%C3%B3ng\">r&ecirc; b&oacute;ng</a>&nbsp;bằng ch&acirc;n tr&aacute;i của anh được so s&aacute;nh với&nbsp;<a title=\"Diego Maradona\" href=\"https://vi.wikipedia.org/wiki/Diego_Maradona\">Diego Maradona</a>, người đ&atilde; m&ocirc; tả Messi l&agrave;&nbsp;<a title=\"Maradona mới\" href=\"https://vi.wikipedia.org/wiki/Maradona_m%E1%BB%9Bi\">truyền nh&acirc;n</a>&nbsp;của &ocirc;ng. Sau trận ra mắt đội tuyển v&agrave;o th&aacute;ng 8 năm 2005, Messi trở th&agrave;nh cầu thủ Argentina trẻ nhất thi đấu v&agrave; ghi b&agrave;n tại&nbsp;<a class=\"mw-redirect\" title=\"FIFA World Cup\" href=\"https://vi.wikipedia.org/wiki/FIFA_World_Cup\">FIFA World Cup</a>&nbsp;v&agrave;o năm&nbsp;<a title=\"Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 2006\" href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2006\">2006</a>&nbsp;v&agrave; lọt v&agrave;o trận chung kết&nbsp;<a class=\"mw-redirect\" title=\"Copa Am&eacute;rica 2007\" href=\"https://vi.wikipedia.org/wiki/Copa_Am%C3%A9rica_2007\">Copa Am&eacute;rica 2007</a>, nơi anh được vinh danh l&agrave; cầu thủ trẻ xuất sắc nhất. Với tư c&aacute;ch l&agrave; đội trưởng của đội tuyển từ th&aacute;ng 8 năm 2011, anh đ&atilde; dẫn dắt Argentina đến ba trận chung kết li&ecirc;n tiếp:&nbsp;<a class=\"mw-redirect\" title=\"FIFA World Cup 2014\" href=\"https://vi.wikipedia.org/wiki/FIFA_World_Cup_2014\">FIFA World Cup 2014</a>, nơi anh gi&agrave;nh&nbsp;<a title=\"Quả b&oacute;ng v&agrave;ng FIFA 2014\" href=\"https://vi.wikipedia.org/wiki/Qu%E1%BA%A3_b%C3%B3ng_v%C3%A0ng_FIFA_2014\">Quả b&oacute;ng v&agrave;ng</a>,&nbsp;<a class=\"mw-redirect\" title=\"Copa Am&eacute;rica 2015\" href=\"https://vi.wikipedia.org/wiki/Copa_Am%C3%A9rica_2015\">Copa Am&eacute;rica 2015</a>&nbsp;v&agrave;&nbsp;<a class=\"mw-redirect\" title=\"Copa Am&eacute;rica Centenario\" href=\"https://vi.wikipedia.org/wiki/Copa_Am%C3%A9rica_Centenario\">2016</a>. Sau khi tuy&ecirc;n bố gi&atilde; từ sự nghiệp thi đấu quốc tế v&agrave;o năm 2016, anh đ&atilde; thay đổi quyết định v&agrave; đưa đất nước của m&igrave;nh gi&agrave;nh quyền tham dự&nbsp;<a class=\"mw-redirect\" title=\"FIFA World Cup 2018\" href=\"https://vi.wikipedia.org/wiki/FIFA_World_Cup_2018\">FIFA World Cup 2018</a>, về đ&iacute;ch ở vị tr&iacute; thứ ba tại&nbsp;<a title=\"C&uacute;p b&oacute;ng đ&aacute; Nam Mỹ 2019\" href=\"https://vi.wikipedia.org/wiki/C%C3%BAp_b%C3%B3ng_%C4%91%C3%A1_Nam_M%E1%BB%B9_2019\">Copa Am&eacute;rica 2019</a>&nbsp;v&agrave; gi&agrave;nh chức v&ocirc; địch&nbsp;<a class=\"mw-redirect\" title=\"Copa Am&eacute;rica 2021\" href=\"https://vi.wikipedia.org/wiki/Copa_Am%C3%A9rica_2021\">Copa Am&eacute;rica 2021</a>, giải đấu m&agrave; anh gi&agrave;nh giải&nbsp;<a class=\"mw-redirect\" title=\"Copa Am&eacute;rica 2021\" href=\"https://vi.wikipedia.org/wiki/Copa_Am%C3%A9rica_2021#Gi%E1%BA%A3i_th%C6%B0%E1%BB%9Fng\">Quả b&oacute;ng v&agrave;ng</a>&nbsp;v&agrave;&nbsp;<a class=\"mw-redirect\" title=\"Copa Am&eacute;rica 2021\" href=\"https://vi.wikipedia.org/wiki/Copa_Am%C3%A9rica_2021#Gi%E1%BA%A3i_th%C6%B0%E1%BB%9Fng\">Chiếc gi&agrave;y v&agrave;ng</a>. Th&agrave;nh t&iacute;ch n&agrave;y gi&uacute;p anh nhận được&nbsp;<a title=\"Quả b&oacute;ng v&agrave;ng ch&acirc;u &Acirc;u 2021\" href=\"https://vi.wikipedia.org/wiki/Qu%E1%BA%A3_b%C3%B3ng_v%C3%A0ng_ch%C3%A2u_%C3%82u_2021\">Quả b&oacute;ng v&agrave;ng thứ bảy</a>&nbsp;kỷ lục v&agrave;o năm 2021. Năm 2022, Messi đ&atilde; dẫn dắt đội tuyển Argentina l&ecirc;n ng&ocirc;i v&ocirc; địch&nbsp;<a class=\"mw-redirect\" title=\"FIFA World Cup 2022\" href=\"https://vi.wikipedia.org/wiki/FIFA_World_Cup_2022\">FIFA World Cup 2022</a>, giải đấu m&agrave; anh gi&agrave;nh được Quả b&oacute;ng v&agrave;ng lần thứ hai kỷ lục, trở th&agrave;nh cầu thủ đầu ti&ecirc;n ghi b&agrave;n ở tất cả c&aacute;c giai đoạn của World Cup (bao gồm cả hai b&agrave;n trong&nbsp;<a title=\"Trận chung kết Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 2022\" href=\"https://vi.wikipedia.org/wiki/Tr%E1%BA%ADn_chung_k%E1%BA%BFt_Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022\">trận chung kết</a>), cũng như ph&aacute; kỷ lục về&nbsp;<a class=\"new\" title=\"Danh s&aacute;ch cầu thủ g&oacute;p mặt ở nhiều kỳ FIFA World Cup nhất (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Danh_s%C3%A1ch_c%E1%BA%A7u_th%E1%BB%A7_g%C3%B3p_m%E1%BA%B7t_%E1%BB%9F_nhi%E1%BB%81u_k%E1%BB%B3_FIFA_World_Cup_nh%E1%BA%A5t&amp;action=edit&amp;redlink=1\">số lần ra s&acirc;n nhiều nhất tại c&aacute;c v&ograve;ng chung kết World Cup</a>&nbsp;với 26 trận đ&atilde; đấu.</p>\n<p>Messi đ&atilde; được t&agrave;i trợ bởi h&atilde;ng đồ thể thao&nbsp;<a title=\"Adidas\" href=\"https://vi.wikipedia.org/wiki/Adidas\">Adidas</a>&nbsp;từ năm 2006 v&agrave; dần trở th&agrave;nh người quảng b&aacute; thương hiệu h&agrave;ng đầu của họ. Theo&nbsp;<em><a title=\"France Football\" href=\"https://vi.wikipedia.org/wiki/France_Football\">France Football</a></em>, anh l&agrave; cầu thủ b&oacute;ng đ&aacute; được trả lương cao nhất thế giới trong 5 năm từ năm 2009 đến năm 2014, v&agrave; được&nbsp;<em><a title=\"Forbes\" href=\"https://vi.wikipedia.org/wiki/Forbes\">Forbes</a></em>&nbsp;xếp hạng l&agrave; vận động vi&ecirc;n được trả lương cao nhất thế giới v&agrave;o năm 2019. Messi nằm trong&nbsp;<a title=\"Time 100\" href=\"https://vi.wikipedia.org/wiki/Time_100\">danh s&aacute;ch 100 người c&oacute; ảnh hưởng nhất tr&ecirc;n thế giới của&nbsp;<em>Time</em></a>&nbsp;trong năm 2011, 2012 v&agrave; 2023. Anh được trao&nbsp;<a title=\"Giải thưởng Thể thao Thế giới Laureus cho Vận động vi&ecirc;n nam của năm\" href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_th%C6%B0%E1%BB%9Fng_Th%E1%BB%83_thao_Th%E1%BA%BF_gi%E1%BB%9Bi_Laureus_cho_V%E1%BA%ADn_%C4%91%E1%BB%99ng_vi%C3%AAn_nam_c%E1%BB%A7a_n%C4%83m\">giải thưởng Thể thao Thế giới Laureus cho Vận động vi&ecirc;n nam của năm</a>&nbsp;v&agrave;o c&aacute;c năm 2020 v&agrave; 2023, trở th&agrave;nh cầu thủ b&oacute;ng đ&aacute; đầu ti&ecirc;n v&agrave; cũng l&agrave; vận động vi&ecirc;n m&ocirc;n thể thao đồng đội đầu ti&ecirc;n gi&agrave;nh được giải thưởng n&agrave;y. Cuối năm 2020, Messi trở th&agrave;nh cầu thủ b&oacute;ng đ&aacute; thứ hai (v&agrave; vận động vi&ecirc;n m&ocirc;n thể thao đồng đội thứ hai) vượt qua cột mốc 1 tỷ USD thu nhập trong suốt sự nghiệp.<sup id=\"cite_ref-Career_billion_14-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-Career_billion-14\">[10]</a></sup></p>\n<h2><span id=\"Thi.E1.BA.BFu_th.E1.BB.9Di\"></span><span id=\"Thiếu_thời\" class=\"mw-headline\">Thiếu thời</span></h2>\n<p>Messi sinh ng&agrave;y 24 th&aacute;ng 6 năm 1987 tại&nbsp;<a title=\"Rosario\" href=\"https://vi.wikipedia.org/wiki/Rosario\">Rosario</a>,&nbsp;<a title=\"Santa Fe (tỉnh)\" href=\"https://vi.wikipedia.org/wiki/Santa_Fe_(t%E1%BB%89nh)\">Santa Fe</a>,<sup id=\"cite_ref-15\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-15\">[11]</a></sup>&nbsp;l&agrave; con thứ ba trong số 4 người con của Jorge Messi, một quản l&yacute; nh&agrave; m&aacute;y th&eacute;p v&agrave; vợ &ocirc;ng l&agrave; Celia Cuccittini, c&ocirc;ng nh&acirc;n l&agrave;m việc trong xưởng sản xuất nam ch&acirc;m. B&ecirc;n nội của Messi l&agrave; người&nbsp;<a title=\"Người Argentina gốc &Yacute;\" href=\"https://vi.wikipedia.org/wiki/Ng%C6%B0%E1%BB%9Di_Argentina_g%E1%BB%91c_%C3%9D\">gốc &Yacute;</a>&nbsp;v&agrave;&nbsp;<a class=\"new\" title=\"Người Argentina gốc T&acirc;y Ban Nha (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Ng%C6%B0%E1%BB%9Di_Argentina_g%E1%BB%91c_T%C3%A2y_Ban_Nha&amp;action=edit&amp;redlink=1\">T&acirc;y Ban Nha</a>, l&agrave; chắt của những người nhập cư từ v&ugrave;ng&nbsp;<a title=\"Marche\" href=\"https://vi.wikipedia.org/wiki/Marche\">Marche</a>&nbsp;nằm ở trung t&acirc;m ph&iacute;a bắc&nbsp;<a title=\"Biển Adriatic\" href=\"https://vi.wikipedia.org/wiki/Bi%E1%BB%83n_Adriatic\">biển Adriatic</a>&nbsp;của &Yacute;, c&ograve;n b&ecirc;n ngoại của anh c&oacute; tổ ti&ecirc;n chủ yếu l&agrave; người &Yacute;.<sup id=\"cite_ref-FOOTNOTEBalagu&eacute;201332&ndash;37_4-1\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-FOOTNOTEBalagu%C3%A9201332%E2%80%9337-4\">[3]</a></sup><sup id=\"cite_ref-:3_16-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-:3-16\">[12]</a></sup>&nbsp;\"Leo\" lớn l&ecirc;n trong một gia đ&igrave;nh đầm ấm v&agrave; m&ecirc; b&oacute;ng đ&aacute;, n&ecirc;n từ nhỏ anh đ&atilde; say m&ecirc; m&ocirc;n thể thao n&agrave;y; thường xuy&ecirc;n chơi b&oacute;ng với hai người anh ruột l&agrave; Rodrigo v&agrave; Mat&iacute;as cũng như những người anh em họ l&agrave;&nbsp;<a class=\"new\" title=\"Maxi Biancucchi (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Maxi_Biancucchi&amp;action=edit&amp;redlink=1\">Maximiliano</a>&nbsp;v&agrave;&nbsp;<a class=\"new\" title=\"Emanuel Biancucchi (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Emanuel_Biancucchi&amp;action=edit&amp;redlink=1\">Emanuel Biancucchi</a>, cả hai sau n&agrave;y đều trở th&agrave;nh cầu thủ b&oacute;ng đ&aacute; chuy&ecirc;n nghiệp.<sup id=\"cite_ref-FOOTNOTECaioli20129&ndash;10_17-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-FOOTNOTECaioli20129%E2%80%9310-17\">[13]</a></sup>&nbsp;L&uacute;c 4 tuổi, anh gia nhập c&acirc;u lạc bộ địa phương Grandoli, tại đ&acirc;y anh được huấn luyện bởi cha m&igrave;nh, nhưng người c&oacute; ảnh hưởng đầu ti&ecirc;n đến tư c&aacute;ch một cầu thủ của Messi lại l&agrave; b&agrave; ngoại của anh, Celia, người đ&atilde; c&ugrave;ng anh tập luyện v&agrave; thi đấu.<sup id=\"cite_ref-MagicFeet_18-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-MagicFeet-18\">[14]</a></sup>&nbsp;Anh bị ảnh hưởng rất nhiều bởi c&aacute;i chết của b&agrave;, ngay trước sinh nhật tuổi 11; kể từ đ&oacute;, l&agrave; một t&iacute;n hữu&nbsp;<a title=\"Gi&aacute;o hội C&ocirc;ng gi&aacute;o\" href=\"https://vi.wikipedia.org/wiki/Gi%C3%A1o_h%E1%BB%99i_C%C3%B4ng_gi%C3%A1o\">C&ocirc;ng gi&aacute;o</a>, anh thường ăn mừng b&agrave;n thắng của m&igrave;nh bằng việc nh&igrave;n v&agrave; chỉ tay l&ecirc;n trời nhằm tưởng nhớ b&agrave;.<sup id=\"cite_ref-FOOTNOTEBalagu&eacute;201344&ndash;45_19-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-FOOTNOTEBalagu%C3%A9201344%E2%80%9345-19\">[15]</a></sup><sup id=\"cite_ref-20\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-20\">[16]</a></sup></p>\n<div class=\"quotebox pullquote floatleft\">\n<div class=\"quotebox-quote left-aligned\">\"Khi nh&igrave;n thấy Messi, bạn sẽ nghĩ: đứa trẻ n&agrave;y kh&ocirc;ng thể chơi b&oacute;ng. Cậu ấy l&ugrave;n tịt, qu&aacute; mảnh khảnh, qu&aacute; nhỏ b&eacute;. Nhưng ngay lập tức, bạn nhận ra rằng cậu ấy sinh ra đ&atilde; kh&aacute;c biệt, cậu ấy l&agrave; một hiện tượng v&agrave; sẽ trở th&agrave;nh một điều ấn tượng.\"</div>\n<p><cite class=\"left-aligned\">&ndash;Huấn luyện vi&ecirc;n đội trẻ của&nbsp;<a title=\"Newell\'s Old Boys\" href=\"https://vi.wikipedia.org/wiki/Newell%27s_Old_Boys\">Newell\'s Old Boys</a>,&nbsp;<a class=\"new\" title=\"Adri&aacute;n Coria (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Adri%C3%A1n_Coria&amp;action=edit&amp;redlink=1\">Adri&aacute;n Coria</a>&nbsp;chia sẻ ấn tượng đầu ti&ecirc;n của &ocirc;ng về cậu b&eacute; 12 tuổi Messi.<sup id=\"cite_ref-FOOTNOTECaioli201238_21-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-FOOTNOTECaioli201238-21\">[17]</a></sup></cite></p>\n</div>\n<p>L&agrave; một người h&acirc;m mộ trung th&agrave;nh của&nbsp;<a title=\"Newell\'s Old Boys\" href=\"https://vi.wikipedia.org/wiki/Newell%27s_Old_Boys\">Newell\'s Old Boys</a>, Messi đ&atilde; gia nhập c&acirc;u lạc bộ Rosario khi mới 6 tuổi. Trong s&aacute;u năm chơi cho Newell\'s, anh ghi gần 500 b&agrave;n thắng với tư c&aacute;ch l&agrave; th&agrave;nh vi&ecirc;n của \"The Machine of \'87\" (<span lang=\"vi\" title=\"Văn bản tiếng Việt\">Những cỗ m&aacute;y ghi b&agrave;n sinh năm 1987</span>), được đặt theo năm sinh của c&aacute;c cầu thủ.<sup id=\"cite_ref-Here_and_Gone_22-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-Here_and_Gone-22\">[18]</a></sup><sup id=\"cite_ref-FOOTNOTECaioli201231&ndash;35_23-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-FOOTNOTECaioli201231%E2%80%9335-23\">[19]</a></sup>&nbsp;Tuy nhi&ecirc;n, tương lai trở th&agrave;nh cầu thủ chuy&ecirc;n nghiệp của Messi bị đe dọa khi l&ecirc;n 10 tuổi, anh được chẩn đo&aacute;n mắc chứng&nbsp;<a title=\"Thiếu hormone tăng trưởng\" href=\"https://vi.wikipedia.org/wiki/Thi%E1%BA%BFu_hormone_t%C4%83ng_tr%C6%B0%E1%BB%9Fng\">thiếu hormone tăng trưởng</a>. V&igrave;&nbsp;<a title=\"Bảo hiểm y tế\" href=\"https://vi.wikipedia.org/wiki/B%E1%BA%A3o_hi%E1%BB%83m_y_t%E1%BA%BF\">bảo hiểm y tế</a>&nbsp;của cha anh chỉ chi trả được trong hai năm điều trị, ti&ecirc;u tốn &iacute;t nhất 1.000&nbsp;<a title=\"Peso Argentina\" href=\"https://vi.wikipedia.org/wiki/Peso_Argentina\">peso</a>&nbsp;mỗi th&aacute;ng, n&ecirc;n Newell\'s đ&atilde; đồng &yacute; hỗ trợ, nhưng sau đ&oacute; họ lại kh&ocirc;ng thực hiện lời hứa.<sup id=\"cite_ref-The_Legend_of_El_Enano_24-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-The_Legend_of_El_Enano-24\">[20]</a></sup>&nbsp;Anh được c&acirc;u lạc bộ ở Buenos Aires&nbsp;<a class=\"mw-redirect\" title=\"Club Atl&eacute;tico River Plate\" href=\"https://vi.wikipedia.org/wiki/Club_Atl%C3%A9tico_River_Plate\">River Plate</a>, nơi cầu thủ kiến thiết thần tượng của anh&nbsp;<a title=\"Pablo Aimar\" href=\"https://vi.wikipedia.org/wiki/Pablo_Aimar\">Pablo Aimar</a>&nbsp;đang thi đấu, chi&ecirc;u mộ, nhưng họ cũng kh&ocirc;ng thể chi trả ph&iacute; điều trị cho anh do&nbsp;<a class=\"new\" title=\"Đại suy tho&aacute;i tại Argentina 1998&ndash;2002 (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=%C4%90%E1%BA%A1i_suy_tho%C3%A1i_t%E1%BA%A1i_Argentina_1998%E2%80%932002&amp;action=edit&amp;redlink=1\">nền kinh tế Argentina l&uacute;c đ&oacute; đang l&acirc;m v&agrave;o suy tho&aacute;i</a>.<sup id=\"cite_ref-On_a_Mission_25-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-On_a_Mission-25\">[21]</a></sup><sup id=\"cite_ref-Aimar_26-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-Aimar-26\">[22]</a></sup>&nbsp;Thần tượng ghi b&agrave;n của Messi khi trưởng th&agrave;nh l&agrave;&nbsp;<a title=\"Ronaldo (cầu thủ b&oacute;ng đ&aacute; Brasil)\" href=\"https://vi.wikipedia.org/wiki/Ronaldo_(c%E1%BA%A7u_th%E1%BB%A7_b%C3%B3ng_%C4%91%C3%A1_Brasil)\">Ronaldo</a>, Messi từng gọi anh l&agrave; \"tiền đạo xuất sắc nhất m&agrave; t&ocirc;i từng thấy\".<sup id=\"cite_ref-27\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-27\">[23]</a></sup></p>\n<figure class=\"mw-default-size mw-halign-left\"><a class=\"mw-file-description\" href=\"https://vi.wikipedia.org/wiki/T%E1%BA%ADp_tin:La_Masia_(Can_Planas)_(Barcelona)_-_1.jpg\"><img class=\"mw-file-element\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/La_Masia_%28Can_Planas%29_%28Barcelona%29_-_1.jpg/220px-La_Masia_%28Can_Planas%29_%28Barcelona%29_-_1.jpg\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/a/a0/La_Masia_%28Can_Planas%29_%28Barcelona%29_-_1.jpg/330px-La_Masia_%28Can_Planas%29_%28Barcelona%29_-_1.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a0/La_Masia_%28Can_Planas%29_%28Barcelona%29_-_1.jpg/440px-La_Masia_%28Can_Planas%29_%28Barcelona%29_-_1.jpg 2x\" width=\"220\" height=\"146\" data-file-width=\"3008\" data-file-height=\"2000\"></a>\n<figcaption>Messi đăng k&yacute; theo học tại l&ograve; đ&agrave;o tạo trẻ của Barcelona,&nbsp;<a title=\"La Masia\" href=\"https://vi.wikipedia.org/wiki/La_Masia\">La Masia</a>, ở tuổi 13</figcaption>\n</figure>\n<p>V&igrave; gia đ&igrave;nh Messi c&oacute; người th&acirc;n sống ở Catalonia n&ecirc;n họ đ&atilde; t&igrave;m c&aacute;ch sắp xếp cho Messi thử việc với&nbsp;<a title=\"FC Barcelona\" href=\"https://vi.wikipedia.org/wiki/FC_Barcelona\">Barcelona</a>&nbsp;v&agrave;o th&aacute;ng 9 năm 2000. Gi&aacute;m đốc kỹ thuật&nbsp;<a class=\"new\" title=\"Charly Rexach (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Charly_Rexach&amp;action=edit&amp;redlink=1\">Charly Rexach</a>&nbsp;ngay lập tức muốn được k&yacute; hợp đồng với anh, nhưng ban l&atilde;nh đạo lại do dự; v&agrave;o thời điểm đ&oacute;, việc c&aacute;c c&acirc;u lạc bộ ch&acirc;u &Acirc;u k&yacute; hợp đồng với những cầu thủ nước ngo&agrave;i ở độ tuổi trẻ như vậy l&agrave; rất bất thường. V&agrave;o ng&agrave;y 14 th&aacute;ng 12, gia đ&igrave;nh Messi đ&atilde; đưa ra tối hậu thư cho Bar&ccedil;a nhằm chứng minh cam kết của họ, v&agrave; Rexach l&uacute;c đ&oacute; kh&ocirc;ng mang theo tờ giấy n&agrave;o trong người n&ecirc;n đ&atilde; viết một bản hợp đồng tr&ecirc;n tờ giấy ăn.<sup id=\"cite_ref-On_a_Mission_25-1\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-On_a_Mission-25\">[21]</a></sup><sup id=\"cite_ref-Serviette_28-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-Serviette-28\">[24]</a></sup>&nbsp;V&agrave;o th&aacute;ng 2 năm 2001, gia đ&igrave;nh Leo chuyển đến Barcelona, sinh sống trong một căn hộ gần s&acirc;n nh&agrave; của c&acirc;u lạc bộ,&nbsp;<a title=\"Camp Nou\" href=\"https://vi.wikipedia.org/wiki/Camp_Nou\">Camp Nou</a>. Trong năm đầu ti&ecirc;n của anh ở T&acirc;y Ban Nha, Messi hiếm khi được thi đấu cho&nbsp;<em>Infantiles</em>&nbsp;do c&ograve;n m&acirc;u thuẫn trong vấn đề chuyển nhượng với Newell\'s; l&agrave; một người ngoại quốc, anh chỉ c&oacute; thể được ra s&acirc;n trong c&aacute;c trận giao hữu v&agrave; giải v&ocirc; địch Catalan. Kh&ocirc;ng c&oacute; b&oacute;ng đ&aacute;, anh phải vật lộn để h&ograve;a nhập với đội b&oacute;ng; vốn l&agrave; người k&iacute;n tiếng, anh &iacute;t n&oacute;i đến mức ban đầu những người đồng đội tin rằng Messi bị c&acirc;m. Anh c&ograve;n phải trải qua qu&atilde;ng thời gian nhớ nh&agrave; sau khi mẹ anh chuyển về Rosario c&ugrave;ng với c&aacute;c anh trai v&agrave; c&ocirc; em g&aacute;i Mar&iacute;a Sol, trong khi Messi vẫn ở lại Barcelona với cha m&igrave;nh.<sup id=\"cite_ref-Here_and_Gone_22-1\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-Here_and_Gone-22\">[18]</a></sup><sup id=\"cite_ref-Serviette_28-1\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-Serviette-28\">[24]</a></sup><sup id=\"cite_ref-BoyGenius_29-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-BoyGenius-29\">[25]</a></sup></p>\n<p>Sau một năm theo học tại l&ograve; đ&agrave;o tạo trẻ của Barcelona,&nbsp;<a title=\"La Masia\" href=\"https://vi.wikipedia.org/wiki/La_Masia\">La Masia</a>, Messi cuối c&ugrave;ng đ&atilde; được ghi danh v&agrave;o&nbsp;<a title=\"Li&ecirc;n đo&agrave;n b&oacute;ng đ&aacute; Ho&agrave;ng gia T&acirc;y Ban Nha\" href=\"https://vi.wikipedia.org/wiki/Li%C3%AAn_%C4%91o%C3%A0n_b%C3%B3ng_%C4%91%C3%A1_Ho%C3%A0ng_gia_T%C3%A2y_Ban_Nha\">Li&ecirc;n đo&agrave;n b&oacute;ng đ&aacute; Ho&agrave;ng gia T&acirc;y Ban Nha</a>&nbsp;(RFEF) th&aacute;ng 2 năm 2002. C&oacute; thể g&oacute;p mặt ở mọi giải đấu, anh kết bạn với nhiều người đồng đội, trong số đ&oacute; c&oacute;&nbsp;<a title=\"Cesc F&agrave;bregas\" href=\"https://vi.wikipedia.org/wiki/Cesc_F%C3%A0bregas\">Cesc F&agrave;bregas</a>&nbsp;v&agrave;&nbsp;<a title=\"Gerard Piqu&eacute;\" href=\"https://vi.wikipedia.org/wiki/Gerard_Piqu%C3%A9\">Gerard Piqu&eacute;</a>.<sup id=\"cite_ref-FOOTNOTECaioli201261&ndash;62_30-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-FOOTNOTECaioli201261%E2%80%9362-30\">[26]</a></sup>&nbsp;Sau khi ho&agrave;n th&agrave;nh đợt điều trị hormone tăng trưởng ở tuổi 14,<sup id=\"cite_ref-FOOTNOTEBalagu&eacute;2013149_31-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-FOOTNOTEBalagu%C3%A92013149-31\">[27]</a></sup>&nbsp;Messi trở th&agrave;nh một phần kh&ocirc;ng thể thiếu của \"Baby Dream Team\", đội trẻ vĩ đại nhất từ trước đến nay của Barcelona. Trong m&ugrave;a giải đầu ti&ecirc;n (2002&ndash;03), anh l&agrave; vua ph&aacute; lưới với 36 b&agrave;n sau 30 trận cho&nbsp;<em>Cadetes</em>&nbsp;A, gi&agrave;nh được c&uacute; ăn ba v&ocirc; tiền kho&aacute;ng hậu của giải quốc nội bao gồm hai c&uacute;p T&acirc;y Ban Nha v&agrave; một c&uacute;p Catalan.<sup id=\"cite_ref-FOOTNOTECaioli201261&ndash;62_30-1\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-FOOTNOTECaioli201261%E2%80%9362-30\">[26]</a></sup><sup id=\"cite_ref-Class_of_2002_32-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-Class_of_2002-32\">[28]</a></sup>&nbsp;Trận chung kết Copa Catalunya, chiến thắng 4&ndash;1 trước&nbsp;<a title=\"RCD Espanyol\" href=\"https://vi.wikipedia.org/wiki/RCD_Espanyol\">Espanyol</a>, được biết đến trong lịch sử c&acirc;u lạc bộ với c&aacute;i t&ecirc;n&nbsp;<em>partido de la m&aacute;scara</em>, trận chung kết của những chiếc mặt nạ. Một tuần sau khi bị g&atilde;y xương g&ograve; m&aacute; trong một trận đấu tại giải v&ocirc; địch quốc gia, Messi được ph&eacute;p ra s&acirc;n với điều kiện phải đeo một miếng bảo vệ bằng nhựa; bị cản trở bởi chiếc mặt nạ, anh đ&atilde; th&aacute;o n&oacute; ra v&agrave; ghi hai b&agrave;n trong 10 ph&uacute;t trước khi rời s&acirc;n.<sup id=\"cite_ref-FOOTNOTEHunter201244&ndash;45_33-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-FOOTNOTEHunter201244%E2%80%9345-33\">[29]</a></sup>&nbsp;V&agrave;o cuối m&ugrave;a giải, anh nhận được đề nghị gia nhập&nbsp;<a class=\"mw-redirect\" title=\"Arsenal FC\" href=\"https://vi.wikipedia.org/wiki/Arsenal_FC\">Arsenal</a>, lần đầu ti&ecirc;n từ một c&acirc;u lạc bộ nước ngo&agrave;i, nhưng trong khi F&agrave;bregas v&agrave; Piqu&eacute; sớm đến Anh, anh đ&atilde; chọn ở lại Barcelona.<sup id=\"cite_ref-Serviette_28-2\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-Serviette-28\">[24]</a></sup><sup id=\"cite_ref-34\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-34\">[30]</a></sup><sup id=\"cite_ref-Messiah_35-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Lionel_Messi#cite_note-Messiah-35\">[31]</a></sup></p>', '2024-04-03', 176, 69, 3, 3, 5, 'AB', '660/75', 22.28, '640', 'hơi cao', '<p>kh&ocirc;ng c&oacute; bệnh l&yacute;</p>', 'oke', 'tốt', 'bình thường'),
(4, '<p>heheh</p>', '2024-04-24', 175, 70, 3, 2, 8, 'B', '350/70', 22.86, '670', '544', '<p>kh&ocirc;ng</p>', 'ổn', 'ok', 'bình thường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `athlete_history`
--

CREATE TABLE `athlete_history` (
  `id` bigint NOT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `glycemic_index` varchar(255) DEFAULT NULL,
  `heartbeat` varchar(255) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `pathological` varchar(255) DEFAULT NULL,
  `physical` varchar(255) DEFAULT NULL,
  `physical_classification` varchar(255) DEFAULT NULL,
  `stress` varchar(255) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `athlete_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `athlete_history`
--

INSERT INTO `athlete_history` (`id`, `blood_group`, `blood_pressure`, `bmi`, `created_date`, `glycemic_index`, `heartbeat`, `height`, `pathological`, `physical`, `physical_classification`, `stress`, `weight`, `athlete_id`) VALUES
(1, 'AB', '670/70', 22.34, '2024-04-27', '650', 'hơi nhanh', 177, '<p>kh&ocirc;ng c&oacute; bệnh l&yacute;</p>', 'oke', 'tốt', 'bình thường', 70, 1),
(2, 'AB', '650/70', 22.28, '2024-04-27', '650', 'Bình thường', 176, '<p>kh&ocirc;ng c&oacute; bệnh l&yacute;</p>', 'oke', 'tốt', 'bình thường', 69, 1),
(3, 'AB', '660/70', 22.28, '2024-05-09', '640', 'hơi cao', 176, '<p>kh&ocirc;ng c&oacute; bệnh l&yacute;</p>', 'oke', 'tốt', 'bình thường', 69, 1),
(4, 'AB', '660/75', 22.28, '2024-05-13', '640', 'hơi cao', 176, '<p>kh&ocirc;ng c&oacute; bệnh l&yacute;</p>', 'oke', 'tốt', 'bình thường', 69, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exercise`
--

CREATE TABLE `exercise` (
  `id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unit_measure` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `exercise`
--

INSERT INTO `exercise` (`id`, `description`, `name`, `unit_measure`, `user_id`) VALUES
(1, '<p>fewwewef</p>', 'Bài tập khởi động điền kinh', 'kcalo', 3),
(2, '<p>oke hehehe</p>', 'Cây cầu với chân mở rộng', 'kcalo', 3),
(4, '<p>oke</p>', 'Bài tập nhảy cao', 'kcalo', 3),
(5, '<p>oke s</p>', 'Chạy nhanh 100m', 'kcalo', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exercise_schedule`
--

CREATE TABLE `exercise_schedule` (
  `id` bigint NOT NULL,
  `exercise_id` bigint DEFAULT NULL,
  `schedule_id` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `exercise_schedule`
--

INSERT INTO `exercise_schedule` (`id`, `exercise_id`, `schedule_id`, `quantity`) VALUES
(5, 1, 6, 2),
(6, 2, 6, 4),
(7, 5, 6, 5),
(11, 1, 5, 2),
(12, 2, 5, 4),
(13, 1, 3, 2),
(14, 5, 3, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `injuries`
--

CREATE TABLE `injuries` (
  `id` bigint NOT NULL,
  `created_date` date DEFAULT NULL,
  `injuries_date` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `severity` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `athlete_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `injuries`
--

INSERT INTO `injuries` (`id`, `created_date`, `injuries_date`, `location`, `severity`, `status`, `athlete_id`) VALUES
(1, '2024-04-27', '2024-04-25', 'Đùi bên trái', 'rất nghiêm trọng', '<p>đ&ugrave;i đ&atilde; bị đứt d&acirc;y trằng</p>', 4),
(3, '2024-04-27', '2024-04-26', 'Bắp tay trái', 'không nghiêm trọng', '<p>Đ&atilde; được xử l&yacute;</p>', 1),
(4, '2024-05-09', '2024-05-09', 'Cổ sau', 'rất nghiêm trọng', '<p>Đ&atilde; được xử l&yacute;</p>', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `physical_exam`
--

CREATE TABLE `physical_exam` (
  `id` bigint NOT NULL,
  `created_date` date DEFAULT NULL,
  `exam_day` date DEFAULT NULL,
  `exam_place` varchar(255) DEFAULT NULL,
  `link_result` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `athlete_id` bigint DEFAULT NULL,
  `sports_expert` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `physical_exam`
--

INSERT INTO `physical_exam` (`id`, `created_date`, `exam_day`, `exam_place`, `link_result`, `result`, `athlete_id`, `sports_expert`, `name`) VALUES
(2, '2024-04-26', '2024-04-28', 'Bệnh viện bạch mai', '', '<p>fvref</p>', 4, 4, 'Khám tổng quát'),
(3, '2024-04-27', '2024-05-02', 'Bệnh viện quân y 108', '', '', 1, 4, 'Khám dây trằng chéo');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plan`
--

CREATE TABLE `plan` (
  `id` bigint NOT NULL,
  `complete` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `athlete_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `plan`
--

INSERT INTO `plan` (`id`, `complete`, `name`, `athlete_id`) VALUES
(1, b'0', 'Kế hoạch A', 1),
(2, b'1', 'Kế hoạch B', 1),
(3, b'0', 'Kế hoạch C', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `revenue_expenditure`
--

CREATE TABLE `revenue_expenditure` (
  `id` bigint NOT NULL,
  `amount` double DEFAULT NULL,
  `bill` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `revenue_type` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `revenue_expenditure`
--

INSERT INTO `revenue_expenditure` (`id`, `amount`, `bill`, `content`, `created_date`, `pay_date`, `revenue_type`, `title`, `user_id`) VALUES
(1, 500000, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1713749121/vmzzpnhfcdcgqqv9ddqm.png', '<p>oke hehehe</p>', '2024-04-22', '2024-04-16', 1, 'thu hhehehe', 1),
(3, 2000000, '', '<p>oke</p>', '2024-05-11', '2024-05-11', 0, 'Tiền tài trợ công ty HVNN', 1),
(4, 3570000, '', '<p>tiền phạt c&aacute;c vdv</p>', '2024-05-11', '2024-05-09', 0, 'Tiền phạt', 1),
(5, 1450000, '', '<p>chi</p>', '2024-05-11', '2024-05-08', 1, 'Mua đồ tập cho vđv', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schedule`
--

CREATE TABLE `schedule` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `feed_back` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `workout_date` date DEFAULT NULL,
  `athlete_id` bigint DEFAULT NULL,
  `plan_id` bigint DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `mass` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `mark` int DEFAULT NULL,
  `feed_back_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `schedule`
--

INSERT INTO `schedule` (`id`, `content`, `end_time`, `feed_back`, `result`, `start_time`, `workout_date`, `athlete_id`, `plan_id`, `address`, `level`, `mass`, `status`, `mark`, `feed_back_date`) VALUES
(1, '<p>tập nhiều đấy</p>', '08:23', NULL, '', '15:23', '2024-04-26', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '<p>y45y56y</p>', '18:29', NULL, '', '16:29', '2024-04-13', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, '16:29', 'Tập nặng quá update', '', '15:29', '2024-04-02', 1, 1, '', '', '', 2, NULL, NULL),
(5, NULL, '14:00', NULL, '', '11:00', '2024-04-20', NULL, 1, 'Nhà A', 'Trung bình', 'Vừa phải', 1, NULL, NULL),
(6, NULL, '15:00', 'heheh update', '', '13:00', '2024-05-05', NULL, 1, NULL, NULL, NULL, 2, 6, '2024-05-14 10:31:38'),
(7, NULL, '21:36', NULL, '', '18:36', '2024-05-07', NULL, 1, 'Nhà B', 'Dễ', 'Trung bình', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specialize`
--

CREATE TABLE `specialize` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `specialize`
--

INSERT INTO `specialize` (`id`, `name`) VALUES
(1, 'Bóng đá'),
(2, 'Bóng rổ'),
(3, 'Bóng chuyền'),
(4, 'Cầu lông'),
(5, 'Điền kinh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tournament`
--

CREATE TABLE `tournament` (
  `id` bigint NOT NULL,
  `competition_day` date DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `specialize_id` bigint DEFAULT NULL,
  `lock_regis` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tournament`
--

INSERT INTO `tournament` (`id`, `competition_day`, `content`, `created_date`, `description`, `name`, `specialize_id`, `lock_regis`) VALUES
(1, '2024-04-28', '<p><strong>Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 2022</strong>&nbsp;(hay&nbsp;<strong>C&uacute;p b&oacute;ng đ&aacute; thế giới 2022</strong>,&nbsp;<a title=\"Tiếng Anh\" href=\"https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_Anh\">tiếng Anh</a>:&nbsp;<em><span lang=\"en\">2022 FIFA World Cup</span></em>,&nbsp;<a title=\"Tiếng Ả Rập\" href=\"https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_%E1%BA%A2_R%E1%BA%ADp\">tiếng Ả Rập</a>:&nbsp;<span dir=\"rtl\" lang=\"ar\">كأس العالم لكرة القدم 2022</span>&lrm;) l&agrave;&nbsp;<a title=\"Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới\" href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi\">giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới</a>&nbsp;lần thứ 22, giải đấu được diễn ra tại&nbsp;<a title=\"Qatar\" href=\"https://vi.wikipedia.org/wiki/Qatar\">Qatar</a>&nbsp;từ ng&agrave;y 20 th&aacute;ng 11 đến ng&agrave;y 18 th&aacute;ng 12 năm 2022. Đ&acirc;y l&agrave; kỳ World Cup lần thứ 2 trong lịch sử được tổ chức tại ch&acirc;u &Aacute; (sau kỳ&nbsp;<a class=\"mw-redirect\" title=\"World Cup 2002\" href=\"https://vi.wikipedia.org/wiki/World_Cup_2002\">World Cup 2002</a>&nbsp;được tổ chức ở Nhật Bản v&agrave; H&agrave;n Quốc), v&agrave; cũng l&agrave; kỳ World Cup lần đầu ti&ecirc;n được tổ chức ở một quốc gia thuộc&nbsp;<a title=\"Thế giới Ả Rập\" href=\"https://vi.wikipedia.org/wiki/Th%E1%BA%BF_gi%E1%BB%9Bi_%E1%BA%A2_R%E1%BA%ADp\">thế giới Ả Rập</a>&nbsp;v&agrave;&nbsp;<a title=\"Thế giới Hồi gi&aacute;o\" href=\"https://vi.wikipedia.org/wiki/Th%E1%BA%BF_gi%E1%BB%9Bi_H%E1%BB%93i_gi%C3%A1o\">thế giới Hồi gi&aacute;o</a>. Qatar trở th&agrave;nh nước chủ nh&agrave; thứ 3 ở ch&acirc;u &Aacute; gi&agrave;nh quyền đăng cai World Cup.<sup id=\"cite_ref-2\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-2\">[A]</a></sup></p>\n<p>Đ&acirc;y cũng l&agrave; kỳ World Cup cuối c&ugrave;ng với 32 đội tham dự trước khi số lượng đội sẽ tăng l&ecirc;n 48 đội cho kỳ&nbsp;<a title=\"Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 2026\" href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2026\">World Cup 2026</a>. Để tr&aacute;nh sự khắc nghiệt của kh&iacute; hậu n&oacute;ng bức ở Qatar,<sup id=\"cite_ref-4\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-4\">[B]</a></sup>&nbsp;World Cup n&agrave;y được tổ chức v&agrave;o th&aacute;ng 11 v&agrave; th&aacute;ng 12.<sup id=\"cite_ref-6\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-6\">[C]</a></sup>&nbsp;Giải được tổ chức trong một khung thời gian r&uacute;t ngắn l&agrave; 29 ng&agrave;y với 64 trận đấu được diễn ra ở t&aacute;m địa điểm khắp năm th&agrave;nh phố.&nbsp;<a title=\"Đội tuyển b&oacute;ng đ&aacute; quốc gia Qatar\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tuy%E1%BB%83n_b%C3%B3ng_%C4%91%C3%A1_qu%E1%BB%91c_gia_Qatar\">Qatar</a>&nbsp;tự động tham dự giải, c&ugrave;ng với 31 đội c&ograve;n lại được x&aacute;c định theo&nbsp;<a title=\"V&ograve;ng loại Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 2022\" href=\"https://vi.wikipedia.org/wiki/V%C3%B2ng_lo%E1%BA%A1i_Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022\">quy tr&igrave;nh v&ograve;ng loại</a>. Đ&acirc;y l&agrave; kỳ World Cup đầu ti&ecirc;n trong lịch sử m&agrave; Qatar g&oacute;p mặt. Tuy nhi&ecirc;n, đội đ&atilde; g&acirc;y thất vọng khi thua cả 3 trận v&ograve;ng bảng, trở th&agrave;nh chủ nh&agrave; đầu ti&ecirc;n thua trận mở m&agrave;n, chủ nh&agrave; bị loại sớm nhất, v&agrave; chủ nh&agrave; thứ 2 (sau đội tuyển&nbsp;<a title=\"Đội tuyển b&oacute;ng đ&aacute; quốc gia Nam Phi\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tuy%E1%BB%83n_b%C3%B3ng_%C4%91%C3%A1_qu%E1%BB%91c_gia_Nam_Phi\">Nam Phi</a>&nbsp;ở kỳ&nbsp;<a title=\"Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 2010\" href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2010\">World Cup 2010</a>) kh&ocirc;ng vượt qua được v&ograve;ng bảng.<sup id=\"cite_ref-7\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-7\">[4]</a></sup><sup id=\"cite_ref-8\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-8\">[5]</a></sup></p>\n<p><a title=\"Đội tuyển b&oacute;ng đ&aacute; quốc gia Ph&aacute;p\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tuy%E1%BB%83n_b%C3%B3ng_%C4%91%C3%A1_qu%E1%BB%91c_gia_Ph%C3%A1p\">Ph&aacute;p</a>&nbsp;l&agrave; đương kim v&ocirc; địch, nhưng đ&atilde; thất bại với tỉ số 2&ndash;4 ở loạt s&uacute;t lu&acirc;n lưu trước&nbsp;<a title=\"Đội tuyển b&oacute;ng đ&aacute; quốc gia Argentina\" href=\"https://vi.wikipedia.org/wiki/%C4%90%E1%BB%99i_tuy%E1%BB%83n_b%C3%B3ng_%C4%91%C3%A1_qu%E1%BB%91c_gia_Argentina\">Argentina</a>&nbsp;trong&nbsp;<a title=\"Trận chung kết Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 2022\" href=\"https://vi.wikipedia.org/wiki/Tr%E1%BA%ADn_chung_k%E1%BA%BFt_Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022\">trận chung kết</a>&nbsp;sau khi hai đội h&ograve;a nhau 3&ndash;3 sau hiệp phụ. Argentina c&oacute; lần thứ 3 trong lịch sử gi&agrave;nh chức v&ocirc; địch World Cup v&agrave; l&agrave; lần đầu ti&ecirc;n kể từ kỳ&nbsp;<a title=\"Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 1986\" href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_1986\">World Cup 1986</a>, cũng như l&agrave; quốc gia đầu ti&ecirc;n ngo&agrave;i ch&acirc;u &Acirc;u v&ocirc; địch giải đấu kể từ kỳ&nbsp;<a title=\"Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 2002\" href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2002\">World Cup 2002</a>. Với 172 b&agrave;n thắng, giải đấu đ&atilde; x&aacute;c lập kỷ lục mới về số b&agrave;n thắng được ghi nhiều nhất với thể thức 32 đội, mỗi đội tham dự đều ghi được &iacute;t nhất một b&agrave;n thắng.<sup id=\"cite_ref-9\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-9\">[6]</a></sup></p>\n<p>Lựa chọn tổ chức World Cup tại Qatar đ&atilde; g&acirc;y ra&nbsp;<a title=\"Tranh c&atilde;i Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 2022\" href=\"https://vi.wikipedia.org/wiki/Tranh_c%C3%A3i_Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022\">nhiều tranh c&atilde;i</a>.<sup id=\"cite_ref-18\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-18\">[D]</a></sup>&nbsp;Những lời chỉ tr&iacute;ch tập trung v&agrave;o&nbsp;<a title=\"Nh&acirc;n quyền tại Qatar\" href=\"https://vi.wikipedia.org/wiki/Nh%C3%A2n_quy%E1%BB%81n_t%E1%BA%A1i_Qatar\">hồ sơ nh&acirc;n quyền</a>&nbsp;v&agrave; kh&iacute; hậu của Qatar, cũng như c&aacute;c c&aacute;o buộc hối lộ v&agrave;&nbsp;<a title=\"Tham nhũng FIFA 2015\" href=\"https://vi.wikipedia.org/wiki/Tham_nh%C5%A9ng_FIFA_2015\">tham nhũng của FIFA</a>.<sup id=\"cite_ref-20\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-20\">[E]</a></sup></p>\n<h2><span id=\"T.E1.BB.95ng_quan\"></span><span id=\"Tổng_quan\" class=\"mw-headline\">Tổng quan</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a class=\"mw-editsection-visualeditor\" title=\"Sửa đổi phần &ldquo;Tổng quan&rdquo;\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;veaction=edit&amp;section=1\">sửa</a><span class=\"mw-editsection-divider\">&nbsp;|&nbsp;</span><a title=\"Sửa m&atilde; nguồn tại đề mục: Tổng quan\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;action=edit&amp;section=1\">sửa m&atilde; nguồn</a><span class=\"mw-editsection-bracket\">]</span></span></h2>\n<p>Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới l&agrave; một cuộc thi b&oacute;ng đ&aacute; quốc tế h&agrave;ng đầu do&nbsp;<a title=\"FIFA\" href=\"https://vi.wikipedia.org/wiki/FIFA\">FIFA</a>&nbsp;tổ chức.<sup id=\"cite_ref-21\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-21\">[16]</a></sup><sup id=\"cite_ref-22\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-22\">[17]</a></sup>&nbsp;Trong giải đấu n&agrave;y, c&aacute;c đội tuyển b&oacute;ng đ&aacute; quốc gia tham gia tranh t&agrave;i. Lần đầu ti&ecirc;n giải đấu được tổ chức l&agrave; v&agrave;o năm 1930 tại Uruguay,<sup id=\"cite_ref-foxsports.com_23-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-foxsports.com-23\">[18]</a></sup>&nbsp;v&agrave; từ năm 1998 trở đi, c&oacute; 32 đội tham gia.<sup id=\"cite_ref-foxsports.com_23-1\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-foxsports.com-23\">[18]</a></sup>&nbsp;Cuộc thi diễn ra theo cơ chế 8 bảng đấu v&ograve;ng tr&ograve;n, sau đ&oacute; l&agrave; v&ograve;ng loại trực tiếp cho 16 đội tiếp theo.<sup id=\"cite_ref-24\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-24\">[19]</a></sup>&nbsp;Đội v&ocirc; địch hiện tại l&agrave; Ph&aacute;p, đ&atilde; đ&aacute;nh bại Croatia 4-2 trong trận chung kết của&nbsp;<a title=\"Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 2018\" href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2018\">World Cup 2018</a>.<sup id=\"cite_ref-25\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-25\">[20]</a></sup><sup id=\"cite_ref-26\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-26\">[21]</a></sup>&nbsp;World Cup 2022 được dự kiến tổ chức tại Qatar từ ng&agrave;y&nbsp;<a title=\"20 th&aacute;ng 11\" href=\"https://vi.wikipedia.org/wiki/20_th%C3%A1ng_11\">20 th&aacute;ng 11</a>&nbsp;đến ng&agrave;y&nbsp;<a title=\"18\" href=\"https://vi.wikipedia.org/wiki/18\">18</a>&nbsp;th&aacute;ng 12.<sup id=\"cite_ref-27\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-27\">[22]</a></sup><sup id=\"cite_ref-28\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-28\">[23]</a></sup><sup id=\"cite_ref-auto6_29-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-auto6-29\">[24]</a></sup><sup id=\"cite_ref-30\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-30\">[25]</a></sup>&nbsp;Đ&acirc;y sẽ l&agrave; lần đầu ti&ecirc;n giải đấu World Cup diễn ra tại v&ugrave;ng Đ&ocirc;ng Trung Quốc.<sup id=\"cite_ref-31\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-31\">[26]</a></sup>&nbsp;Trong sự kiện n&agrave;y, y&ecirc;u cầu về ph&ograve;ng dịch&nbsp;<a title=\"COVID-19\" href=\"https://vi.wikipedia.org/wiki/COVID-19\">COVID-19</a>&nbsp;sẽ kh&ocirc;ng &aacute;p dụng mạnh mẽ như việc giữ khoảng c&aacute;ch x&atilde; hội, đeo khẩu trang v&agrave; l&agrave;m x&eacute;t nghiệm &acirc;m t&iacute;nh.<sup id=\"cite_ref-32\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-32\">[27]</a></sup></p>\n<h3><span id=\"L.E1.BB.8Bch_tr.C3.ACnh\"></span><span id=\"Lịch_tr&igrave;nh\" class=\"mw-headline\">Lịch tr&igrave;nh</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a class=\"mw-editsection-visualeditor\" title=\"Sửa đổi phần &ldquo;Lịch tr&igrave;nh&rdquo;\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;veaction=edit&amp;section=2\">sửa</a><span class=\"mw-editsection-divider\">&nbsp;|&nbsp;</span><a title=\"Sửa m&atilde; nguồn tại đề mục: Lịch tr&igrave;nh\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;action=edit&amp;section=2\">sửa m&atilde; nguồn</a><span class=\"mw-editsection-bracket\">]</span></span></h3>\n<p>So với c&aacute;c kỳ World Cup trước đ&acirc;y diễn ra v&agrave;o m&ugrave;a h&egrave; n&oacute;ng bức với độ ẩm cao ở&nbsp;<a title=\"Qatar\" href=\"https://vi.wikipedia.org/wiki/Qatar\">Qatar</a>,<sup id=\"cite_ref-auto5_3-2\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-auto5-3\">[2]</a></sup><sup id=\"cite_ref-auto6_29-1\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-auto6-29\">[24]</a></sup><sup id=\"cite_ref-33\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-33\">[28]</a></sup>&nbsp;World Cup 2022 được tổ chức v&agrave;o th&aacute;ng 11 v&agrave; th&aacute;ng 12.<sup id=\"cite_ref-Atlantic_2022_10-2\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-Atlantic_2022-10\">[7]</a></sup><sup id=\"cite_ref-34\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-34\">[29]</a></sup>&nbsp;Điều n&agrave;y đ&atilde; g&acirc;y ra sự bất thường trong lịch thi đấu của c&aacute;c giải b&oacute;ng đ&aacute; quốc gia, bao gồm cả c&aacute;c giải đấu lớn ở&nbsp;<a title=\"Ch&acirc;u &Acirc;u\" href=\"https://vi.wikipedia.org/wiki/Ch%C3%A2u_%C3%82u\">ch&acirc;u &Acirc;u</a>. Để ph&ugrave; hợp với&nbsp;<a class=\"mw-disambig\" title=\"World Cup\" href=\"https://vi.wikipedia.org/wiki/World_Cup\">World Cup</a>, c&aacute;c giải đấu n&agrave;y đ&atilde; phải điều chỉnh lịch tr&igrave;nh bằng c&aacute;ch ch&egrave;n th&ecirc;m thời gian nghỉ k&eacute;o d&agrave;i v&agrave;o lịch tr&igrave;nh trong nước của họ. Đồng thời, c&aacute;c trận v&ograve;ng bảng của c&aacute;c giải đấu lớn ở&nbsp;<a title=\"Ch&acirc;u &Acirc;u\" href=\"https://vi.wikipedia.org/wiki/Ch%C3%A2u_%C3%82u\">ch&acirc;u &Acirc;u</a>&nbsp;đ&atilde; được l&ecirc;n lịch trước&nbsp;<a class=\"mw-disambig\" title=\"World Cup\" href=\"https://vi.wikipedia.org/wiki/World_Cup\">World Cup</a>&nbsp;để tr&aacute;nh thi đấu v&agrave;o năm sau.<sup id=\"cite_ref-35\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-35\">[30]</a></sup></p>\n<p>FIFA đ&atilde; x&aacute;c nhận lịch thi đấu World Cup 2022 v&agrave;o th&aacute;ng 7 năm 2020.<sup id=\"cite_ref-schedule_confirmed_36-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-schedule_confirmed-36\">[31]</a></sup>&nbsp;V&ograve;ng bảng sẽ bắt đầu v&agrave;o ng&agrave;y 21 th&aacute;ng 11 với bốn trận đấu mỗi ng&agrave;y. Sau đ&oacute;, lịch thi đấu đ&atilde; được điều chỉnh để dời trận Qatar vs Ecuador sang ng&agrave;y 20 th&aacute;ng 11, sau khi FIFA cho ph&eacute;p Qatar khai mạc giải đấu.<sup id=\"cite_ref-37\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-37\">[32]</a></sup><sup id=\"cite_ref-38\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-38\">[33]</a></sup>&nbsp;Trận chung kết sẽ diễn ra v&agrave;o ng&agrave;y 18 th&aacute;ng 12 năm 2022, cũng l&agrave; Ng&agrave;y Quốc kh&aacute;nh, tại S&acirc;n vận động Lusail.<sup id=\"cite_ref-schedule_confirmed_36-1\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-schedule_confirmed-36\">[31]</a></sup><sup id=\"cite_ref-schedule_39-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-schedule-39\">[34]</a></sup></p>\n<p>C&aacute;c trận đấu cho từng bảng được ph&acirc;n bố v&agrave;o c&aacute;c s&acirc;n vận động sau đ&acirc;y:<sup id=\"cite_ref-schedule_39-1\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-schedule-39\">[34]</a></sup></p>\n<ul>\n<li>Bảng A, B, E, F: S&acirc;n vận động Al Bayt, S&acirc;n vận động Khalifa International, S&acirc;n vận động Al Thumama, S&acirc;n vận động Ahmad bin Ali.</li>\n<li>Bảng C, D, G, H: S&acirc;n vận động Lusail, S&acirc;n vận động Stadium 974, S&acirc;n vận động Education City, S&acirc;n vận động Al Janoub.</li>\n</ul>\n<p>FIFA đ&atilde; x&aacute;c nhận rằng v&ograve;ng bảng của World Cup 2022 sẽ diễn ra từ ng&agrave;y 1 th&aacute;ng 4 năm 2022, sau lễ bốc thăm.<sup id=\"cite_ref-40\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-40\">[35]</a></sup><sup id=\"cite_ref-41\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-41\">[36]</a></sup>&nbsp;Ng&agrave;y 11 th&aacute;ng 8, th&ocirc;ng b&aacute;o rằng trận đấu giữa Qatar v&agrave; Ecuador đ&atilde; được dời lại một ng&agrave;y v&agrave; trở th&agrave;nh trận khai mạc của giải đấu, trong khi trận đấu giữa Senegal v&agrave; H&agrave; Lan, trận khai mạc ban đầu, đ&atilde; được di chuyển đến thời gian kh&aacute;c.<sup id=\"cite_ref-42\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-42\">[37]</a></sup></p>\n<h3><span id=\"Ti.E1.BB.81n_th.C6.B0.E1.BB.9Fng\"></span><span id=\"Tiền_thưởng\" class=\"mw-headline\">Tiền thưởng</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a class=\"mw-editsection-visualeditor\" title=\"Sửa đổi phần &ldquo;Tiền thưởng&rdquo;\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;veaction=edit&amp;section=3\">sửa</a><span class=\"mw-editsection-divider\">&nbsp;|&nbsp;</span><a title=\"Sửa m&atilde; nguồn tại đề mục: Tiền thưởng\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;action=edit&amp;section=3\">sửa m&atilde; nguồn</a><span class=\"mw-editsection-bracket\">]</span></span></h3>\n<p>V&agrave;o th&aacute;ng 4 năm 2022,&nbsp;<a title=\"FIFA\" href=\"https://vi.wikipedia.org/wiki/FIFA\">FIFA</a>&nbsp;c&ocirc;ng bố c&aacute;c giải thưởng cho tất cả c&aacute;c đội tham dự. Mỗi đội được lựa chọn nhận 1,5 triệu đ&ocirc; la trước giải đấu để đảm bảo c&aacute;c chi ph&iacute; chuẩn bị. Ngo&agrave;i ra, mỗi đội &iacute;t nhất sẽ nhận được 9 triệu đ&ocirc; la tiền thưởng. Tổng số tiền thưởng trong giải đấu n&agrave;y l&agrave; 440 triệu đ&ocirc; la, tăng th&ecirc;m 40 triệu đ&ocirc; la so với giải đấu trước đ&oacute;.<sup id=\"cite_ref-43\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-43\">[38]</a></sup></p>\n<table class=\"wikitable sortable jquery-tablesorter\">\n<thead>\n<tr>\n<th class=\"headerSort\" tabindex=\"0\" title=\"Sắp xếp tăng dần\" role=\"columnheader button\" rowspan=\"2\">Vị tr&iacute;</th>\n<th class=\"headerSort\" tabindex=\"0\" title=\"Sắp xếp tăng dần\" role=\"columnheader button\" rowspan=\"2\">Đội tuyển</th>\n<th colspan=\"2\">Số tiền (t&iacute;nh bằng triệu đ&ocirc; la)</th>\n</tr>\n<tr>\n<th class=\"headerSort\" tabindex=\"0\" title=\"Sắp xếp tăng dần\" role=\"columnheader button\">Cho mỗi đội</th>\n<th class=\"headerSort\" tabindex=\"0\" title=\"Sắp xếp tăng dần\" role=\"columnheader button\">Tổng cộng</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>Nh&agrave; v&ocirc; địch</td>\n<td>1</td>\n<td>$42</td>\n<td>$42</td>\n</tr>\n<tr>\n<td>&Aacute; qu&acirc;n</td>\n<td>1</td>\n<td>$30</td>\n<td>$30</td>\n</tr>\n<tr>\n<td>Hạng ba</td>\n<td>1</td>\n<td>$27</td>\n<td>$27</td>\n</tr>\n<tr>\n<td>Hạng tư</td>\n<td>1</td>\n<td>$25</td>\n<td>$25</td>\n</tr>\n<tr>\n<td>Hạng 5-8 (tứ kết)</td>\n<td>4</td>\n<td>$17</td>\n<td>$68</td>\n</tr>\n<tr>\n<td>Hạng 9-16 (v&ograve;ng 16 đội)</td>\n<td>8</td>\n<td>$13</td>\n<td>$104</td>\n</tr>\n<tr>\n<td>Hạng 17-32 (v&ograve;ng bảng)</td>\n<td>16</td>\n<td>$9</td>\n<td>$144</td>\n</tr>\n</tbody>\n<tfoot>\n<tr>\n<th>Tổng cộng</th>\n<th>32</th>\n<th colspan=\"2\">$440</th>\n</tr>\n</tfoot>\n</table>\n<h3><span id=\"Thay_.C4.91.E1.BB.95i_quy_t.E1.BA.AFc\"></span><span id=\"Thay_đổi_quy_tắc\" class=\"mw-headline\">Thay đổi quy tắc</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a class=\"mw-editsection-visualeditor\" title=\"Sửa đổi phần &ldquo;Thay đổi quy tắc&rdquo;\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;veaction=edit&amp;section=4\">sửa</a><span class=\"mw-editsection-divider\">&nbsp;|&nbsp;</span><a title=\"Sửa m&atilde; nguồn tại đề mục: Thay đổi quy tắc\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;action=edit&amp;section=4\">sửa m&atilde; nguồn</a><span class=\"mw-editsection-bracket\">]</span></span></h3>\n<p>Giải đấu c&oacute; quy tắc thay người mới. Trong thời gian b&igrave;nh thường, mỗi đội được thay tối đa 5 lần.<sup id=\"cite_ref-44\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-44\">[39]</a></sup><sup id=\"cite_ref-45\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-45\">[40]</a></sup><sup id=\"cite_ref-46\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-46\">[41]</a></sup>&nbsp;Trong thời gian b&ugrave; giờ, chỉ được thay một lần. Điều đ&aacute;ng ch&uacute; &yacute; l&agrave; World Cup lần n&agrave;y c&oacute; thay người do chấn thương . Mỗi đội được ph&eacute;p thay một cầu thủ bị chấn thương trong một trận đấu, kh&ocirc;ng t&iacute;nh v&agrave;o số lần thay người th&ocirc;ng thường.<sup id=\"cite_ref-47\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-47\">[42]</a></sup>&nbsp;Trận đầu gặp Anh, thủ m&ocirc;n Alireza Beiranvand của Iran bị đau v&agrave; thay bằng Hossein Hosseini. Đ&acirc;y cũng l&agrave; lần đầu ti&ecirc;n &aacute;p dụng thay người do chấn thương ngo&agrave;i &yacute; muốn ở World Cup.<sup id=\"cite_ref-48\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-48\">[43]</a></sup></p>\n<h2><span id=\"Ch.E1.BB.8Dn_n.C6.B0.E1.BB.9Bc_ch.E1.BB.A7_nh.C3.A0\"></span><span id=\"Chọn_nước_chủ_nh&agrave;\" class=\"mw-headline\">Chọn nước chủ nh&agrave;</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a class=\"mw-editsection-visualeditor\" title=\"Sửa đổi phần &ldquo;Chọn nước chủ nh&agrave;&rdquo;\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;veaction=edit&amp;section=5\">sửa</a><span class=\"mw-editsection-divider\">&nbsp;|&nbsp;</span><a title=\"Sửa m&atilde; nguồn tại đề mục: Chọn nước chủ nh&agrave;\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;action=edit&amp;section=5\">sửa m&atilde; nguồn</a><span class=\"mw-editsection-bracket\">]</span></span></h2>\n<p>C&aacute;c thủ tục đấu thầu để đăng cai&nbsp;<a class=\"mw-redirect\" title=\"World Cup 2018\" href=\"https://vi.wikipedia.org/wiki/World_Cup_2018\">World Cup 2018</a>&nbsp;v&agrave; 2022 bắt đầu v&agrave;o th&aacute;ng 1 năm 2009, v&agrave; c&aacute;c hiệp hội quốc gia c&oacute; đến ng&agrave;y 2 th&aacute;ng 2 năm 2009 để đăng k&yacute; l&agrave;m chủ nh&agrave;.<sup id=\"cite_ref-49\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-49\">[44]</a></sup><sup id=\"cite_ref-50\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-50\">[45]</a></sup>&nbsp;Ban đầu, 11 hồ sơ dự thầu cho FIFA World Cup 2018 đ&atilde; được đưa ra, nhưng Mexico sau đ&oacute; đ&atilde; r&uacute;t lui, v&agrave; hồ sơ dự thầu của&nbsp;<a title=\"Indonesia\" href=\"https://vi.wikipedia.org/wiki/Indonesia\">Indonesia</a>&nbsp;đ&atilde; bị FIFA từ chối v&agrave;o th&aacute;ng 2 năm 2010 sau khi&nbsp;<a title=\"Hiệp hội b&oacute;ng đ&aacute; Indonesia\" href=\"https://vi.wikipedia.org/wiki/Hi%E1%BB%87p_h%E1%BB%99i_b%C3%B3ng_%C4%91%C3%A1_Indonesia\">Hiệp hội b&oacute;ng đ&aacute; Indonesia</a>&nbsp;kh&ocirc;ng gửi được thư Ch&iacute;nh phủ Indonesia bảo l&atilde;nh để hỗ trợ đấu thầu.<sup id=\"cite_ref-reject_51-0\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-reject-51\">[46]</a></sup>&nbsp;C&aacute;c quan chức Indonesia đ&atilde; kh&ocirc;ng loại trừ một cuộc đấu thầu cho&nbsp;<a title=\"Giải v&ocirc; địch b&oacute;ng đ&aacute; thế giới 2026\" href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2026\">FIFA World Cup 2026</a>, cho đến khi Qatar l&agrave;m chủ nh&agrave; năm 2022. Trong qu&aacute; tr&igrave;nh đấu thầu, tất cả c&aacute;c quốc gia kh&ocirc;ng thuộc UEFA dần dần r&uacute;t lại hồ sơ dự thầu năm 2018, do đ&oacute; đảm bảo rằng một quốc gia&nbsp;<a title=\"UEFA\" href=\"https://vi.wikipedia.org/wiki/UEFA\">UEFA</a>&nbsp;sẽ đăng cai World Cup 2018 v&agrave; do đ&oacute; khiến c&aacute;c quốc gia UEFA kh&ocirc;ng đủ điều kiện tham gia đấu thầu năm 2022.</p>\n<p>Cuối c&ugrave;ng, c&oacute; 5 suất l&agrave;m chủ nh&agrave; FIFA World Cup 2022:&nbsp;<a title=\"&Uacute;c\" href=\"https://vi.wikipedia.org/wiki/%C3%9Ac\">&Uacute;c</a>, Nhật Bản, Qatar, H&agrave;n Quốc v&agrave;&nbsp;<a class=\"mw-redirect\" title=\"Mỹ\" href=\"https://vi.wikipedia.org/wiki/M%E1%BB%B9\">Mỹ</a>.&nbsp;<a class=\"new\" title=\"Ủy ban điều h&agrave;nh FIFA (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=%E1%BB%A6y_ban_%C4%91i%E1%BB%81u_h%C3%A0nh_FIFA&amp;action=edit&amp;redlink=1\">Ủy ban điều h&agrave;nh FIFA</a>&nbsp;gồm 22 th&agrave;nh vi&ecirc;n đ&atilde; họp tại&nbsp;<a title=\"Z&uuml;rich\" href=\"https://vi.wikipedia.org/wiki/Z%C3%BCrich\">Z&uuml;rich</a>&nbsp;v&agrave;o ng&agrave;y 2 th&aacute;ng 12 năm 2010 để bầu chọn đội chủ nh&agrave; của cả hai giải đấu. Hai th&agrave;nh vi&ecirc;n ủy ban điều h&agrave;nh FIFA đ&atilde; bị đ&igrave;nh chỉ trước cuộc bỏ phiếu li&ecirc;n quan đến c&aacute;o buộc tham nhũng về phiếu bầu của họ. Quyết định tổ chức World Cup 2022 tại Qatar, vốn được đ&aacute;nh gi&aacute; l&agrave; c&oacute; \"rủi ro hoạt động cao\", đ&atilde; g&acirc;y ra chỉ tr&iacute;ch từ c&aacute;c nh&agrave; b&igrave;nh luận truyền th&ocirc;ng. Quyết định n&agrave;y đ&atilde; bị nhiều người chỉ tr&iacute;ch l&agrave; một phần của vụ b&ecirc; bối tham nhũng của FIFA.<sup id=\"cite_ref-52\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-52\">[47]</a></sup></p>\n<table class=\"wikitable\"><caption>Kết quả bỏ phiếu<sup id=\"cite_ref-53\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-53\">[48]</a></sup></caption>\n<tbody>\n<tr>\n<th rowspan=\"2\">Quốc gia</th>\n<th colspan=\"4\">Bỏ phiếu</th>\n</tr>\n<tr>\n<th>V&ograve;ng 1</th>\n<th>V&ograve;ng 2</th>\n<th>V&ograve;ng 3</th>\n<th>V&ograve;ng 4</th>\n</tr>\n<tr>\n<td align=\"left\"><strong><span class=\"flagicon\"><span class=\"mw-image-border\"><img class=\"mw-file-element\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/23px-Flag_of_Qatar.svg.png\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/35px-Flag_of_Qatar.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/46px-Flag_of_Qatar.svg.png 2x\" alt=\"\" width=\"23\" height=\"9\" data-file-width=\"1400\" data-file-height=\"550\"></span>&nbsp;</span>Qatar</strong></td>\n<td><strong>11</strong></td>\n<td><strong>10</strong></td>\n<td><strong>11</strong></td>\n<td class=\"table-yes\"><strong>14</strong></td>\n</tr>\n<tr>\n<td align=\"left\"><span class=\"flagicon\"><span class=\"mw-image-border\"><img class=\"mw-file-element\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/23px-Flag_of_the_United_States.svg.png\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/35px-Flag_of_the_United_States.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/46px-Flag_of_the_United_States.svg.png 2x\" alt=\"\" width=\"23\" height=\"12\" data-file-width=\"1235\" data-file-height=\"650\"></span>&nbsp;</span>Hoa Kỳ</td>\n<td>3</td>\n<td>5</td>\n<td>6</td>\n<td>8</td>\n</tr>\n<tr>\n<td align=\"left\"><span class=\"flagicon\"><span class=\"mw-image-border\"><img class=\"mw-file-element\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/23px-Flag_of_South_Korea.svg.png\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/35px-Flag_of_South_Korea.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/45px-Flag_of_South_Korea.svg.png 2x\" alt=\"\" width=\"23\" height=\"15\" data-file-width=\"900\" data-file-height=\"600\"></span>&nbsp;</span>H&agrave;n Quốc</td>\n<td>4</td>\n<td>5</td>\n<td>5</td>\n<td><em>Bị loại</em></td>\n</tr>\n<tr>\n<td align=\"left\"><span class=\"flagicon\"><span class=\"mw-image-border\"><img class=\"mw-file-element\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/23px-Flag_of_Japan.svg.png\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/35px-Flag_of_Japan.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/45px-Flag_of_Japan.svg.png 2x\" alt=\"\" width=\"23\" height=\"15\" data-file-width=\"900\" data-file-height=\"600\"></span>&nbsp;</span>Nhật Bản</td>\n<td>3</td>\n<td>2</td>\n<td colspan=\"2\"><em>Bị loại</em></td>\n</tr>\n<tr>\n<td align=\"left\"><span class=\"flagicon\"><span class=\"mw-image-border\"><img class=\"mw-file-element\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/23px-Flag_of_Australia_%28converted%29.svg.png\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/35px-Flag_of_Australia_%28converted%29.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/46px-Flag_of_Australia_%28converted%29.svg.png 2x\" alt=\"\" width=\"23\" height=\"12\" data-file-width=\"512\" data-file-height=\"256\"></span>&nbsp;</span>&Uacute;c</td>\n<td>1</td>\n<td colspan=\"3\"><em>Bị loại</em></td>\n</tr>\n<tr>\n<th align=\"left\">Tổng số bỏ phiếu</th>\n<th>22</th>\n<th>22</th>\n<th>22</th>\n<th>22</th>\n</tr>\n</tbody>\n</table>\n<p>Qatar l&agrave; quốc gia nhỏ nhất theo diện t&iacute;ch được trao đăng cai FIFA World Cup. Quốc gia nhỏ nhất theo diện t&iacute;ch tiếp theo l&agrave;&nbsp;<a title=\"Thụy Sĩ\" href=\"https://vi.wikipedia.org/wiki/Th%E1%BB%A5y_S%C4%A9\">Thụy Sĩ</a>, chủ nh&agrave; của&nbsp;<a class=\"mw-redirect\" title=\"FIFA World Cup 1954\" href=\"https://vi.wikipedia.org/wiki/FIFA_World_Cup_1954\">FIFA World Cup 1954</a>, lớn hơn Qatar gấp ba lần v&agrave; chỉ cần 16 đội đăng cai thay v&igrave; 32 đội như hiện tại.</p>\n<p>Qatar cũng trở th&agrave;nh quốc gia thứ hai (kh&ocirc;ng bao gồm&nbsp;<a title=\"Uruguay\" href=\"https://vi.wikipedia.org/wiki/Uruguay\">Uruguay</a>&nbsp;v&agrave;&nbsp;<a title=\"&Yacute;\" href=\"https://vi.wikipedia.org/wiki/%C3%9D\">&Yacute;</a>, chủ nh&agrave; của hai kỳ World Cup đầu ti&ecirc;n) được tham dự FIFA World Cup mặc d&ugrave; chưa bao giờ đủ điều kiện tham dự c&aacute;c giải đấu World Cup trước đ&oacute;, bằng chứng l&agrave;&nbsp;<a title=\"Nhật Bản\" href=\"https://vi.wikipedia.org/wiki/Nh%E1%BA%ADt_B%E1%BA%A3n\">Nhật Bản</a>&nbsp;đ&atilde; được trao quyền đồng đăng cai&nbsp;<a class=\"mw-redirect\" title=\"World Cup 2002\" href=\"https://vi.wikipedia.org/wiki/World_Cup_2002\">World Cup 2002</a>&nbsp;v&agrave;o năm 1996 m&agrave; chưa bao giờ vượt qua v&ograve;ng chung kết, d&ugrave; sau đ&oacute; họ đ&atilde; vượt qua v&ograve;ng loại&nbsp;<a class=\"mw-redirect\" title=\"World Cup 1998\" href=\"https://vi.wikipedia.org/wiki/World_Cup_1998\">World Cup 1998</a>.</p>\n<h2><span id=\"Ch.E1.BB.89_tr.C3.ADch\"></span><span id=\"Chỉ_tr&iacute;ch\" class=\"mw-headline\">Chỉ tr&iacute;ch</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a class=\"mw-editsection-visualeditor\" title=\"Sửa đổi phần &ldquo;Chỉ tr&iacute;ch&rdquo;\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;veaction=edit&amp;section=6\">sửa</a><span class=\"mw-editsection-divider\">&nbsp;|&nbsp;</span><a title=\"Sửa m&atilde; nguồn tại đề mục: Chỉ tr&iacute;ch\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;action=edit&amp;section=6\">sửa m&atilde; nguồn</a><span class=\"mw-editsection-bracket\">]</span></span></h2>\n<h3><span id=\"C.C3.A1o_bu.E1.BB.99c_tham_nh.C5.A9ng_trong_vi.E1.BB.87c_Qatar_gi.C3.A0nh_.C4.91.C6.B0.E1.BB.A3c_quy.E1.BB.81n_.C4.91.C4.83ng_cai\"></span><span id=\"C&aacute;o_buộc_tham_nhũng_trong_việc_Qatar_gi&agrave;nh_được_quyền_đăng_cai\" class=\"mw-headline\">C&aacute;o buộc tham nhũng trong việc Qatar gi&agrave;nh được quyền đăng cai</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a class=\"mw-editsection-visualeditor\" title=\"Sửa đổi phần &ldquo;C&aacute;o buộc tham nhũng trong việc Qatar gi&agrave;nh được quyền đăng cai&rdquo;\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;veaction=edit&amp;section=7\">sửa</a><span class=\"mw-editsection-divider\">&nbsp;|&nbsp;</span><a title=\"Sửa m&atilde; nguồn tại đề mục: C&aacute;o buộc tham nhũng trong việc Qatar gi&agrave;nh được quyền đăng cai\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;action=edit&amp;section=7\">sửa m&atilde; nguồn</a><span class=\"mw-editsection-bracket\">]</span></span></h3>\n<p>V&agrave;o th&aacute;ng 5 năm 2011, c&aacute;c c&aacute;o buộc tham nhũng trong nội bộ c&aacute;c quan chức cấp cao của FIFA đ&atilde; đặt ra c&acirc;u hỏi về t&iacute;nh hợp ph&aacute;p của World Cup 2022 được tổ chức tại Qatar. C&aacute;c c&aacute;o buộc tham nhũng đ&atilde; được đưa ra li&ecirc;n quan đến việc Qatar gi&agrave;nh được quyền đăng cai sự kiện n&agrave;y. Một cuộc điều tra nội bộ v&agrave; b&aacute;o c&aacute;o của FIFA đ&atilde; cho thấy Qatar về bất kỳ h&agrave;nh vi vi phạm n&agrave;o, nhưng trưởng điều tra vi&ecirc;n&nbsp;<a class=\"new\" title=\"Michael J. Garcia (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Michael_J._Garcia&amp;action=edit&amp;redlink=1\">Michael J. Garcia</a>&nbsp;kể từ đ&oacute; đ&atilde; m&ocirc; tả b&aacute;o c&aacute;o của FIFA về cuộc điều tra của &ocirc;ng l&agrave; chứa \"nhiều nội dung đại diện kh&ocirc;ng đầy đủ v&agrave; sai lầm.\"<sup id=\"cite_ref-54\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-54\">[49]</a></sup>&nbsp;V&agrave;o ng&agrave;y 27 th&aacute;ng 5 năm 2015, c&aacute;c c&ocirc;ng tố vi&ecirc;n li&ecirc;n bang Thụy Sĩ đ&atilde; mở một cuộc điều tra về tham nhũng v&agrave; rửa tiền li&ecirc;n quan đến việc đăng k&yacute; World Cup 2018 v&agrave; 2022.<sup id=\"cite_ref-55\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-55\">[50]</a></sup><sup id=\"cite_ref-56\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-56\">[51]</a></sup>&nbsp;Ng&agrave;y 6 th&aacute;ng 8 năm 2018, cựu chủ tịch FIFA&nbsp;<a title=\"Sepp Blatter\" href=\"https://vi.wikipedia.org/wiki/Sepp_Blatter\">Sepp Blatter</a>&nbsp;cho rằng Qatar đ&atilde; sử dụng \"c&aacute;c hoạt động đen\", cho rằng ban đấu thầu đ&atilde; gian lận để gi&agrave;nh được quyền đăng cai.<sup id=\"cite_ref-57\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-57\">[52]</a></sup></p>\n<h3><span id=\".C4.90.E1.BB.91i_x.E1.BB.AD_t.E1.BB.93i_t.E1.BB.87_v.E1.BB.9Bi_lao_.C4.91.E1.BB.99ng_n.C6.B0.E1.BB.9Bc_ngo.C3.A0i\"></span><span id=\"Đối_xử_tồi_tệ_với_lao_động_nước_ngo&agrave;i\" class=\"mw-headline\">Đối xử tồi tệ với lao động nước ngo&agrave;i</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a class=\"mw-editsection-visualeditor\" title=\"Sửa đổi phần &ldquo;Đối xử tồi tệ với lao động nước ngo&agrave;i&rdquo;\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;veaction=edit&amp;section=8\">sửa</a><span class=\"mw-editsection-divider\">&nbsp;|&nbsp;</span><a title=\"Sửa m&atilde; nguồn tại đề mục: Đối xử tồi tệ với lao động nước ngo&agrave;i\" href=\"https://vi.wikipedia.org/w/index.php?title=Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022&amp;action=edit&amp;section=8\">sửa m&atilde; nguồn</a><span class=\"mw-editsection-bracket\">]</span></span></h3>\n<p>Ngo&agrave;i ra, Qatar đ&atilde; phải đối mặt với chỉ tr&iacute;ch mạnh mẽ do đối xử với lao động nước ngo&agrave;i tham gia chuẩn bị cho World Cup, với việc&nbsp;<a class=\"mw-redirect\" title=\"Tổ chức &Acirc;n x&aacute; Quốc tế\" href=\"https://vi.wikipedia.org/wiki/T%E1%BB%95_ch%E1%BB%A9c_%C3%82n_x%C3%A1_Qu%E1%BB%91c_t%E1%BA%BF\">Tổ chức &Acirc;n x&aacute; Quốc tế</a>&nbsp;đề cập đến \"lao động cưỡng bức\" v&agrave; điều kiện l&agrave;m việc tồi tệ,<sup id=\"cite_ref-58\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-58\">[53]</a></sup>&nbsp;trong khi nhiều người lao động nhập cư cho biết phải trả \"ph&iacute; tuyển dụng\" qu&aacute; lớn để c&oacute; được việc l&agrave;m.<sup id=\"cite_ref-59\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-59\">[54]</a></sup>&nbsp;Một cuộc điều tra của tờ&nbsp;<em><a title=\"The Guardian\" href=\"https://vi.wikipedia.org/wiki/The_Guardian\">The Guardian</a></em>&nbsp;cho rằng nhiều c&ocirc;ng nh&acirc;n bị từ chối cung cấp thức ăn v&agrave; nước uống, bị tước giấy tờ t&ugrave;y th&acirc;n v&agrave; kh&ocirc;ng được trả lương đ&uacute;ng hạn, khiến một số người trong số họ trở th&agrave;nh n&ocirc; lệ.&nbsp;<em>The Guardian</em>&nbsp;đ&atilde; ước t&iacute;nh rằng c&oacute; tới 4.000 c&ocirc;ng nh&acirc;n c&oacute; thể thiệt mạng do thiếu an to&agrave;n v&agrave; c&aacute;c nguy&ecirc;n nh&acirc;n kh&aacute;c v&agrave;o thời điểm cuộc thi được tổ chức. Từ năm 2015 đến năm 2021, ch&iacute;nh phủ Qatar đ&atilde; th&ocirc;ng qua c&aacute;c cải c&aacute;ch lao động mới để cải thiện điều kiện l&agrave;m việc, bao gồm mức lương tối thiểu cho tất cả người lao động v&agrave; loại bỏ hệ thống kafala. Tuy nhi&ecirc;n, theo Tổ chức &Acirc;n x&aacute; Quốc tế, điều kiện sống v&agrave; l&agrave;m việc của người lao động nước ngo&agrave;i kh&ocirc;ng được cải thiện trong những năm trở lại đ&acirc;y.<sup id=\"cite_ref-60\" class=\"reference\"><a href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_v%C3%B4_%C4%91%E1%BB%8Bch_b%C3%B3ng_%C4%91%C3%A1_th%E1%BA%BF_gi%E1%BB%9Bi_2022#cite_note-60\">[55]</a></sup></p>', '2024-04-22', 'mô tả giải đấu 1', 'giải đấu 1', 3, b'1'),
(3, '2024-05-26', '<p>nội dung thi đấu</p>', '2024-05-10', 'Đăng ký đến ngày 20-5', 'giải đấu 2', 3, b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tournament_athlete`
--

CREATE TABLE `tournament_athlete` (
  `id` bigint NOT NULL,
  `accepted` bit(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `athlete_id` bigint DEFAULT NULL,
  `tournament_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tournament_athlete`
--

INSERT INTO `tournament_athlete` (`id`, `accepted`, `created_date`, `result`, `athlete_id`, `tournament_id`) VALUES
(4, b'1', '2024-05-10', 'giải khuyến kích', 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `actived` bit(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `link_contract` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `actived`, `address`, `avatar`, `created_date`, `email`, `full_name`, `gender`, `link_contract`, `password`, `phone`, `role`) VALUES
(1, b'1', 'Hà Nội', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1713745950/ufnwfdj7af0xjroyyhpi.png', '2024-04-21', 'admin@gmail.com', 'ADMIN', 'Nam', NULL, 'admin', '0932647823', 'ROLE_ADMIN'),
(2, b'1', 'Hà nội', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1713697324/ilhbh2viif7enfvucdsf.jpg', '2024-04-21', 'dev002102@gmail.com', 'Quản trị viên', 'Nữ', '', 'HyZBuPp', '093284743', 'ROLE_ADMIN'),
(3, b'1', 'Hà nội', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1713745843/jnn2zfw6jljbg7kidij5.webp', '2024-04-22', 'hieutran2102000@gmail.com', 'Hoàng Thị Hoài', 'Nam', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1713745843/jnn2zfw6jljbg7kidij5.webp', '12345', '0923748334', 'ROLE_COACH'),
(4, b'1', 'Hà nội', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1713746084/kronuq9w9ox3tjmibhfz.jpg', '2024-04-22', 'vnua.edu.hieu0210@gmail.com', 'Lê Anh Tú', 'Nam', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1713746084/kronuq9w9ox3tjmibhfz.jpg', 'wJreYAE', '0335789448', 'ROLE_EXPERT'),
(5, b'1', 'Hà Nam', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1713761171/b0evq04anjsnh1ntgyvh.webp', '2024-04-22', 'hieuvnua1@gmail.com', 'Lê hoàng tú', 'Nam', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1713761171/b0evq04anjsnh1ntgyvh.webp', '12345', '0932478234', 'ROLE_ATHLETE'),
(8, b'1', 'Hà nội', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1713869972/hcxp1bu8tns1b27xrrpv.jpg', '2024-04-23', 'hoainam@gmail.com', 'Trần hoài nam', 'Nam', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1713869972/hcxp1bu8tns1b27xrrpv.jpg', 'GPSJuvk', '09832472834', 'ROLE_ATHLETE');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `athlete`
--
ALTER TABLE `athlete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgufi9jmp7ouu8yvm9l09ydxke` (`coach`),
  ADD KEY `FK67h54mjt5ot7w9tnlaai7ulvm` (`specialize_id`),
  ADD KEY `FK38jbdwdjm2mw1gsu9ohtxvy7s` (`user_id`);

--
-- Chỉ mục cho bảng `athlete_history`
--
ALTER TABLE `athlete_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK52r20pxcrsicusquu53xg36x` (`athlete_id`);

--
-- Chỉ mục cho bảng `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKo6uww6pr3yf70alt0y1icwkjl` (`user_id`);

--
-- Chỉ mục cho bảng `exercise_schedule`
--
ALTER TABLE `exercise_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6b7fqeojul2l60cvb4fymkduc` (`exercise_id`),
  ADD KEY `FK8qo4ht85w3ucmouwa5ef2st3g` (`schedule_id`);

--
-- Chỉ mục cho bảng `injuries`
--
ALTER TABLE `injuries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqsi7883k3oh2q1lj8gdpxngce` (`athlete_id`);

--
-- Chỉ mục cho bảng `physical_exam`
--
ALTER TABLE `physical_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4lx7g1hs8ee4y09ra0g8nhhu2` (`athlete_id`),
  ADD KEY `FK69ousnvo8fqs926g7kvsi3rnq` (`sports_expert`);

--
-- Chỉ mục cho bảng `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrbcdumlxcegj2sullxqduixrc` (`athlete_id`);

--
-- Chỉ mục cho bảng `revenue_expenditure`
--
ALTER TABLE `revenue_expenditure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKswt482ce62g225ollmak7bkk8` (`user_id`);

--
-- Chỉ mục cho bảng `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3gyih3st9kuw8i8bnyirwhtvs` (`athlete_id`),
  ADD KEY `FK9ueug91dogf1plr6dr3hu57sd` (`plan_id`);

--
-- Chỉ mục cho bảng `specialize`
--
ALTER TABLE `specialize`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tournament`
--
ALTER TABLE `tournament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8h6bv2jp2x2nik2d7if71mtbp` (`specialize_id`);

--
-- Chỉ mục cho bảng `tournament_athlete`
--
ALTER TABLE `tournament_athlete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrhsl3cqotdajv0ittdueylgkd` (`athlete_id`),
  ADD KEY `FKkg4no2gffhdmlit7hh2g0fm4` (`tournament_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `athlete`
--
ALTER TABLE `athlete`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `athlete_history`
--
ALTER TABLE `athlete_history`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `exercise`
--
ALTER TABLE `exercise`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `exercise_schedule`
--
ALTER TABLE `exercise_schedule`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `injuries`
--
ALTER TABLE `injuries`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `physical_exam`
--
ALTER TABLE `physical_exam`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `plan`
--
ALTER TABLE `plan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `revenue_expenditure`
--
ALTER TABLE `revenue_expenditure`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `specialize`
--
ALTER TABLE `specialize`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tournament`
--
ALTER TABLE `tournament`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tournament_athlete`
--
ALTER TABLE `tournament_athlete`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `athlete`
--
ALTER TABLE `athlete`
  ADD CONSTRAINT `FK38jbdwdjm2mw1gsu9ohtxvy7s` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK67h54mjt5ot7w9tnlaai7ulvm` FOREIGN KEY (`specialize_id`) REFERENCES `specialize` (`id`),
  ADD CONSTRAINT `FKgufi9jmp7ouu8yvm9l09ydxke` FOREIGN KEY (`coach`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `athlete_history`
--
ALTER TABLE `athlete_history`
  ADD CONSTRAINT `FK52r20pxcrsicusquu53xg36x` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`);

--
-- Các ràng buộc cho bảng `exercise`
--
ALTER TABLE `exercise`
  ADD CONSTRAINT `FKo6uww6pr3yf70alt0y1icwkjl` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `exercise_schedule`
--
ALTER TABLE `exercise_schedule`
  ADD CONSTRAINT `FK6b7fqeojul2l60cvb4fymkduc` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`id`),
  ADD CONSTRAINT `FK8qo4ht85w3ucmouwa5ef2st3g` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`);

--
-- Các ràng buộc cho bảng `injuries`
--
ALTER TABLE `injuries`
  ADD CONSTRAINT `FKqsi7883k3oh2q1lj8gdpxngce` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`);

--
-- Các ràng buộc cho bảng `physical_exam`
--
ALTER TABLE `physical_exam`
  ADD CONSTRAINT `FK4lx7g1hs8ee4y09ra0g8nhhu2` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`),
  ADD CONSTRAINT `FK69ousnvo8fqs926g7kvsi3rnq` FOREIGN KEY (`sports_expert`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `FKrbcdumlxcegj2sullxqduixrc` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`);

--
-- Các ràng buộc cho bảng `revenue_expenditure`
--
ALTER TABLE `revenue_expenditure`
  ADD CONSTRAINT `FKswt482ce62g225ollmak7bkk8` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `FK3gyih3st9kuw8i8bnyirwhtvs` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`),
  ADD CONSTRAINT `FK9ueug91dogf1plr6dr3hu57sd` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`);

--
-- Các ràng buộc cho bảng `tournament`
--
ALTER TABLE `tournament`
  ADD CONSTRAINT `FK8h6bv2jp2x2nik2d7if71mtbp` FOREIGN KEY (`specialize_id`) REFERENCES `specialize` (`id`);

--
-- Các ràng buộc cho bảng `tournament_athlete`
--
ALTER TABLE `tournament_athlete`
  ADD CONSTRAINT `FKkg4no2gffhdmlit7hh2g0fm4` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`id`),
  ADD CONSTRAINT `FKrhsl3cqotdajv0ittdueylgkd` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
