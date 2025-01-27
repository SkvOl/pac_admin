-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Янв 26 2025 г., 13:20
-- Версия сервера: 10.11.10-MariaDB-ubu2204
-- Версия PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pac`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cabins`
--

CREATE TABLE `cabins` (
  `id` bigint(20) NOT NULL,
  `ship_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `number` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `cabins`
--

INSERT INTO `cabins` (`id`, `ship_id`, `category_id`, `number`) VALUES
(1, 1, 5, 1),
(2, 1, 6, 2),
(3, 1, 7, 3),
(4, 1, 8, 4),
(5, 2, 9, 1),
(6, 2, 10, 2),
(7, 2, 11, 3),
(8, 3, 12, 4),
(9, 3, 1, 1),
(10, 3, 2, 2),
(11, 3, 3, 3),
(12, 3, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `cabin_categories`
--

CREATE TABLE `cabin_categories` (
  `id` int(11) NOT NULL,
  `ship_id` int(11) NOT NULL,
  `vendor_code` varchar(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` enum('Inside','Ocean view','Balcony','Suite') DEFAULT NULL,
  `description` text NOT NULL,
  `photos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`photos`)),
  `ordering` int(11) NOT NULL DEFAULT 9999,
  `state` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `cabin_categories`
--

INSERT INTO `cabin_categories` (`id`, `ship_id`, `vendor_code`, `title`, `type`, `description`, `photos`, `ordering`, `state`) VALUES
(1, 3, 'IB', 'Каюта без окна', 'Inside', '<p>Гарантирована каюта без окна. <br>Номер каюты будет известен только перед началом круиза.</p><h5>Размещение</h5><ul><li>Возможно 2-, 3- и 4-местное размещение. </li><li>Основные спальные места: две кровати, поставленные вместе или раздельно по вашему желанию. </li><li>Дополнительные спальные места: откидные кровати над основными спальными местами.</li></ul><h5>В каюте</h5><ul><li>Каюта без окна.</li><li>Ванная комната с душем.</li><li>Интерактивное TV, телефон, фен, мини-бар, сейф, кондиционер.</li><li>Беспроводной Интернет (оплачивается дополнительно).</li></ul>', '[]', 10, 1),
(2, 3, 'BM1', 'Каюта с балконом Junior', 'Balcony', '<h5>Размещение</h5><ul><li>Возможно 2- и 3-местное размещение.</li><li>Основные спальные места: две кровати, поставленные вместе или раздельно по вашему желанию.</li><li>Дополнительные спальные места:  откидная кровать над основными спальными местами.</li></ul><h5>В каюте</h5><ul><li>Балкон.</li><li>Ванная комната с душем.</li><li>Интерактивное TV, телефон, фен, мини-бар, сейф, кондиционер.</li><li>Беспроводной Интернет (оплачивается дополнительно).</li></ul>', '[\"https://img.pac.ru/cruise/ships_gallery/Armonia/B2/MSC15004615.jpg\"]', 220, 1),
(3, 3, 'IM1', 'Каюта без окна Junior', 'Inside', '<h5>Размещение</h5><ul><li>Возможно 2-, 3- и 4-местное размещение. </li><li>Основные спальные места: две кровати, поставленные вместе или раздельно по вашему желанию.</li><li>Дополнительные спальные места: откидные кровати над основными спальными местами.</li></ul><h5>В каюте</h5><ul><li>Каюта без окна.</li><li>Ванная комната с душем.</li><li>Интерактивное TV, телефон, фен, мини-бар, сейф, кондиционер.</li><li>Беспроводной Интернет (оплачивается дополнительно).</li></ul>', '[\"https://img.pac.ru/cruise/ships_gallery/Armonia/I1/MSC14002043.jpg\"]', 30, 1),
(4, 3, 'IM2', 'Каюта без окна Junior', 'Inside', '<h5>Размещение</h5><ul><li>Возможно 2-, 3- и 4-местное размещение. </li><li>Основные спальные места: две кровати, поставленные вместе или раздельно по вашему желанию.</li><li>Дополнительные спальные места: откидные кровати над основными спальными местами.</li></ul><h5>В каюте</h5><ul><li>Каюта без окна.</li><li>Ванная комната с душем.</li><li>Интерактивное TV, телефон, фен, мини-бар, сейф, кондиционер.</li><li>Беспроводной Интернет (оплачивается дополнительно).</li></ul>', '[\"https://img.pac.ru/cruise/ships_gallery/Armonia/I1/MSC14002043.jpg\"]', 40, 1),
(5, 1, 'BA', 'Каюта с балконом', 'Balcony', '<h5>Площадь</h5>\n<p>Около 17–21 м<sup>2</sup> (включая балкон).</p>\n<h5>Размещение</h5>\n<ul>\n<li>Возможно 2-, 3- и 4-местное размещение.</li>\n<li>Основные спальные места: две кровати, поставленные вместе или раздельно по вашему желанию.</li>\n<li>Дополнительные спальные места:  раскладной диван, откидная кровать над диваном.</li>\n</ul>\n<h5>В каюте</h5>\n<ul>\n<li>Балкон.</li>\n<li>Ванная комната с душем.</li>\n<li>Интерактивное TV, телефон, фен, мини-бар, сейф, кондиционер.</li>\n<li>Беспроводной Интернет (оплачивается дополнительно).</li>\n</ul>', '[\"https://img.pac.ru/cruise/ships_gallery/Musica/B2/MSC18015873.jpg\"]', 360, 1),
(6, 1, 'BL1', 'Каюта с балконом Premium', 'Balcony', '<h5>Площадь</h5>\r\n<p>Около 17–21 м<sup>2</sup> (включая балкон).</p>\r\n<h5>Размещение</h5>\r\n<ul>\r\n<li>Возможно 2-, 3- и 4-местное размещение.</li>\r\n<li>Основные спальные места: две кровати, поставленные вместе или раздельно по вашему желанию.</li>\r\n<li>Дополнительные спальные места:  раскладной диван, откидная кровать над диваном.</li>\r\n</ul>\r\n<h5>В каюте</h5>\r\n<ul>\r\n<li>Балкон.</li>\r\n<li>Ванная комната с душем.</li>\r\n<li>Интерактивное TV, телефон, фен, мини-бар, сейф, кондиционер.</li>\r\n<li>Беспроводной Интернет (оплачивается дополнительно).</li>\r\n</ul>', '[\"https://img.pac.ru/cruise/ships_gallery/Musica/B2/MSC18015873.jpg\"]', 330, 1),
(7, 1, 'BL2', 'Каюта с балконом Premium', 'Balcony', '<h5>Площадь</h5>\r\n<p>Около 17–21 м<sup>2</sup> (включая балкон).</p>\r\n<h5>Размещение</h5>\r\n<ul>\r\n<li>Возможно 2-, 3- и 4-местное размещение.</li>\r\n<li>Основные спальные места: две кровати, поставленные вместе или раздельно по вашему желанию.</li>\r\n<li>Дополнительные спальные места:  раскладной диван, откидная кровать над диваном.</li>\r\n</ul>\r\n<h5>В каюте</h5>\r\n<ul>\r\n<li>Балкон.</li>\r\n<li>Ванная комната с душем.</li>\r\n<li>Интерактивное TV, телефон, фен, мини-бар, сейф, кондиционер.</li>\r\n<li>Беспроводной Интернет (оплачивается дополнительно).</li>\r\n</ul>', '[\"https://img.pac.ru/cruise/ships_gallery/Musica/B2/MSC18015873.jpg\"]', 340, 1),
(8, 1, 'BP', 'Каюта с балконом c ограниченным видом Deluxe', 'Inside', '<h5>Площадь</h5>\n<p>Около 17–21 м<sup>2</sup> (включая балкон).</p>\n<h5>Размещение</h5>\n<ul>\n<li>Возможно 2-, 3- и 4-местное размещение.</li>\n<li>Основные спальные места: две кровати, поставленные вместе или раздельно по вашему желанию.</li>\n<li>Дополнительные спальные места:  раскладной диван, откидная кровать над диваном.</li>\n</ul>\n<h5>В каюте</h5>\n<ul>\n<li>Балкон.</li>\n<li>Ванная комната с душем.</li>\n<li>Интерактивное TV, телефон, фен, мини-бар, сейф, кондиционер.</li>\n<li>Беспроводной Интернет (оплачивается дополнительно).</li>\n</ul>', '[\"https://img.pac.ru/cruise/ships_gallery/Musica/B2/MSC18015873.jpg\",\"https://img.pac.ru/cruise/ships_gallery/Orchestra/B2/MSC18015860.jpg\"]', 320, 1),
(9, 2, 'BB', 'Каюта с балконом', 'Balcony', '', '[]', 200, 1),
(10, 2, 'BA', 'Каюта с балконом', 'Balcony', '<h5>Площадь</h5>\r\n<p>Около 15–17 м<sup>2</sup> (включая балкон).</p>\r\n<h5>Размещение</h5>\r\n<ul>\r\n<li>Возможно 2-, 3- и 4-местное размещение.</li>\r\n<li>Основные спальные места: две кровати, поставленные вместе или раздельно по вашему желанию.</li>\r\n<li>Дополнительные спальные места:  раскладной диван, откидная кровать над диваном.</li>\r\n</ul>\r\n<h5>В каюте</h5>\r\n<ul>\r\n<li>Балкон.</li>\r\n<li>Ванная комната с душем.</li>\r\n<li>Интерактивное TV, телефон, фен, мини-бар, сейф, кондиционер.</li>\r\n<li>Беспроводной Интернет (оплачивается дополнительно).</li>\r\n</ul>', '[\"https://img.pac.ru/cruise/ships_gallery/Musica/B2/MSC18015873.jpg\", \"https://img.pac.ru/cruise/ships_gallery/Orchestra/B2/MSC18015860.jpg\", \"https://img.pac.ru/cruise/ships_gallery/Musica/centralnyy-holl-i-resepshn-3.jpg\"]', 360, 1),
(11, 2, 'BL1', 'Каюта с балконом Premium', 'Balcony', '<h5>Площадь</h5>\r\n<p>Около 15–17 м<sup>2</sup> (включая балкон).</p>\r\n<h5>Размещение</h5>\r\n<ul>\r\n<li>Возможно 2-, 3- и 4-местное размещение.</li>\r\n<li>Основные спальные места: две кровати, поставленные вместе или раздельно по вашему желанию.</li>\r\n<li>Дополнительные спальные места:  раскладной диван, откидная кровать над диваном.</li>\r\n</ul>\r\n<h5>В каюте</h5>\r\n<ul>\r\n<li>Балкон.</li>\r\n<li>Ванная комната с душем.</li>\r\n<li>Интерактивное TV, телефон, фен, мини-бар, сейф, кондиционер.</li>\r\n<li>Беспроводной Интернет (оплачивается дополнительно).</li>\r\n</ul>', '[\"https://img.pac.ru/cruise/ships_gallery/Orchestra/B2/MSC18015860.jpg\"]', 330, 1),
(12, 2, 'BL2', 'Каюта с балконом Premium', 'Balcony', '<h5>Площадь</h5>\r\n<p>Около 15–17 м<sup>2</sup> (включая балкон).</p>\r\n<h5>Размещение</h5>\r\n<ul>\r\n<li>Возможно 2-, 3- и 4-местное размещение.</li>\r\n<li>Основные спальные места: две кровати, поставленные вместе или раздельно по вашему желанию.</li>\r\n<li>Дополнительные спальные места:  раскладной диван, откидная кровать над диваном.</li>\r\n</ul>\r\n<h5>В каюте</h5>\r\n<ul>\r\n<li>Балкон.</li>\r\n<li>Ванная комната с душем.</li>\r\n<li>Интерактивное TV, телефон, фен, мини-бар, сейф, кондиционер.</li>\r\n<li>Беспроводной Интернет (оплачивается дополнительно).</li>\r\n</ul>', '[\"https://img.pac.ru/cruise/ships_gallery/Orchestra/B2/MSC18015860.jpg\"]', 340, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ships`
--

CREATE TABLE `ships` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `spec` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 9999,
  `state` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `ships`
--

INSERT INTO `ships` (`id`, `title`, `spec`, `description`, `ordering`, `state`) VALUES
(1, 'MSC Musica', '[{\"name\":\"Год постройки\",\"value\":\"2006\"},{\"name\":\"Водоизмещение\",\"value\":\"89 600 тонн\"},{\"name\":\"Длина\",\"value\":\"293,8 м\"},{\"name\":\"Ширина\",\"value\":\"32,2 м\"},{\"name\":\"Количество палуб\",\"value\":\"16\"},{\"name\":\"Скорость (макс.)\",\"value\":\"23 узла\"},{\"name\":\"Каюты\",\"value\":\"1275\"},{\"name\":\"Пассажиры\",\"value\":\"2550\"},{\"name\":\"Пассажиры (макс.)\",\"value\":\"3013\"},{\"name\":\"Экипаж\",\"value\":\"987\"},{\"name\":\"Стабилизаторы качки\",\"value\":\"Есть\"}]', '<p style=\"text-align: justify;\">Роскошный круизный лайнер – MSC Musica построен в 2006 г. Он прекрасно оборудован, оснащен современной навигационной техникой, впечатляет своим нарядными богатыми и элегантными интерьерами, которые украшают золотая лестница и трехуровневый фонтан в центральном фойе, прозрачное пианино, парящее на прозрачному полу над бассейном. Здесь все продумано до мелочей, чтобы гости в полной мере могли наслаждаться отдыхом, так большинство кают на MSC Musica оснащено балконами, что делает удовольствие от морского путешествия еще больше. Жизнь на борту устроена с городским комфортом: здесь есть магазины, рестораны, казино, ночные заведения, фитнес-центр, превосходный SPA, бассейны, спортплощадки и многое другое. Пассажиры разного возраста легко смогут найти себе на лайнере развлечение по душе: вечерние шоу в театре, дегустации вин, игры в помещении и на открытом воздухе, клубы для детей и подростков и т.д. Каждая минута, проведенная на MSC Musica, станет незабываемой!</p>\n<p><a target=\"_blank\" href=\"https://www.pac.ru/help/cruise/msc-cruises/msc-faq/faq-msc/0360-services/\">Контактный телефон лайнера</a></p>', 13, 1),
(2, 'MSC Orchestra', '[{\"name\": \"Год постройки\", \"value\": \"2007\"}, {\"name\": \"Водоизмещение\", \"value\": \"89 600 тонн\"}, {\"name\": \"Длина\", \"value\": \"293,8 м\"}, {\"name\": \"Ширина\", \"value\": \"32,2 м\"}, {\"name\": \"Количество палуб\", \"value\": \"16\"}, {\"name\": \"Скорость (макс.)\", \"value\": \"23 узла\"}, {\"name\": \"Каюты\", \"value\": \"1275\"}, {\"name\": \"Пассажиры\", \"value\": \"2550\"}, {\"name\": \"Пассажиры (макс.)\", \"value\": \"3013\"}, {\"name\": \"Экипаж\", \"value\": \"987\"}, {\"name\": \"Стабилизаторы качки\", \"value\": \"Есть\"}]', '<p style=\"text-align: justify;\">Великолепный круизный лайнер MSC Orchestra, построенный в 2007 году, обещает пассажирам круиз мечты! Этот роскошный корабль прекрасно оборудован и оснащен современной навигационной техникой, на его борту достаточно возможностей и развлечений, чтобы каждый пассажир мог в полной мере наслаждаться морским путешествием. Для желающих расслабиться есть просторные палубы, где можно позагорать на солнце, или превосходный Spa с турецкими банями, саунами и множеством массажей. Для активных гостей на судне есть спортивный центр с тренажерным залом, бассейны, даже беговая дорожка на открытом воздухе. Гурманам MSC Orchestra подарит истинное кулинарное наслаждение: в ее ресторанах можно отведать превосходные блюда, например, настоящие китайские димсам или лучшую пиццу за пределами Неаполя. Поклонников веселого досуга ждут танцы под живую музыку, казино, захватывающие шоу во впечатляющем театре. А дети и подростки смогут отлично провести время в игровой зоне и клубе Teen’s Club.</p>\r\n<p style=\"text-align: justify;\"><a target=\"_blank\" href=\"https://www.pac.ru/help/cruise/msc-cruises/msc-faq/faq-msc/0360-services/\">Контактный телефон лайнера</a></p>\r\n', 12, 1),
(3, 'MSC Armonia', '[{\"name\": \"Год постройки\", \"value\": \"2004\"}, {\"name\": \"Год реновации\", \"value\": \"2014\"}, {\"name\": \"Водоизмещение\", \"value\": \"65542 тонн\"}, {\"name\": \"Длина\", \"value\": \"274,9 м\"}, {\"name\": \"Ширина\", \"value\": \"32 м\"}, {\"name\": \"Количество палуб\", \"value\": \"13\"}, {\"name\": \"Скорость (макс.)\", \"value\": \"20,1 узел\"}, {\"name\": \"Каюты\", \"value\": \"976\"}, {\"name\": \"Пассажиры (макс.)\", \"value\": \"2679\"}, {\"name\": \"Стабилизаторы качки\", \"value\": \"есть\"}]', '<p>Еще до того как MSC Armonia начнет свое плавание, вы уже отправитесь в путешествие, полное открытий, едва ступив на ее борт. В этом прекрасном лайнере в совершенной гармонии сочетаются все ключевые составляющие, необходимые для счастливого круизного отдыха: безупречный стиль, новаторский дизайн, роскошные современные интерьеры, последние технические новинки, комфортабельные уютные каюты и масса всевозможных развлечений на любой вкус и возраст. В конце 2014 года корабль был полностью реновирован, стал на 24 метра длиннее, получил новые каюты и еще больше возможностей для удовлетворения любых потребностей пассажиров. Сейчас к их услугам на борту несколько ресторанов с отличной кухней, многочисленные бары, бассейны, салон красоты, казино, театр, спортплощадки, целая торговая улица и даже поле для мини-гольфа. Для взрослых на MSC Armonia есть сверкающий огнями музыкально-танцевальный лаунж, великолепный Aurea Spa с большим выбором процедур и массажей. А для детей и юных пассажиров – клубы по интересам, игровые площадки, созданные в партнерстве со знаменитыми брендами Chicco, LEGO и Namco, и захватывающий Спрей-парк с водными аттракционами. Во время круиза гости могут принимать участие в различных морских вечеринках, кулинарных сражениях, танцевальных батлах, викторинах, конкурсах, творческих мастер-классах и водных играх. Благодаря не слишком большим размером MSC Armonia может заходить в бухты, недоступные огромным круизным лайнерам. В частности это один из четырех кораблей флота MSC Cruises, способных причаливать к собственному острову MSC Cruises на Багамах – Ocean Cay MSC Marine Reserve.</p>\n<p style=\"text-align: justify;\"><a href=\"https://www.pac.ru/help/cruise/msc-cruises/msc-faq/0490-contact/\">Контактный телефон лайнера</a></p>\n', 20, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ships_gallery`
--

CREATE TABLE `ships_gallery` (
  `id` int(11) NOT NULL,
  `ship_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `ordering` smallint(6) NOT NULL DEFAULT 999
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `ships_gallery`
--

INSERT INTO `ships_gallery` (`id`, `ship_id`, `title`, `url`, `ordering`) VALUES
(1, 1, 'MSC Musica', 'https://img.pac.ru/cruise/ships_gallery/Musica/msc-musica-1.jpg', 1),
(2, 1, 'MSC Musica', 'https://img.pac.ru/cruise/ships_gallery/Musica/msc-musica-2.jpg', 2),
(3, 1, 'Центральный холл и ресепшн', 'https://img.pac.ru/cruise/ships_gallery/Musica/centralnyy-holl-i-resepshn-3.jpg', 3),
(4, 1, 'Экскурсионное бюро', 'https://img.pac.ru/cruise/ships_gallery/Musica/ekskursionnoe-byuro-4.jpg', 4),
(5, 1, 'Основной ресторан Le Maxim\'s', 'https://img.pac.ru/cruise/ships_gallery/Musica/osnovnoy-restoran-le-maxim-s-5.jpg', 5),
(6, 2, 'MSC Orchestra', 'https://img.pac.ru/cruise/ships_gallery/Orchestra/msc-orchestra-1.jpg', 1),
(7, 2, 'MSC Orchestra', 'https://img.pac.ru/cruise/ships_gallery/Orchestra/msc-orchestra-2.jpg', 2),
(8, 2, 'Центральный холл и ресепшн', 'https://img.pac.ru/cruise/ships_gallery/Orchestra/centralnyy-holl-i-resepshn-3.jpg', 3),
(9, 2, 'Ресепшн', 'https://img.pac.ru/cruise/ships_gallery/Orchestra/resepshn-4.jpg', 4),
(10, 2, 'Экскурсионное бюро', 'https://img.pac.ru/cruise/ships_gallery/Orchestra/ekskursionnoe-byuro-5.jpg', 5),
(11, 3, 'MSC Armonia', 'https://img.pac.ru/cruise/ships_gallery/Armonia/msc-armonia-1.jpg', 1),
(12, 3, 'MSC Armonia', 'https://img.pac.ru/cruise/ships_gallery/Armonia/msc-armonia-2.jpg', 2),
(13, 3, 'Ресепшн', 'https://img.pac.ru/cruise/ships_gallery/Armonia/resepshn-3.jpg', 3),
(14, 3, 'Основной ресторан Marco Polo', 'https://img.pac.ru/cruise/ships_gallery/Armonia/osnovnoy-restoran-marco-polo-4.jpg', 4),
(15, 3, 'Основной ресторан Marco Polo', 'https://img.pac.ru/cruise/ships_gallery/Armonia/osnovnoy-restoran-marco-polo-5.jpg', 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cabins`
--
ALTER TABLE `cabins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ship_id` (`ship_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `cabin_categories`
--
ALTER TABLE `cabin_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ship_id` (`ship_id`,`vendor_code`),
  ADD KEY `ship_id_2` (`ship_id`);

--
-- Индексы таблицы `ships`
--
ALTER TABLE `ships`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ships_gallery`
--
ALTER TABLE `ships_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ship_id` (`ship_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cabins`
--
ALTER TABLE `cabins`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `cabin_categories`
--
ALTER TABLE `cabin_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `ships`
--
ALTER TABLE `ships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `ships_gallery`
--
ALTER TABLE `ships_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cabins`
--
ALTER TABLE `cabins`
  ADD CONSTRAINT `cabins_ibfk_1` FOREIGN KEY (`ship_id`) REFERENCES `ships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cabins_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `cabin_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `cabin_categories`
--
ALTER TABLE `cabin_categories`
  ADD CONSTRAINT `cabin_categories_ibfk_1` FOREIGN KEY (`ship_id`) REFERENCES `ships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ships_gallery`
--
ALTER TABLE `ships_gallery`
  ADD CONSTRAINT `ships_gallery_ibfk_1` FOREIGN KEY (`ship_id`) REFERENCES `ships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
