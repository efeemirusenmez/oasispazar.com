-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 94.138.202.5
-- Üretim Zamanı: 05 Haz 2024, 15:06:12
-- Sunucu sürümü: 10.5.16-MariaDB-cll-lve
-- PHP Sürümü: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `Kayit`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cart`
--

CREATE TABLE `cart` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `pid` int(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(39, 11, 22, 'İki Bölmeli Öğle Yemeği Çantası 30x16x28', '55', '1', 'pro2.webp'),
(40, 11, 25, 'Soğutucu çanta 36x26x30cm', '42', '1', 'pro3webp.webp'),
(44, 8, 24, 'Çift bölmeli öğle yemeği çantası 30x20x24', '45', '1', 'pro1.webp'),
(45, 18, 24, 'Çift bölmeli öğle yemeği çantası 30x20x24', '45', '1', 'pro1.webp'),
(46, 18, 27, 'Günlük kullanıma yönelik yalıtım desenli çanta– 45x15x33', '75', '1', 'pro5.webp'),
(47, 18, 30, 'Yalıtımlı öğle yemeği çantaları – 26x10x17', '50', '1', 'pro8.webp'),
(48, 15, 25, 'Soğutucu çanta 36x26x30cm', '42', '1', 'pro3.webp');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `message`
--

CREATE TABLE `message` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(10, 8, 'ipek', 'ipek@gmail.com', '0532000000', 'lorem ipeum'),
(11, 8, 'metin', 'usenmez77@gmail.com', '0532000000', 'tıurjfıo4ejrkıo4 4oneroıj4oıer 4ıoejroı4jro'),
(13, 11, 'tarık', 'tarikkadiro@gmail.com', '0532000000', 'selam'),
(14, 14, 'metin', 'metin@gmail.com', '0532000000', 'emir mesaj');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `total_products` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `total_price` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `placed_on` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(10, 6, 'efe emir', '0532000000', 'efemirusenmez@gmail.com', 'cradit card', 'flat no. ataköy,fyguhıjokjuhgyutrtderftgyhujn ctr6df7g8h9j0k,türkiye,Vakıfbank,Türkiye,34158', '', '634', '24-Apr-2024', 'pending'),
(11, 15, 'Mehmet Emre Yılmaz', '5551273', 'oemrs.elim.gure@gmağil.com', 'cash on delivery', 'flat no. Oruçreis Mahallesi Tekstilkent Caddesi Teksiltkent Sitesi B10 Blok No:10Z İç Kapı No:209(56) Esenler/İstanbul,,Esenler,İstanbul,Türkiye,(531) 993 68 05', '', '45', '31-May-2024', 'pending');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `product_detail` varchar(1000) NOT NULL,
  `image` varchar(255) NOT NULL,
  `variation` enum('yes','no') DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `product_detail`, `image`, `variation`) VALUES
(22, 'İki Bölmeli Öğle Yemeği Çantası 30x16x28', '55', 'Max Teddy siyah çanta içecek, meyve, yiyecek, atıştırmalık, cep telefonu vb. tüm ihtiyaçlarınız için kullanılabilir.', 'pro2.webp', 'no'),
(24, 'Çift bölmeli öğle yemeği çantası 30x20x24', '45', 'Yiyecek ve içeceklerinizin soğuk veya sıcak kalmasını sağlar.\r\nHafif ve taşınabilir\r\nÇift katlı öğle yemeği soğutucu çantası\r\nSıcak ve soğuk yiyecekleri iki yalıtımlı bölmede ayrı ayrı paketleyebilirsiniz. Alt bölme mutfak eşyaları ve içecekler için idealdir. Üst bölme meyve ve atıştırmalıkları soğuk tutmak için mükemmeldir.', 'pro1.webp', 'no'),
(25, 'Soğutucu çanta 36x26x30cm', '42', 'İki yönlü fermuar,yuvarlatılmış köşeler = fermuar tek hareketle açılabilir\r\nÖzellikle soğutulmuş veya dondurulmuş ürünler için yüksek kaliteli soğutma torbası\r\n', 'pro3.webp', 'no'),
(26, 'Yalıtımlı Spor Çanta – 60x25x27', '120', 'Eşyalarınızı rahatça ayırmanız için ayrı bölmelere sahip geniş spor çantası.2 kulp sayesinde taşıması kolay.\r\nMinimum ısı köprüleriyle yüksek yalıtım kalitesi.', 'pro4.webp', 'no'),
(27, 'Günlük kullanıma yönelik yalıtım desenli çanta– 45x15x33', '75', 'Bu ürün yiyecek ve içeceklerinizi serin tutmak için tasarlanmıştır.\r\nYeniden kullanılabilir çantalarımız büyük alışveriş siparişleri, günlük geziler, piknik, öğle yemeği, atıştırmalıklar, dondurulmuş yiyecekler, soğuk içecekler için mükemmeldir.', 'pro5.webp', 'no'),
(28, 'Soğutucu çanta gri 36x26x30cm', '45', 'İki yönlü fermuar özellikle soğutulmuş veya dondurulmuş ürünler için yüksek kaliteli soğutma torbası', 'pro6.webp', 'no'),
(29, 'Soğutucu çanta 53x24x26', '110', 'Egzersiz sırasında ihtiyacınız olan her şeyi yanınıza almanız için ayrı bölmelere sahip geniş, yalıtımlı spor çantası spor çantasının içi ısı yalıtımlı olduğundan içecekleriniz gün boyu soğuk veya sıcak kalır.', 'pro7.webp', 'no'),
(30, 'Yalıtımlı öğle yemeği çantaları – 26x10x17', '50', 'Max Teddy tarafından üretilen makyaj, ilaç veya yiyecek için benzersiz yalıtımlı el çantası, sıcaklığın önce geldiği yüksek kaliteli bir el çantasıdır. Bu el çantasının amacı, gezileriniz sırasında içindekilerin sıcaklığını korumaktır: taze, soğuk veya donmuş.', 'pro8.webp', 'no'),
(31, 'Cool2Shape – Kol Sargısı (2\'li set)', '52', 'Soğutmayla kahverengi yağları yakarak kalori yakmanın ve metabolizmayı geliştirmenin doğal yolu. konforlu esnek neopren – yalıtım sağlar ve soğuma süresini uzatır', 'pro9.webp', 'no'),
(32, 'Desenli soğutucu çanta 38X23X33', '60', 'Kolay fermuar hareketi için yuvarlatılmış köşelere sahip Max Teddy Bag, ayarlanabilir omuz askılı, sıcaklığın önce geldiği yüksek kaliteli, serin bir çantadır. Özel soğutma torbası, soğuk köprüleri veya termal köprüleri önlemek için benzersiz termal teknikler ve sistemlerle üretilir, böylece uzun süreli sıcaklık bakımı garanti edilebilir.', 'pro10.webp', 'no'),
(33, 'İki bölme Çanta 24x17x26', '52', 'Bu el çantasının amacı, içindekilerin sıcaklığını korumaktır: gezileriniz sırasında taze, serin. Öğle yemeğiniz, atıştırmalıklarınız, ilaçlarınız veya makyajınız için ideal çanta! Bu eşsiz çantayla serin, taze bir öğle yemeğinin veya atıştırmalıkların tadını çıkarın', 'pro11.webp', 'no'),
(34, 'Max Teddy Soğutucu Çanta - 24x20x20', '30', 'Max Teddy Soğutucu Çantalar, uzun ömürlü yalıtım sağlamak için özel malzemelerden yapılmıştır.', 'pro12.webp', 'no'),
(35, 'Baskılı Yalıtım Çantası - 53 ×15×37', '80', 'Plajda içeceklerin ısısını kaybetmemesi için üretilmiş soğutucu çanta.', 'pro13.webp', 'no'),
(36, 'Parlak Soğutucu Çanta - 30×30×35', '35', 'Alışveriş, piknik ve daha fazlası için kullanılabilen, taze, soğutulmuş ve dondurulmuş ürünler için sapldı Soğutucu çanta.', 'pro14.webp', 'no'),
(37, 'Termal Piknik Çantası 43X20X22', '150', 'Piknik veya geziler sırasında sıcaklığın depolanması endüstriyel fermuarlar sayesinde kullanımı kolaydır', 'pro15.webp', 'no'),
(38, 'Dış Ve İç Yalıtıma Sahip Soğutucu Çanta - 45×30×30 ', '65', 'Firmanızın veya soğutmalı ürününüzün serinletici bir tanıtımı için serinletici bir çanta arıyorsanız, bu eşsiz serinletici çanta seçenekler sunuyor. Promosyon amaçlı yalıtımlı soğutucu çantanın ön kısmında ve kapağında logoların veya ürün markalarının kolayca konumlandırılabilmesi için adres pencereleri bulunur.', 'pro16.webp', 'no'),
(40, 'Katlanabilir Soğutucu Çantalar - 60×40×30', '140', 'Bu benzersiz katlanabilir soğutucu çanta, kolay temizlik için özel olarak geliştirildi. Velcro kapatmaları kullanarak basitçe açın, temizleyin ve tekrar katlayın. Soğuk çanta katlanarak, kullanılmadığı zamanlarda depoda daha az yer kaplar.', 'pro17.webp', 'no'),
(59, 'Rahat Siyah Tişört', '75', 'Bu tişört çok çeşitli şekillerde giyilebilir ve her gün spor aktivitelerine katkıda bulunabilir. Bu ürün, en iyi şekilde, her türlü faydanın sağlanması için bir araya geldi.', 'pro18.webp', 'yes'),
(62, 'Soğutucu yelek', '100', 'Rahat Esnek Neopren - soğuma süresini uzatan yalıtım sağlar\r\nYürüyüş yaparken, egzersiz yaparken, işte veya ev işleri yaparken yelek ve bel bandajı giyin\r\nKullanımı Kolay – soğutma paketlerini 45 dakika içinde dondurun, cırt cırt ile neoprene takın ve vücuda sarın\r\nCilt için Güvenli – 15°C/59°F\'lik hafif soğuk, cilde veya giysilere temas edebilir\r\nUzun Ömürlü – binlerce kullanıma dayanabilen paketlerle 2-3 saat soğutma elde edin', 'pro19.webp', ''),
(63, 'Soğutucu bacak sargısı (2\'Lİ SET)', '78', 'Yürüyüş yaparken, egzersiz yaparken, işte veya ev işleri yaparken yelek ve bel bandajı giyin\r\nKullanımı Kolay – soğutma paketlerini 45 dakika içinde dondurun, cırt cırt ile neoprene takın ve vücuda sarın\r\nCilt için Güvenlidir - 15°C/ 59°F\'lik hafif soğuk, cilde veya giysilere temas edebilir\r\nUzun Ömürlü – binlerce kullanıma dayanabilen paketlerle 2-3 saat soğutma elde edin', 'pro20.webp', ''),
(64, 'Soğutucu BEL Bandı', '82', 'Rahat Esnek Neopren - soğuma süresini uzatan yalıtım sağlar\r\nKullanımı Kolay – soğutma paketlerini 45 dakika içinde dondurun, cırt cırt ile neoprene takın ve vücuda sarın\r\nCilt için Güvenli – 15°C/59°F\'lik hafif soğuk, cilde veya giysilere temas edebilir\r\nUzun Ömürlü – binlerce kullanıma dayanabilen paketlerle 2-3 saat soğutma elde edin', 'pro21.webp', ''),
(65, 'Hafif soğutucu yelek', '145', 'Smart CoolOver rahat, tam moda ve hafif bir yelektir. Soğutma yeleğinin içine sadece normal su (max. 500ml) konulduğunda soğutma hemen başlayacaktır. Soğutma etkisi ortam sıcaklığına, hava akışına ve neme bağlı olarak 8 ila 72 saat arası sürecektir.', 'pro22.webp', 'yes'),
(66, 'Rahat Yelek - X', '150', 'Smart CoolOver rahat, tam moda ve hafif bir yelektir. Soğutma yeleğinin içine sadece normal su (max. 500ml) konulduğunda soğutma hemen başlayacaktır. Soğutma etkisi ortam sıcaklığına, hava akışına ve neme bağlı olarak 8 ila 72 saat arası sürecektir.', 'pro23.webp', 'yes'),
(68, 'Soğutucu Yelek Esnek', '130', 'Smart CoolOver rahat, tam moda ve hafif bir yelektir. Soğutma yeleğinin içine sadece normal su (max. 500ml) konulduğunda soğutma hemen başlayacaktır. Soğutma etkisi ortam sıcaklığına, hava akışına ve neme bağlı olarak 8 ila 72 saat arası sürecektir.', 'pro26,.webp', 'yes'),
(69, 'Soğutucu Yelek Esnek - X', '160', 'Smart CoolOver rahat, tam moda ve hafif bir yelektir. Soğutma yeleğinin içine sadece normal su (max. 500ml) konulduğunda soğutma hemen başlayacaktır. Soğutma etkisi ortam sıcaklığına, hava akışına ve neme bağlı olarak 8 ila 72 saat arası sürecektir.', 'pro27.webp', 'yes'),
(70, 'deneme ürünü', '420', 'deneme ürünü', 'Ekran görüntüsü 2024-01-18 141116.png', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `raffle_entries`
--

CREATE TABLE `raffle_entries` (
  `id` int(11) NOT NULL,
  `raffle_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gift_user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `raffle_entries`
--

INSERT INTO `raffle_entries` (`id`, `raffle_id`, `user_id`, `gift_user_id`) VALUES
(27, 16, 15, 0),
(26, 444, 15, 9),
(22, 2, 10, 8),
(21, 2, 8, 9),
(20, 2, 9, 15),
(19, 1, 10, 9),
(18, 1, 15, 8),
(16, 1, 9, 15),
(31, 1243564, 9, 9);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `slider`
--

CREATE TABLE `slider` (
  `id` int(255) NOT NULL,
  `thumb1` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `thumb2` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `thumb3` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `thumb4` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `slider`
--

INSERT INTO `slider` (`id`, `thumb1`, `thumb2`, `thumb3`, `thumb4`) VALUES
(1, '8.webp', '9.webp', '10.webp', '11.webp'),
(2, 'product-1-2.png', 'product-1-3.png', 'product-1-6.png', 'product-1-7.png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `userinfo`
--

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `upper_body_size` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `lower_body_size` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `shoe_size` int(11) DEFAULT NULL,
  `adress` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `userinfo`
--

INSERT INTO `userinfo` (`id`, `user_id`, `upper_body_size`, `lower_body_size`, `shoe_size`, `adress`, `name`, `email`) VALUES
(11, 6, 'M', 'XL', 42, 'aaa', 'mahi', 'mahinazir@gmail.com'),
(12, 8, 'XXL', 'XXL', 44, 'Ataköy 2-5-6. kısım', 'usersemir', 'efemirusenmez@icloud.com'),
(13, 9, 'S', 'S', 38, 'bakırköy', 'ipekusenmez', 'ipekusenmez@gmail.com'),
(14, 10, 'S', 'S', 36, 'avcılar', 'hacer', 'ecegulluk@gmail.com'),
(18, 11, 'XL', 'XL', 46, 'istanbul sarayları', NULL, NULL),
(19, 12, 'XL', 'XL', 44, 'florya', NULL, NULL),
(20, 15, 'L', 'XL', 46, 'senlikkoy', 'Omer', 'omer.selim.gurel@gmail.com'),
(21, 19, 'XL', 'XL', 45, 'Ataköy 5. kısım a 9 blok no : 69 - 19 mayıs caddesi İstanbul / Bakırköy', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(6, 'mahi', 'deneme@gmail.com', '12345', 'user'),
(7, 'efe emir', 'efemirusenmez@gmail.com', '123', 'admin'),
(8, 'usersemir', 'efemirusenmez@icloud.com', '12345', 'user'),
(9, 'ipekusenmez', 'ipekusenmez@gmail.com', '123', 'user'),
(10, 'hacer', 'ecegulluk@gmail.com', '1234', 'user'),
(11, 'tarık', 'tarikkadiro@gmail.com', '1234', 'admin'),
(12, 'ömer', 'omer@gmail.com', '1234', 'user'),
(13, 'gokhan', 'gokhan@gmail.com', '12345', 'user'),
(14, 'metin ', 'metin@gmail.com', '123456', 'user'),
(15, 'header.php', 'omer.selim.gurel@gmail.com', '123', 'user'),
(16, 'asdsa', 'asdasd@gmail.com', 'gahzix-tipxa7-myrbYg', 'user'),
(17, 'asdasdsad', 'asdasdas@asddsa', 'asdasdasd', 'user'),
(18, 'rahma', 'rahma@gmail.com', '123', 'user'),
(19, 'yeni', 'emir.usenmez@themax.media', '123', 'user');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `pid` int(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(14, 9, 24, 'Çift bölmeli öğle yemeği çantası 30x20x24', '45', 'pro1.webp'),
(22, 9, 25, 'Soğutucu çanta 36x26x30cm', '42', 'pro3.webp'),
(23, 9, 26, 'Yalıtımlı Spor Çanta – 60x25x27', '120', 'pro4.webp'),
(24, 8, 26, 'Yalıtımlı Spor Çanta – 60x25x27', '120', 'pro4.webp'),
(25, 8, 22, 'İki Bölmeli Öğle Yemeği Çantası 30x16x28', '55', 'pro2.webp'),
(26, 8, 25, 'Soğutucu çanta 36x26x30cm', '42', 'pro3.webp');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `raffle_entries`
--
ALTER TABLE `raffle_entries`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Tablo için AUTO_INCREMENT değeri `message`
--
ALTER TABLE `message`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Tablo için AUTO_INCREMENT değeri `raffle_entries`
--
ALTER TABLE `raffle_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Tablo için AUTO_INCREMENT değeri `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Tablo için AUTO_INCREMENT değeri `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `userinfo`
--
ALTER TABLE `userinfo`
  ADD CONSTRAINT `userinfo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
