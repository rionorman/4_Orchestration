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
(1,	'Gawai',	'2023-09-19 04:15:01',	'2023-09-19 04:15:01'),
(2,	'Olah Raga',	'2023-09-28 10:13:57',	'2023-09-28 10:13:57');

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
(1,	1,	1,	'Waktu yang Tepat untuk Menjelajah Teknologi Komputasi Awan',	'Bingung karena harus menutup produksi film secepatnya, belum lagi kehilangan banyak vendor, kru, dan artis yang sudah dikumpulkan dari seluruh dunia, Ames tertolong oleh kemampuan komputasi awan AWS. ”Di akhir pekan kami memulai produksi berbasis komputasi awan dengan sungguh-sungguh. Kami tetap melakukannya, tetapi Covid mengirim kami ke tingkat pengembangan selanjutnya,” ujar Ames.\r\n\r\nIa menuturkan, produksi The Rings melibatkan 12 vendor global, termasuk beberapa studio efek di Amerika dan Eropa. Teknologi komputasi awan memungkinkan setiap produk dari vendor yang digunakan dapat dimanfaatkan oleh vendor lain untuk kepentingan produksi The Rings. Setiap efek visual yang dihasilkan dapat digunakan oleh vendor yang berbeda.\r\n\r\nSebelum memanfaatkan teknologi komputasi awan, menurut Ames, metadata dalam produksi film konvensional berarti kode tepi pada film negatif, catatan skrip yang diketik, lembar panggilan, dan catatan-catatan produksi lainnya. Kini, dengan menggunakan teknologi komputasi awan, Ames mengatakan, setiap frame dalam pengambilan gambar dapat menjadi bagian dari tiap frame konten film sejak awal hingga akhir produksi. Komputasi awan dengan mudah mengatur bagian frame mana yang telah diambil untuk dipakai kembali.\r\n\r\nDi sinilah apa yang oleh Selipsky disebut bahwa komputasi awan menawarkan ketangkasan dan efisiensi biaya terwujud. Menurut Ames, cara lama dalam memproduksi film terlalu boros dan tidak efisien. ”Saat semuanya berbasis teknologi komputasi awan, semua data disimpan dengan aman di komputasi awan dan dapat dibagikan di masa depan. Ini merupakan kerja yang luar bisa dari awal hingga akhir,” katanya.\r\n\r\nSalah satu tawaran AWS memang efisiensi biaya untuk penggunanya. Meski memang platform komputasi awan, tak hanya AWS, juga menawarkan hal serupa. Pengguna hanya dikenai biaya untuk layanan apa yang mereka pakai dari jasa peladen ini. AWS menawarkan konsol penagihan yang memungkinkan konsumen mengakses ikhtisar biaya yang dikeluarkan setiap pengguna. Pengguna pun dapat dengan mudah melihat apakah pengeluaran mereka selama menggunakan jasa peladen AWS terkendali atau tidak.',	'1695097113.jpg',	'2023-09-19 04:18:33',	'2023-09-19 04:18:33'),
(2,	1,	1,	'Kemampuan Kontinuitas Gambar Canon EOS R8',	'Laju perkembangan teknologi kamera mirrorless saat ini telah membuatnya mampu merekam gambar dengan kecepatan tinggi, bahkan di kategori kamera kelas entry level.\r\n\r\nSalah satu kamera mirrorless yang masuk dalam kategori entry level ini adalah Canon EOS R8 yang diluncurkan pertengahan 2023 ini. Kamera ini memiliki kemampuan memotret secara beruntun hingga 40 bingkai per detik pada rana elektronik dan pada mode RAW Burst 30 bingkai per detik dalam format file RAW.\r\n\r\nKecepatan tinggi perekaman gambar secara kontinuitas ini sangat dibutuhkan, misalnya dalam pemotretan olahraga dan kehidupan satwa liar. Spesifikasi yang ditawarkan Canon EOS R8 itu membuat saya merasa penasaran untuk mencoba kemampuannya, terutama dalam kontinuitas gambar dalam merekam diformat RAW.\r\n\r\nDalam dunia fotografi olahraga, selain membutuhkan naluri yang tajam, juga diperlukan dukungan kamera berkecepatan tinggi dalam merekam gambar. Untuk itu, saya mencoba kamera ini pada kegiatan latihan pembalap muda di 43 Racing School di kawasan Sirkuit Sentul, Bogor, beberapa waktu lalu.\r\n\r\nSirkuit mini tempat para calon pembalap digembleng ini hanya memiliki panjang lintasan sekitar 1 kilometer, namun memiliki banyak tikungan tajam. Melihat medan sirkuit yang ada, dengan menggunakan lensa Canon RF70-200mm f2.8L IS USM, rasanya sudah cukup membantu untuk mengambil gambar di beberapa sudut tikungan.\r\n\r\nUntuk mengetahui kinerja kamera ini, model pemotretan diatur pada mode RAW Burst dan pelacakan fokus di atur pada Servo AF dengan pilihan Vehicle. Pengaturan ini akan membuat kamera bekerja secara otomatis baik dalam memotret secara beruntun maupun mendeteksi fokus secara kontinuitas.\r\n\r\nRasa gerah setelah seharian terpanggang matahari di pinggir tikungan merekam aksi para pembalap menaklukkan tikungan-tikungan tajam, langsung terobati saat melihat hasil dari kinerja kamera ini di layar monitor kamera.\r\n\r\nGambar yang direkam kamera terlihat dengan titik fokus subyek terkunci tanpa ada yang keluar dari titik fokus. Mode RAW Burst bekerja merekam gambar secara kontinuitas dalam sebuah folder RAW seperti layaknya merekam format video dan kemudian gambar yang dipilih dapat diekstrak pada pilihan format RAW, JPEG dan HEIF untuk menjadi sebuah bingkai foto.\r\n\r\nDalam pemotretan burst kecepatan tinggi dengan menggunakan kartu memori jenis SDXC II kecepatan menulis 260MBs dan membaca 100MBs, jeda loading atau buffering tak bisa dihindari saat kamera menyimpan data ke kartu memori. Namun untuk kamera sekelas entrylevel, ini masih bisa dimaklumi.\r\n\r\nProsesor gambar DIGIC X Sensor CMOS bingkai penuh 24,2MP yang ditanam di bodi kamera inilah yang mendukung kinerja dari Canon EOS R8. DIGIC X Sensor CMOS ini dikawinkan dengan EOS iTR AF X, mesin pelacakan cerdas yang digerakkan oleh algoritma dengan 1053 zona bingkai AF mampu mendeteksi subyek secara otomatis gerak manusia, hewan, dan kendaraan.',	'1695890171.jpg',	'2023-09-28 08:36:11',	'2023-09-28 08:36:11'),
(3,	1,	1,	'Memenuhi Marwah Universalitas USB',	'Jagad media sosial riuh merespons pengumuman teranyar pada gelaran Apple Event yang dihelat daring, Selasa (12/9/2023). Salah satu kabar yang ditunggu-tunggu sejak lama, yakni seri iPhone terbaru bakal memakai Universal Serial Bus (USB) tipe C.\r\n\r\nKabar itu mengemuka saat seri produk iPhone 15 diperkenalkan. Setelah mengenalkan sejumlah fitur mulai dari pembaruan teknologi notifikasi, dimensi layar, hingga fitur kamera, barulah pembaruan porta USB terbaru itu disebutkan di akhir bagian.\r\n\r\nVice President iPhone Product Marketing Kaiann Drance mengumumkan, porta USB-C mulai diusung pada iPhone 15 dan pada perangkat Apple lainnya. USB-C dapat digunakan mengecas gawai, transfer data, serta memutar audio dan video. konektor ini bisa digunakan selaras dengan perangkat laptop Mac, tablet iPad, dan airpods yang telah dilengkapi USB-C.\r\n\r\n\"USB-C telah menjadi standar yang diterima secara universal. Maka, kami membawa USB-C ke iPhone 15,\" tutur Drance saat acara peluncuran di Apple Campus, markas raksasa teknologi itu di Cupertino, California, Amerika Serikat.\r\n\r\nPernyataan itu seakan menunjukkan bahwa memang Apple akan seutuhnya menggunakan USB-C di seluruh jajaran gawainya.\r\n\r\nSudah lebih dari dua dekade, umat manusia telah akrab dengan USB, colokan atau soket yang ada pada bermacam gawai dan perangkat digital. Dari ponsel pintar hingga penyedot debu mini juga menggunakan USB. Data ataupun daya, USB bisa menyalurkannya.\r\n\r\nMungkin itu mengapa ‘U’ pada USB adalah universal. Universal Serial Bus kepanjangannya yang lengkap. Sejagat, perangkat dan gawai apa pun bisa menggunakan USB. Seharusnya.\r\n\r\nApple, memang menjadi salah satu raksasa teknologi gawai dunia yang belum memeluk USB-C seutuhnya.\r\n\r\nSejak seri pertama iPhone diluncurkan pada 16 tahun yang lalu, ponsel pintar ini menggunakan soket proprietary atau standar khusus milik Apple sendiri. Colokan iPhone ya untuk iPhone. Memang sedikit merepotkan.\r\n\r\nGenerasi kedua earbuds Apple AirPods Pro, kini menggunakan konektor USB-C untuk pengisian daya, seperti yang diumumkan Apple pada Selasa (12/9/2023) di Cupertino, California, Amerika Serikat.\r\n\r\nBahkan kabar ini memicu antusiasme sejumlah pengguna untuk berpindah ke iPhone. Alfi Prakoso (29), fotografer yang sehari-hari memakai ponsel Android dan laptop Macbook, memandang peralihan koneksi USB-C bakal membuat bawaan sehari-hari semakin simpel.\r\n\r\n“Di kondisi sekarang kalau gue lagi mobile, gue cukup bawa satu kabel USB-C untuk cas semua gawai termasuk Macbook. Kebutuhan kita soal kabel bakal berkurang, mungkin secara luas bakal ngurangin sampah elektronik setiap tahunnya,” ujarnya.\r\n\r\nAda pengaruh Uni Eropa sebetulnya, dalam keputusan Apple untuk menggunakan USB-C pada iPhone.\r\n\r\nRegulasi Common Charger yang disahkan pada 2022 mewajibkan mulai 2024 gawai konsumer yang dijual di kawasan Uni Eropa, seperti ponsel, kamera digital, konsol gim jinjing, hingga headphones, mouse, dan keyboard, untuk menggunakan soket USB-C.',	'1695890302.jpg',	'2023-09-28 08:38:22',	'2023-09-28 08:38:22'),
(4,	1,	2,	'Taman hingga Kereta Cepat, Semua Berseru Rayakan Asian Games',	'Sejak awal September, suasana Asian Games 2022 kian kental terasa di Hangzhou, ibu kota Provinsi Zhejiang, dan lima kota pendukung di sekitarnya. Semua itu untuk membawa peserta dan masyarakat umum menikmati secara hakiki pesta olahraga Asia yang digelar pada 23 September-8 Oktober 2023 tersebut.\r\n\r\nDari pintu masuk Hangzhou, antara lain Bandara Internasional Hangzhou Xiaoshan, pengunjung akan langsung disambut oleh pernak-pernik yang mencolok. Interior dan eksterior bandara didesain khusus dengan warna khas logo Asian Games 2022 berupa gradasi warna biru, ungu, merah muda, kuning, oranye, dan hijau. Segenap fasilitas publik tak lepas dari sentuhan Asian Games ketiga di China tersebut, seperti lampu lalu lintas yang berbentuk salah satu maskot.\r\n\r\nMaskot Asian Games 2022 yang terdiri dari Congcong, Lianlian, dan Chenchen ada di mana-mana. Mereka dipajang dengan dihiasi bunga ataupun tanaman warna-warni sedemikian rupa di hampir setiap sudut kota, terutama di sekitar Kompleks Pusat Olahraga Olimpiade Hangzhou. Tempat itu merupakan lokasi Stadion Utama Hangzhou yang menjadi tempat pembukaan, penutupan, dan pertandingan cabang olahraga atletik.\r\n\r\nLanskap hijau menjadi elemen paling dominan untuk menyemarakkan Asian Games 2022. Bahkan, otoritas setempat membuka Taman Hiburan Bunga Asia di Hangzhou, Rabu (6/9/2023). Taman seluas 28.000 meter persegi itu menampilkan lebih dari 200 spesies bunga. Secara kreatif, taman itu mengintegrasikan identitas budaya dari seluruh wilayah Asia, mulai dari Asia Timur, Asia Tenggara, Asia Selatan, Asia Tengah, hingga Asia Barat.\r\n\r\nElemen hijau sejalan dengan konsep atau tema utama Asian Games 2022, yaitu hijau, cerdas, hemat, dan beradab. Elemen itu coba memberikan suasana tenteram dan menggoda semua orang dari berbagai penjuru negeri di Asia untuk bersatu merayakan pesta olahraga ”Benua Kuning”, mulai dari kontingen negara peserta hingga masyarakat umum.\r\n\r\nSelain itu, segenap fasilitas penunjang disiapkan khusus untuk menyambut Asian Games 2022, salah satunya kereta cepat pintar Fuxing yang resmi diluncurkan untuk Asian Games kali ini. Menurut laporan Hangzhou2022.cn, Minggu (17/9/2023), seluruh badan kereta listrik multiunit (electric multiple unit/EMU) itu dicat ungu pelangi yang menjadi bagian dari warna utama Asian Games 2022. Dekorasi eksterior dan interiornya diintegrasikan dengan unsur khas ajang tersebut.\r\n\r\nKereta itu memiliki delapan gerbong dengan kapasitas 578 penumpang dan mampu melaju dengan kecepatan 350 kilometer per jam. Kereta itu akan beroperasi di dua rute yang menjangkau lokasi arena Asian Games, yakni dari Hangzhou timur ke Quzhou dan Hangzhou timur ke Pingyang.\r\n\r\nDi samping memanfaatkan energi ramah lingkungan, kereta itu dilengkapi teknologi mutakhir untuk memberikan kenyamanan optimal, antara lain anti-tinitus atau denging dan layanan jaringan internet 5G. ”Cukup nyaman untuk dinaiki, lebih mudah dinaiki dibandingkan kereta sebelumnya,” ujar Wu Lihai, penumpang yang pulang dari Hangzhou.',	'1695896101.jpg',	'2023-09-28 10:15:01',	'2023-09-28 10:15:01'),
(5,	1,	2,	'Indonesia Hadapi Perancis di Perempat Final Piala Suhandinata',	'Target pertama tim bulu tangkis Indonesia dalam Kejuaraan Dunia Yunior Beregu Campuran telah tercapai, yaitu dengan menjadi juara grup dalam babak penyisihan. Kini, tiba saatnya skuad Indonesia bersaing dalam fase sistem gugur dengan melawan Perancis dalam perempat final.\r\n\r\nPosisi sebagai juara Grup E ditentukan melalui kemenangan atas Estonia dengan skor 5-0 pada pertandingan keempat bagi setiap tim di The Podium, Spokane, Washington, Amerika Serikat, Rabu (27/9/2023) siang waktu setempat atau Kamis dini hari waktu Indonesia. Dengan tiga kemenangan yang telah didapat setiap tim, yaitu atas Armenia, Georgia, dan Portugal, pertemuan Indonesia dan Estonia menjadi penentu posisi juara dan peringkat kedua grup.\r\n\r\nIndonesia akhirnya berhak menempati posisi teratas Grup E dengan kemenangan 5-0 dari tunggal putra dan putri, ganda putra dan putri, serta ganda campuran. Setiap nomor dimenangi dalam dua gim, seperti pada tiga pertandingan sebelumnya.\r\n\r\nDengan posisi tersebut, Indonesia berhak menjadi salah satu perempat finalis dan akan bertemu juara Grup F, Perancis, dalam babak delapan besar pada Kamis waktu setempat. Perancis menjadi satu-satunya tim dari Eropa yang lolos ke perempat final. Tim ini menjadi yang terbaik di Grup F setelah menang atas Hong Kong, Belgia, Spanyol, dan Ghana.\r\n\r\nPemenang Indonesia melawan Perancis akan bertemu dengan Taiwan atau Thailand pada semifinal. Adapun perempat final pada paruh atas undian mempertemukan China dengan Jepang dan Malaysia dengan India.\r\n\r\nKejuaraan yang memperebutkan Piala Suhandinata ini diikuti 40 tim dari semua zona yang dibagi dalam delapan grup. Pemain yang ikut serta adalah yang berusia 19 tahun ke bawah.\r\n\r\nPersaingan dengan format round robin diterapkan pada penyisihan untuk menentukan posisi di setiap grup. Meski hanya juara grup yang berhak memperebutkan Piala Suhandinata, setiap peserta akan bertanding hingga tersusun urutan ranking dari 1-40.',	'1695896156.jpg',	'2023-09-28 10:15:56',	'2023-09-28 10:15:56'),
(6,	1,	2,	'Jatuh-Bangun Samuel Marbun Belum Mampu Mengantarnya ke Puncak Prestasi Wushu Indonesia',	'ewushu Indonesia, Samuel Marbun, meraih perak pada disiplin pertandingan sanda atau pertarungan kelas 65 kilogram Asian Games 2022 seusai takluk dari pewushu Iran, Afshin Salimi Toupghara. Meskipun belum menjadi yang terbaik, hasil itu telah mencetak sejarah baru untuk wushu Indonesia yang pertama kalinya meraih perak sanda sepanjang keikutsertaan mereka di Asian Games.\r\n\r\n”Kemarin di SEA Games Kamboja 2023 yang menjadi SEA Games pertama saya, saya mendapat medali perak. Di sini, yang menjadi Asian Games pertama saya, saya ingin sekali dapat emas. Tadi, saya coba mengeluarkan semua kemampuan terbaik dan terus berdoa, Tuhan saya ingin dapat emas. Namun, ternyata, Tuhan belum memberikan kesempatan itu,” ujar Samuel sehabis laga di Xiaoshan Guali Sports Centre, Provinsi Zhejiang, Kamis (28/9/2023).\r\n\r\nTak lama dari wasit memberi aba-aba babak pertama dimulai, Samuel langsung tampil agresif. Atlet kelahiran Sihikkit, Sumatera Utara, 4 Oktober 1998, itu pun sukses dua kali membanting lawannya. Situasi itu sempat membuat Toupghara panik dan menoleh ke belakang untuk minta arahan dari pelatihnya.\r\n\r\nUsai itu, keadaan menjadi berbalik. Toupghara coba bermain rapat agar mempersempit ruang gerak tangan Samuel untuk menangkap kakinya dan melakukan bantingan. Toupghara mengombinasikan permainan rapat dengan pukulan dan tendangan yang variatif, terutama menyasar perut yang bisa menghasilkan dua poin atau poin terbesar.\r\n\r\nTekanan demi tekanan itu membuat Samuel nyaris tidak memiliki celah untuk melakukan serangan balik. Merasa tertinggal poin, Samuel nekat bermain lebih terbuka yang justru menyebabkan pertahananya rapuh sehingga mudah dibombardir lawan. Puncaknya, 40 detik sebelum babak pertama berakhir, Toupghara mampu mengangkat kaki dan mendorong Samuel keluar matras utama.\r\n\r\nDi sela jeda babak pertama ke babak kedua, papan skor menunjukkan tiga dari lima juri yang mengawasi di sekeliling arena memberikan Toupghara skor lebih tinggi, satu juri memihak kepada Samuel, dan satu juri menyatakan seri. Maka itu, Toupghara dinyatakan unggul 1-0 di babak pertama.\r\n\r\nMemasuki babak kedua, Samuel setengah mati mengatasi ketertinggalan. Sayangnya, permainan Samuel cenderung monoton. Dia berkali-kali coba menangkap kaki Toupghara guna melakukan bantingan ataupun mendorong keluar matras utama. Kalau lawan dua kali didorong keluar matras utama, atlet bersangkutan akan dinyatakan menang secara langsung.\r\n\r\nStrategi berulang itu sudah dibaca Toupghara yang mampu mengelak atau bertahan agar tidak terbanting. Ada momen Toupghara yang mau dibanting bisa membalikkan keadaan untuk menjatuhkan lawannya lebih dahulu.',	'1695896248.jpg',	'2023-09-28 10:17:28',	'2023-09-28 10:17:28');

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
(1,	'Portal Berita B',	'portalberitab',	'portalberitab@gmail.com',	NULL,	'$2y$10$1lW1IbEL4YxJwmJH58d1D.BpcrYAL7DDOkis0opVuUN/feSXoHVPi',	NULL,	'2023-07-13 09:53:48',	'2023-07-13 09:53:48');

-- 2023-09-28 10:27:32
