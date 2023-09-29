-- Adminer 4.8.1 MySQL 8.1.0 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `category`, `created_at`, `updated_at`) VALUES
(1,	'Kendara',	'2023-09-19 04:05:58',	'2023-09-19 04:05:58'),
(2,	'Properti',	'2023-09-19 04:08:07',	'2023-09-28 08:42:48');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_reset_tokens_table',	1),
(3,	'2014_10_12_100000_create_password_resets_table',	1),
(4,	'2019_08_19_000000_create_failed_jobs_table',	1),
(5,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(6,	'2023_07_12_044043_create_categories_table',	1),
(7,	'2023_07_12_045140_create_posts_table',	1);

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `cat_id` bigint unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_cat_id_foreign` (`cat_id`),
  CONSTRAINT `posts_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `posts` (`id`, `user_id`, `cat_id`, `title`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	'Mitsubishi Xforce, Faktor X di Segmen SUV Kompak',	'Segmen sport utility vehicle (SUV) kompak di pasar otomotif Tanah Air saat ini menjadi segmen paling meriah dan panas setelah segmen lowmulti-purpose vehicle (MPV). Baru saja persaingan di segmen ini ”diusik” Toyota Yaris Cross, kini Mitsubishi masuk gelanggang dengan mengandalkan Mitsubishi Xforce.\r\n\r\nJika dicermati, hampir semua pabrikan saat ini punya jagoan masing-masing di segmen SUV kompak dengan lima tempat duduk ini. Yang pertama tentu saja Honda dengan HR-V, lalu ada Hyundai Creta, Kia Seltos, Nissan Kicks ePower, Mazda CX-3, dan Wuling Alvez.\r\n\r\nMitsubishi Xforce menjadi salah satu mobil baru yang diluncurkan di ajang pameran otomotif Gaikindo Indonesia International Auto Show (GIIAS) 2023 di ICE BSD City, Kabupaten Tangerang, Banten, Kamis (10/8/2023). Tak tanggung-tanggung, peluncuran Xforce dilakukan oleh Presiden dan CEO Mitsubishi Motor Corporation Takao Kato yang membawa delegasi pejabat dari kantor pusat Mitsubishi di Jepang.\r\n\r\nKato mengatakan, Xforce ini dikembangkan sejak tiga tahun lalu di Indonesia dengan target memenuhi kebutuhan pasar di negara-negara ASEAN. ”Compact SUV ini dikembangkan untuk menjawab kebutuhan pengemudi di kawasan ASEAN dan telah melalui uji coba secara berulang di kawasan ini,” ungkap Kato dalam peluncuran mobil baru tersebut.\r\n\r\nBeberapa bulan sebelumnya, PT Mitsubishi Motors Kramayudha Sales Indonesia (MMKSI), selaku distributor resmi kendaraan penumpang dan niaga ringan Mitsubishi di Indonesia, telah meluncurkan sejumlah teaser akan munculnya mobil baru ini dengan merilis foto-foto siluet dan melansir sebagian fitur andalan mobil tersebut.\r\n\r\nXforce dikembangkan dari mobil konsep Mitsubishi XFC Concept yang dipajang pada pameran otomotif Indonesia International Motor Show (IIMS) 2023, Februari lalu. Mobil konsep ini pertama kali dipamerkan di Vietnam, Oktober 2022. Namun, saat itu pihak PT MMKSI belum mengungkapkan di negara mana versi produksi massal dari XFC Concept akan dibuat dan dipasarkan.\r\n\r\nKini terjawab sudah, Mitsubishi Xforce diproduksi oleh PT Mitsubishi Motors Krama Yudha Indonesia (MMKI) di Cikarang, Kabupaten Bekasi, Jawa Barat, dan dipasarkan pertama kali di Indonesia sebelum nantinya diekspor ke negara lain.',	'1695096565.jpg',	'2023-09-19 04:09:25',	'2023-09-19 04:09:25'),
(2,	1,	1,	'Sensasi Karpet Terbang Citroen di Perancis',	'Tak ada yang lebih menyenangkan daripada mengendarai mobil menyusuri jalanan kota Paris yang penuh bangunan bersejarah dan karya arsitektur monumental. Begitu pula saat melintasi kota-kota kecil dan desa di sekitar Paris dengan pemandangan ladang gandum, bunga matahari, dan taman-taman indah.\r\n\r\nKesan dan pengalaman itu tersaji saat Kompas mengunjungi Perancis bersama PT Indomobil Wahana Trada sebagai distributor Citroen di Indonesia dan Stellantis sebagai perusahaan yang menaungi Citroen pada 17-20 Juli 2023 lalu.\r\n\r\nDalam perjalanan dari Paris ke Evreux di negeri kelahiran Citroen ini, Stellantis menyiapkan mobil-mobil yang sudah dipasarkan di Indonesia, seperti Citroen C5 Aircross dan mobil listrik Citroen e-C4.\r\n\r\nBerangkat dari Hotel Molitor, Paris, tak ada pengawalan polisi yang mengiringi perjalanan. Para jurnalis peserta acara ini hanya dibekali peta digital di layar monitor utama setiap mobil. Saat mulai perjalanan, rombongan masih berjalan beriringan. Namun, belum sampai 1 kilometer, rombongan sudah terpisah dan berbaur dengan kendaraan lain.\r\n\r\nSulit untuk terus beriringan karena kami harus mematuhi aturan lalu lintas. Tak bisa asal menyalip kendaraan, apalagi nekat menerobos lampu lalu lintas, meski masih menyala kuning. Walau tak mengenal medan, kami sangat terbantu peta digital agar tidak tersesat dan bisa menuju titik kumpul yang sudah ditentukan.\r\n\r\nTak hanya itu, tantangan mengendarai mobil di Perancis untuk pertama kali adalah beradaptasi dengan posisi setir di sebelah kiri. Pada perjalanan dari Paris menuju pemberhentian pertama di Rueil, lalu dari Giverny ke Evreux lalu kembali Paris, Kompas menggunakan C5 Aircross.\r\n\r\nMobil berbentuk SUV ini sudah dilengkapi berbagai fitur keselamatan berkendara. Layar sentuh ukuran 10 inci di tengah dasbor menampilkan pilihan aktivasi fitur keselamatan, seperti blind spot monitoring atau sensor titik buta serta lane keep assist. Dua fitur ini memudahkan pengemudi untuk tetap berada pada lajurnya dan menghindari kecelakaan. Apalagi, beberapa jalan di Perancis cukup sempit.\r\n\r\nKesan pertama mengendarai C5 Aircross adalah aura mewah yang terasa. Roda kemudi bisa diatur ke posisi paling nyaman karena memiliki fitur tilt dan telescopic steering. Sementara di konsol tengah tidak terlihat tongkat persneling konvensional. Memindahkan posisi transmisi menggunakan tuas kecil.\r\n\r\nFitur di kabin C5 Aircross yang dirakit di Brittany, Perancis, ini, juga terbilang banyak. Beberapa di antaranya fitur parkir otomatis, pengecas gawai nirkabel, dan pengendali laju alias cruise control.\r\n\r\nSelanjutnya, ada fitur air quality system untuk mendeteksi polusi yang masuk ke dalam mobil dan bisa mengeluarkan udara kotor itu dari kabin mobil. Kompas penasaran untuk mencoba fitur ini dengan membuka panoramic glass sunroof dan membiarkan udara luar masuk beberapa saat, lalu menutupnya kembali.\r\n\r\nNamun, saat dicermati, tidak ada tampilan peringatan yang muncul di layar untuk menunjukkan kabin telah dicemari polusi udara. Entah karena kurang lama membiarkan udara masuk atau udara di Perancis tidak terlalu berpolusi. Fitur air quality system ini rasanya lebih cocok dicoba di Indonesia, khususnya di Jabodetabek yang sangat berpolusi.\r\n\r\nC5 Aircross memiliki dimensi panjang 4,5 meter, lebar 1,84 meter, dan tinggi 1,7 meter dengan jarak antarsumbu roda 2,7 meter. Ruang kabinnya pun terasa lega dengan jok berlapis kulit Alcantara yang berasa lembut dan empuk.',	'1695890418.jpg',	'2023-09-28 08:40:18',	'2023-09-28 08:40:18'),
(3,	1,	1,	'Habitat Berbeda Subaru Outback',	'Subaru Outback seperti mobil yang bisa hidup di dua habitat. Ketinggian ground clearance serta penggerak semua roda membuatnya bisa menjelajah ruang nonaspal. Sementara DNA sedan menawarkan kenyamanan bagi penggunaan sehari-hari. Tak heran mobil ini laris di negara dengan bentang alam beragam macam AS dan Australia. Mestinya di Indonesia juga.\r\n\r\nSekitar 28 tahun silam, produsen mobil Subaru asal Jepang “mengungkit” model sedan beratap panjang Legacy Wagon sehingga ruang kolongnya jadi lebih tinggi. Maka lahirlah model persilangan (crossover) sedan wagon dan SUV bernama Outback. Penjualannya laris manis di pasar AS dan dinilai sebagai mobil paling aman selama belasan tahun.\r\n\r\nHingga tahun 2023 ini, Subaru Outback telah “beranak-pinak” sebanyak enam generasi. Kenyamanan ala sedan dan kemampuannya melibas lebih banyak rupa permukaan jalan membuatnya terjual sebanyak 2,7 juta unit di pasar AS saja. Mobil ini juga laris di Australia, selain tentunya, negara kelahirannya, Jepang.\r\n\r\nDi awal kemunculannya, Subaru Outback mendaku sebagai mobil pertama dengan model special utility wagon, yang menggambarkan persilangan antara SUV dan station wagon. Ia begitu dicintai penggemar Subaru karena kepraktisannya, juga keamanannya. Insurance Institute for Highway Safety (IIHS), organisasi bidang keamanan jalan raya di AS, menganugerahi Outback dengan gelar Top Safety Pick+ selama 15 tahun berturut-turut—gelar untuk mobil dengan tingkat keamanan tertinggi.\r\n\r\nFaktor keamanan itu juga yang berusaha dipertahankan pada generasi keenamnya, yang pertama kali meluncur tahun 2021. Generasi keenam ini menggunakan Subaru Global Platform, yang berkarakter lebih kaku, dan bisa mengampu beragam sumber tenaga; mesin bakar, hibrida, atau listrik murni. Teknologi modern Subaru siap diterapkan di Outback terkini.\r\n\r\n“Sejak awal kemunculannya, Outback memang diposisikan sebagai mobil flagship (unggulan) Subaru. Jadi semua teknologi terkini dipakai terlebih dulu di Outback, baru diaplikasikan di model lainnya,” kata Harist Kusuma, Product Analyst Subaru Indonesia.\r\n\r\nSubaru Outback generasi keenam mengawali debutnya di Indonesia pada pameran otomotif Gaikindo Indonesia International Auto Show (GIIAS), Agustus 2023 lalu. Kehadiran Outback melengkapi lini mobil Subaru Indonesia setelah jenama ini kembali lagi mengaspal di tanah air setahun silam. “Ini adalah model Subaru keenam yang kami masukkan di Indonesia. Pilihan model kami menjadi semakin lengkap,” kata Arie Christopher, CEO Subaru Indonesia.',	'1695890503.jpg',	'2023-09-28 08:41:43',	'2023-09-28 08:41:43'),
(4,	1,	2,	'Saatnya Beli Rumah, Jangka Waktu Cicilan KPR Panjang Bukan Masalah',	'Perlambatan laju harga rumah dan rendahnya bunga kredit pemilikan rumah saat ini dinilai telah menciptakan iklim pasar properti yang tepat bagi pembeli baru. Angkatan kerja baru dan masyarakat berpendapatan rendah bisa memilih tenor angsuran yang panjang hingga 25 tahun dari bank konvensional ataupun produk pinjaman pemilikan rumah dari bank syariah yang memudahkan perencanaan keuangan.\r\n\r\nBerdasarkan data House Price Index (HPI) Bank Tabungan Negara (BTN), selama 1,5 tahun terakhir (2020-2021), laju kenaikan harga rumah di Jabodetabek cenderung melambat (rata-rata naik 4,8 persen per tahun). Bandingkan dengan periode 2015-2019 yang dapat mencapai 9,7 persen per tahun.\r\n\r\nSelain itu, Direktur Finance, Planning and Treasury BTN Nofry Rony Poetra mengatakan bahwa suku bunga acuan yang rendah juga menyebabkan bunga KPR ikut turun. Hal ini semakin mempermudah masyarakat calon pembeli rumah.\r\n\r\nKeberadaan stimulus pemerintah dalam bentuk pembebasan Pajak Pertambahan Nilai Ditanggung Pemerintah (PPN DP) juga berkontribusi pada hal ini. Biasanya besaran PPN adalah 10 persen dari harga jual properti.\r\n\r\n”Jadi, memang saat ini waktu yang tepat untuk beli rumah. Bisa jadi tahun depan bunga mulai naik,” kata Nofry dalam wawancara khusus pertengahan pekan lalu.\r\n\r\nCofounder firma perencana keuangan Finansia Consulting, Eko Endarto, juga menyampaikan hal senada. Menurut dia, harga properti di Jabodetabek menunjukkan karakteristik yang cenderung overvalued. Stagnasi dan penurunan harga yang telah terjadi sekarang, ujarnya, adalah bentuk koreksi harga oleh pasar.\r\n\r\nEko juga sepakat bahwa saat ini masyarakat diberikan lebih banyak kemudahan dalam mengajukan KPR ke bank.\r\n\r\n”Dulu mungkin ketika mau ambil KPR, durasi tenornya itu tidak bisa panjang, maksimum 0-15 tahun. Tetapi, sekarang perbankan berani menawarkan tenor 25-30 tahun. Sehingga, bisa dibilang kemampuan generasi muda sekarang untuk mengejar kepemilikan rumah lebih mudah dibandingkan generasi sebelumnya,” kata Eko.',	'1695890755.jpg',	'2023-09-28 08:44:11',	'2023-09-28 08:45:55'),
(5,	1,	2,	'Milenial Mendominasi Pasar Properti',	'Siapa yang tidak bermimpi punya rumah? Masa pandemi Covid-19 telah menggiring kesadaran sebagian masyarakat akan kebutuhan dasar hunian yang nyaman, sehat, dan multifungsi. Generasi milenial dan generasi Z pun kian mendominasi pasar perumahan.\r\n\r\nCommercial Director Lamudi.co.id Yoga Priyautama mengemukakan, selama dua tahun pandemi, pencarian properti di laman tersebut meningkat 36,8 persen secara tahunan. Pencarian properti yang sempat turun pada April 2020 secara bertahap kembali menggeliat dan kian meningkat seiring banyaknya insentif properti dari pemerintah.\r\n\r\n”Ini menunjukkan, orang masih cari properti walaupun di masa pandemi. Perpanjangan stimulus pajak sangat membantu kenaikan pasar properti,” katanya, dalam Diskusi ”Tren Properti Incaran Milenial: Cara Mudah Punya Rumah” secara daring, yang diselenggarakan Infobank TV.\r\n\r\nYoga menambahkan, pencarian properti saat ini didominasi kelompok masyarakat berumur 25-34 tahun, yang tergolong generasi milenial dan generasi (gen) Z. Hampir 90 persen pencarian properti dilakukan secara digital dengan menggunakan telepon pintar. Tipikal pembeli properti dari kaum milenial yang pada tahun ini berusia 27-41 tahun, serta gen Z yang berumur sampai 26 tahun umumnya mencari informasi sebanyak-banyaknya, sebelum memutuskan membeli.\r\n\r\n”Kebanggaan memiliki properti masih menjadi sesuatu yang menarik untuk kaum milenial dan gen Z. Aktualisasi diri adalah (dengan) membangun rumah sendiri. Informasi menjadi faktor terpenting untuk mengambill keputusan membeli rumah. Mereka mencari tahu dulu soal properti yang ingin dibeli, lokasi yang baik, hingga skema pembiayaan KPR,” lanjut Yoga.\r\n\r\nBaca juga : Insentif Sektor Properti Disambut Baik dengan Catatan\r\n\r\nDari kajian lamudi.co.id, rumah tapak masih menjadi primadona untuk tempat tinggal (end user), yakni mencapai 83,7 persen dari total pencarian rumah pada tahun 2021 dan sebesar 92,01 persen pada tahun 2020. Pembiayaan juga didominasi dengan KPR.\r\n\r\nDengan adanya dominasi pasar kaum milenial dan gen Z, penting bagi pelaku properti untuk beradaptasi dengan cara pemasaran dan uang muka relatif ringan guna menjangkau kaum muda ini. Di sisi lain, perbankan perlu menangkap peluang melalui kemudahan pembiayaan.\r\n\r\nDari data Kementerian Pekerjaan Umum dan Perumahan Rakyat (PUPR), generasi milenial dan Z juga mendominasi penyerapan rumah bersubsidi melalui fasilitas likuiditas pembiayaan perumahan (FLPP). Sebanyak 78 persen alokasi FLPP dimanfaatkan kaum milenial, dan 12 persen oleh gen Z.\r\n\r\nNamun, kebutuhan rumah yang terus melaju setiap tahun menyebabkan tingkat kekurangan (backlog) rumah masih tinggi, yang didominasi kaum milenial. Jumlah masyarakat yang belum memiliki rumah saat ini mencapai 12,75 juta rumah tangga. Adapun, keluarga yang menempati rumah tidak layak huni mencapai 7 juta rumah tangga.',	'1695890707.jpg',	'2023-09-28 08:45:07',	'2023-09-28 08:45:07'),
(6,	1,	2,	'Desain Interior, Merekam Perubahan Sosial',	'Pandemi Covid-19 telah mengubah cara pandang orang terhadap rumah sebagai tempat tinggal. Sebagai tempat yang kini disadari sangat esensial, rumah kemudian menjadi perekam bagi perubahan sosial. Desain interior yang lebih mengutamakan fungsi, tak semata estetik, kini mengambil peran lebih besar.\r\n\r\nPerubahan yang terjadi di dalam rumah selama masa pandemi Covid-19 tersebut tergambar dalam pameran The Colours of Indonesia (TCOI) Chapter V yang diinisiasi oleh ID12 pada 19-30 September 2022 di Senayan City, Jakarta. Pameran itu merepresentasikan gaya desain interior modern dan klasik yang diaplikasikan pada dua unit rumah.\r\n\r\nID12 adalah kelompok desainer interior Indonesia yang berjumlah 12 orang, terdiri dari Eko Priharseno, Agam Riadi, Anita Boentarman, Ary Juwono, Joke Roos, Prasetio Budhi, Reza Wahyudi, Roland Adam, Sammy Hendramianto S, Shirley Gouw, Vivianne Faye, dan Yuni Jie. Mereka adalah jajaran desainer interior ternama di Tanah Air.\r\n\r\nDalam pameran kali ini, tiap-tiap desainer mendesain 12 ruang yang berbeda, disesuaikan dengan ciri khas dan karakter personal mereka. Enam desainer mempresentasikan gaya desain modern, enam lainnya mempresentasikan gaya neoklasik.\r\n\r\nTema hunian atau residensial menjadi pilihan dalam pameran desain interior dwitahunan ini karena semasa pandemi Covid-19 muncul kesadaran pada banyak orang bahwa tinggal di rumah telah menjadi hal yang paling esensial. Banyak keputusan yang harus diambil dan aktivitas yang harus dilakukan saat berada di rumah, terlebih dengan lahirnya istilah work from home atau bekerja dari rumah yang membutuhkan ruang-ruang untuk ditata dengan baik, sesuai kebutuhan.\r\n\r\n”Pada saat dimulainya pandemi, kita khawatir karena belum tahu masa depan. Namun, setelah dua bulan pandemi berlangsung, semua orang mulai menyadari bahwa rumahnya adalah tempat yang paling aman. Semua akhirnya berkaca, apakah rumah saya cukup, apakah rumah saya sudah ditata dengan baik,” ujar Eko pada hari pembukaan pameran.\r\n\r\nTiga bulan awal masa pandemi, para desainer interior pun kebanjiran proyek, khususnya dari sisi hunian. Sementara proyek untuk komersial lebih banyak yang mandek.',	'1695890819.jpg',	'2023-09-28 08:46:59',	'2023-09-28 08:46:59');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'Portal Berita A',	'portalberitaa',	'portalberitaa@gmail.com',	NULL,	'$2y$10$1lW1IbEL4YxJwmJH58d1D.BpcrYAL7DDOkis0opVuUN/feSXoHVPi',	NULL,	'2023-07-13 09:53:48',	'2023-07-13 09:53:48');

-- 2023-09-28 10:27:18
