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
(1,	'Mode',	'2023-09-19 04:22:18',	'2023-09-19 04:22:18'),
(2,	'Sosok',	'2023-09-28 10:18:57',	'2023-09-28 10:18:57');

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
(1,	1,	1,	'Koleksi ”Rimba” Sejauh Mata Memandang untuk Merawat Hutan',	'Hutan merupakan sumber kehidupan untuk berbagai makhluk hidup. Namun, kondisi hutan di Indonesia yang juga merupakan paru-paru dunia justru tergerus deforestasi. Berbagai cara dilakukan untuk menjaganya, termasuk dengan memilih produk yang ramah lingkungan.\r\n\r\nBertepatan dengan Hari Konservasi Alam Nusantara, jenama Sejauh Mata Memandang kembali bersuara tentang alam melalui koleksi barunya. Koleksi terbaru bertajuk ”Rimba” yang diluncurkan pada 10 Agustus 2023 di kawasan Kemang, Jakarta, ini terinspirasi dari Kawasan Ekosistem Leuser di Aceh Timur.\r\n\r\n”Koleksi ini merupakan sebuah ekspresi dari komitmen Sejauh Mata Memandang dalam upaya menjaga dan melestarikan alam, terutama hutan serta berbagai makhluk yang hidup di dalamnya,” ujar pendiri dan Direktur Kreatif Sejauh Mata Memandang, Chitra Subyakto.\r\n\r\nMengacu data Kementerian Lingkungan Hidup dan Kehutanan, deforestasi Indonesia tahun 2021-2022 turun 8,4 persen dibandingkan hasil pemantauan tahun sebelumnya. Luas lahan berhutan seluruh daratan Indonesia sendiri adalah 96.000 hektar atau 51,2 persen dari total daratan dan deforestasinya sekitar 104.000 hektar.\r\n\r\nPenurunan ini terjadi karena berbagai upaya. Sejauh Mata Memandang dengan Yayasan Hutan, Alam, dan Lingkungan Aceh (Haka) dan Forum Konservasi Leuser pun menginisiasi program restorasi hutan yang bertujuan juga memangkas deforestasi. Perkembangannya, hingga awal tahun 2023 ini, mereka telah berhasil merestorasi area hutan seluas 20 hektar, setara dengan sekitar 8.000 pohon.\r\n\r\n”Inisiatif ini merupakan bentuk kolaborasi kami dengan para Sahabat Sejauh yang telah membeli produk kami, dengan menyumbangkan sebagian dari hasil pembelian mereka untuk program restorasi hutan,” ujar Chitra.\r\n\r\nKoleksi ”Rimba” juga sekaligus menjadi pengingat untuk melestarikan Kawasan Ekosistem Leuser di Aceh Timur yang merupakan tempat terakhir di dunia bagi empat spesies terancam punah untuk dapat hidup berdampingan di alam liar, yaitu gajah sumatera, badak sumatera, harimau sumatera, dan orangutan sumatera.\r\n\r\n”Sudah banyak dari kita yang sadar akan ancaman kepunahan yang dihadapi oleh beberapa spesies makhluk hidup khas Indonesia. Namun, banyak pula yang belum memahami tindakan apa yang bisa dilakukan oleh masyarakat untuk turut andil dalam konservasi hutan tempat bernaungnya flora dan fauna yang terancam. Untuk itu, Sejauh Mata Memandang mengambil inisiatif pelestarian dengan cara yang sederhana dan lebih dekat dengan keseharian masyarakat di Indonesia,” ungkapnya.\r\n\r\nPada koleksi kali ini, Chitra memilih nuansa warna hitam, off-white, serta hijau botol dari pewarna nabati dan juga pewarna buatan bersertifikat. Untuk siluetnya, Sejauh Mata Memandang memang jarang neko-neko mengingat tujuannya agar busana yang dihasilkan dapat dipakai untuk jangka waktu lama dan acara apa saja sehingga tidak menambah tumpukan sampah tekstil akibat fast fashion. Siluet andalannya adalah syal, luaran, baju panjang, baju padma yang merupakan kemeja lengan pendek mirip boxy top, baju santai yang merupakan kemeja untuk pria, dan baju chandra, yaitu kemeja asimetris dengan plisir di bagian bawah.',	'1695889771.jpg',	'2023-09-19 04:26:00',	'2023-09-28 10:20:36'),
(2,	1,	1,	'Kultulibrasi, Resolusi Konflik dalam Balutan Wastra',	'Upaya melestarikan budaya bangsa yang beraneka ragam kerap terjebak dalam berbagai pernyataan normatif tanpa eksekusi nyata. Para desainer merupakan salah satu yang sungguh bertindak. Salah satunya Mel Ahyar lewat pertunjukan Kultulibrasi yang membawakan sejumlah koleksinya.\r\n\r\nHentak tifa dan tiupan fuu mengawali musik yang mengiringi langkah para model membawakan koleksi Rikuriku dari jenama Happa dan XY milik Mel. Unsur dari budaya Papua mendominasi koleksi yang membuka pergelaran Kultulibrasi di City Hall, Pondok Indah Mall 3, Jakarta, Kamis (10/8/2023).\r\n\r\nInspirasinya hadir dari teknik ukiran suku Asmat yang diwujudkan melalui kerangka garis-garis yang membentuk motif floral dan geometris. Permainan motif ini pun dimainkan benang warna-warni yang timbul di atas material katun berwarna merah tanah, putih, dan hitam dari pewarna alami ini pun menegaskan kepiawaian Mel dalam membesut embroideri yang khas.\r\n\r\n”Diterjemahkan untuk yang pertama ini memang gaya kasual anak muda. Bermainnya pada craftmanship, tapi tetap ringan digunakan kapan pun,” tutur Mel sebelum pergelaran berlangsung.\r\n\r\nTak berhenti pada ukiran, kekhasan Papua lain, seperti elemen rumah honai, juga diinterpretasikan dengan unik melalui wujud makrame dan tassel dari benang wol yang menjadi aksesori dipasang bertumpuk di atas kemeja atau gaun atau justru masuk menjadi detail tiap tampilan.\r\n\r\nBerlanjut pada suguhan puncak, yakni rangkaian koleksi Archipelago yang menampilkan gubahan gaya dinamis lewat wastra Nusantara. Apabila koleksi Archipelago pada tahun lalu membaurkan sejumlah wastra melalui tajuk ”Kawin Campur”. Kini, Mel menggarisbawahi tiap wastra untuk berdiri sendiri, tapi dengan modifikasi berani yang menawan dan selaras dengan zaman.\r\n\r\nTiga pakem besar dilandaskan pada asal wastra, yakni Medan, dalam tajuk pertunjukan ”The Melting Pot” yang mengangkat ulos Batak dan songket Melayu. Selain itu, Mel lagi-lagi meneguhkan kekhasannya bermain hiasan benang dan bordir dalam sejumlah busana di sini yang membentuk bangunan ikonik di Kota Medan, seperti Istana Maimun di atas kain menerawang yang dipadukan sebagai luaran untuk tunik panjang berpotongan kerah mirip kebaya encim.\r\n\r\nSuasana makin terasa bak pulang ke kota tempat berbagai suku agama menyatu melalui video yang menampilkan kuil di Kampung Madras, masjid raya, Istana Maimun, rumah Tjong A Fie, Gereja Maria Annai Velangkani, hingga sudut-sudut kota yang menawarkan kuliner khas Medan. Siluet tampilan dalam koleksi yang dihasilkan pun mengadopsi kekhasan busana melayu, India, sampai ke China dengan memanfaatkan ulos dan songket.',	'1695889908.jpg',	'2023-09-28 08:31:48',	'2023-09-28 10:22:16'),
(3,	1,	1,	'Individualitas Para Profesional',	'Sidik jari menjadi penanda identitas setiap pemiliknya. Prinsip ini menjadi perkara ketika dunia mode bicara soal individualitas manusia dalam balutan pakaian profesional. BLZR.ID dan Susan Budihardjo menawarkan sejumlah opsi baru dalam padu padan blazer.\r\n\r\nBlazer berawal sebagai pakaian untuk laki-laki, tetapi kemudian bertransformasi menjadi pakaian lintas gender. Majalah Allure\r\nmenulis, aktris Sarah Bernhardt dari Perancis adalah salah satu perempuan pelopor yang mengenakan setelan jas di publik pada 1870-an.\r\n\r\nMenjelang akhir abad ke-19, blazer berangsur menjadi pakaian umum bagi perempuan yang sekaligus melambangkan pemberdayaan perempuan. Desainer Coco Chanel juga mempopulerkan blazer lewat koleksi tahun 1920-an. Blazer terus bertransformasi dari segi desain dan warna sehingga cocok di luar lingkup formal.\r\n\r\nKolaborasi para desainer beda generasi ini menampilkan 32 set total look (tampilan) dalam trunk show bertajuk Sidik Jari di Open Door, Alam Sutera, Tangerang, Banten, Sabtu (16/9/2023). Berdiri sejak 2014, BLZR.ID terdiri atas duo kakak beradik, Dennice Aulia dan Florine Aulia, yang fokus pada pengembangan blazer.\r\n\r\n\"Setiap orang punya sidik jari yang berbeda. Konsep saya sederhana, tetapi gaya masing-masing orang akan berbeda dengan styling dan karakter. Namanya pakaian ready-to-wear itu diproduksi untuk banyak orang tapi akan tampil beda kalau kita punya sidik jari kuat,” kata Susan.\r\n\r\nKoleksi Sidik Jari mengusung desain blazer dengan potongan oversized alias berukuran terlalu besar. Konsep blazer semacam ini sudah ada sejak tahun 1980-an di mana blazer hadir dengan bantalan bahu besar populer yang menyimbolkan kekuatan.\r\n\r\nBlazer kemudian melebur dalam gaya street style (Kompas, 18/8/2013). Berbeda dengan blazer pas badan yang kaku, blazer kedodoran kini memberi kesan santai, energik, dan bebas. Blazer gaya ini masih menjadi tren di antara pesohor Hollywood sampai sekarang.\r\n\r\nBlazer kedodoran ala BLZR.ID dan Susan Budihardjo bukanlah blazer yang terlihat kebesaran di tubuh pemakai. Garis bahu baju memang melewati beberapa sentimeter bahu pemakai, sedangkan garis pinggang baju cenderung lurus. Namun, panjang lengan baju rata-rata tidak melewati sela jari jempol dan telunjuk. Kesan rapi tetap terpancar.',	'1695889987.jpg',	'2023-09-28 08:33:07',	'2023-09-28 10:23:52'),
(4,	1,	2,	'Hasria, Penyelamat Penyu di Pesisir Majene',	'Pada tahun 2015, Hasria hanyalah anak kelas 8 SMP yang kerap ikut ayahnya mencari telur penyu. Dengan tekun, dia mengamati dan belajar bagaimana telur penyu diselamatkan hingga akhirnya menetas. Dia selalu senang saat telur-telur ini menetas dan ikut melepaskannya ke laut\r\n\r\nDari yang semula hanya mengikuti ayahnya, hampir lima tahun terakhir, konservasi penyu dilakoninya sendiri. Di usianya yang baru 20 tahun, entah sudah berapa ribu tukik yang dilepasliarkan oleh Hasria. Sedikitnya 100-500 tukik dilepas ke laut setiap tahun. Tahun ini, dia melepas 463 ekor tukik dari 11 lubang yang berisi 998 butir telur.\r\n\r\nSejauh ini dia memang belum punya pencatatan terperinci. Yang dia ingat setiap tahun pada musim penyu bertelur antara April dan Juni, sedikitnya ada enam lubang yang akan terisi telur-telur penyu. Pernah mencapai 18 lubang. Setiap lubang terisi sedikitnya 100 butir telur.\r\n\r\n”Memang tidak semua telur yang saya selamatkan akan menetas. Ada yang kena akar pohon. Pernah pula gagal saat bersamaan banjir dan air pasang. Tapi setidaknya setengah dari telur-telur yang saya selamatkan, menetas dan tukik dilepas ke laut,” katanya, Kamis (14/9/2023), di Pantai Barane, Majene, Sulawesi Barat (Sulbar).\r\n\r\nBaginya, mengurusi telur penyu serupa mengurusi hewan peliharaan kesayangan. Bedanya, saat menetas, anakannya dia lepas dengan rasa haru dan bahagia.\r\n\r\nHasria tak pernah belajar khusus perihal penyu. Semua dilakukan dari hasil belajar secara otodidak dan belajar dari pengalaman. Setiap ada penyu yang bertelur, dia akan memindahkan telurnya ke lokasi yang aman dengan membuat lubang baru. Lubang kemudian ditutupi jaring atau pengaman lain yang mengurangi kemungkinan telur dimangsa oleh predator.\r\n\r\nMusim penyu bertelur adalah malam-malam panjang yang harus dilalui Hasria di tepi pantai. Saat orang-orang sekampung lelap dalam mimpi, dia berusaha terjaga. Acap kali dia sendirian di pantai yang berjarak beberapa ratus meter dari rumahnya. Mengendap, tak bersuara kerap harus dilakukan agar penyu tak merasa terganggu.\r\n\r\n”Saya sebenarnya sudah tahu soal lubang tipuan yang dibuat penyu untuk melindungi telurnya. Tanpa menunggui bertelur pun saya tetap bisa tahu di mana lubang yang ada telur. Tapi saya selalu berusaha memindahkan telur secepatnya sebelum digali anjing atau ada kepiting,” katanya.',	'1695896394.jpg',	'2023-09-28 10:19:54',	'2023-09-28 10:19:54'),
(5,	1,	2,	'Greg Atkins, Filosofi Sang Master Trek Motokros',	'Greg Atkins menemukan jalan hidupnya sebagai desainer trek motokros setelah karier balapnya pupus karena kecelakaan parah dalam balapan di Amerika Serikat. Dia baru berusia sekitar 19 tahun saat mulai mengalihkan kemudi hidupnya sebagai perancang trek off-road. Proses panjang dia lalui bermodal ketekunan dan kerja keras karena profesi ini hanya bisa dikuasai dengan matang seiring pengalaman.\r\n\r\n”Ini keahlian yang terasah seiring waktu. Tidak ada sekolah tentang itu. Ini sesuatu yang harus Anda pelajari sepanjang waktu, dan saya beruntung telah menjalani ini lebih dari 20 tahun, jadi saya bisa memiliki pengalaman yang bagus,” ujar Atkins saat membangun trek MXGP seri Lombok di bekas Bandara Selaparang, Mataram, NTB, Selasa (27/6/2023).\r\n\r\nPengalaman lebih dari dua dekade itu menempatkan Atkins pada posisi desainer trek motokros papan atas dunia. Pada 2006-2015 dia menjadi trek desainer Youthstream, promotor MXGP. Dia telah membangun trek-trek Kejuaraan Dunia Motokros MXGP, serta trek untuk Red Bull dalam ajang motokros, superkros, serta balapan di pasir Red Bull Knock Out yang termasyhur. Dia juga membangun trek motokros dan sepeda BMX untuk klub-klub mandiri ataupun perseorangan. Bahkan, pengetahuan dia tentang trek off-road menempatkan dirinya sebagai salah satu pakar saat FIM menyusun regulasi standar trek off-road.\r\n\r\nUntuk mencapai level Atkins itu bukanlah perkara mudah, karena perlu memahami banyak hal secara mandiri, seperti karakter tanah, memiliki keahlian rancang bangun dan arsitektur, mengoperasikan alat berat, menguasai regulasi Federasi Balap Motor Internasional (FIM), serta mampu membaca level kemampuan pebalap yang akan menggunakan trek.\r\n\r\n”Akan lebih bagus jika memiliki latar belakang rancang bangun, arsitektur, karena banyak bagian yang harus dibangun dengan spesifikasi rancang bangun. Juga terkait tanah, Anda harus mempelajari itu berdasarkan yang ditemui di seluruh dunia, tetapi kadang ada halangan besar, sehingga apa yang Anda dapati begitulah adanya,” ujar Atkins.\r\n\r\n”Kami senang mendapat kondisi tanah yang bagus, tetapi kami kadang tidak mendapati itu, jadi kami harus memanfaatkan apa yang ada. Jadi, kami harus siap menghadapi situasi seperti itu. Dan, itu salah satu tantangan dari kejuaraan dunia, semuanya tidak selalu mulus. Para pebalap pun perlu berkendara di trek yang berbeda karakter, dan pebalap yang bagus akan tetap bagus saat mereka memacu motornya,” lanjut Atkins.\r\n\r\nSalah satu trek yang dia sukai adalah sirkuit MXGP Samota di Sumbawa karena berada di lanskap alami yang berbukit-bukit. Begitu melihat lokasi itu, Atkins langsung bisa membayangkan seperti apa trek yang akan dia bangun. Kondisi tanah yang berpasir karena di dekat pantai juga menjadi keunikan trek Samota itu. Para pebalap MXGP seperti Tim Gajser, Jorge Prado, Jeremy Seewer, dan Romain Febvre pun menyukai trek Samota rancangan Atkins.\r\n\r\nSementara trek MXGP Lombok di bekas Bandara Selaparang yang datar dan kosong memiliki tantangan yang berbeda. Atkins merancang trek bersama dengan Gabi Villada yang saat muda menekuni motokros gaya bebas. Diskusi mereka mengerucut pada konsep mengadopsi sirkuit pump track sepeda BMX untuk menyiasati area yang berbentuk persegi panjang.\r\n\r\nTrek artifisial itu pun diakui oleh para pebalap menguras tenaga meskipun pace tidak tinggi karena banyak lompatan dan tikungan. Bahkan, legenda hidup MXGP Antonio Cairoli menilai, trek tersebut sangat berbeda dengan yang biasa dipakai balapan. Manajer tim KTM itu pun berulang kali menyusuri trek Selaparang itu untuk membantu para pebalapnya menyusun strategi.',	'1695896689.jpg',	'2023-09-28 10:21:28',	'2023-09-28 10:24:49'),
(6,	1,	2,	'Beiby Sumanti, Menemani Kaum Papa, dari Bantargebang ke Istana',	'Beiby Sumanti (63) mendekap anak-anak muda untuk menggeluti kolintang dengan berhimpun di Sanggar Bapontar. Ketimbang keluyuran, mabuk-mabukan, atau menjadi kriminalis, mereka mengenyam penghidupan yang bukan ecek-ecek. Para perantau yang hendak mengadu nasib pun diterima dengan tangan terbuka.\r\n\r\nDi sela sore yang cerah, enam musisi memeriahkan Waduk Pluit, Jakarta, dengan harmonisasi kolintangnya. Saat mentari yang beranjak tenggelam memancarkan semburat jingga begitu teduh di ufuk barat, mereka mengajak kerumunan pengunjung untuk turut berdendang.\r\n\r\nSekitar 10 lagu mengalun, seperti ”Sipatokaan”, ”Ampar-ampar Pisang”, ”Soleram”, ”Paku Gelang”, ”Nona Manis”, dan ”Sinanggar Tulo”. Selama hampir 1,5 jam sejak pukul 16.30, mereka juga melantunkan lagu-lagu kekinian semacam ”Ojo Dibandingke”, ”Kopi Dangdut”, dan ”Pergilah Kasih”.\r\n\r\nBeiby tampak mengawasi sambil meladeni warga yang bertanya penasaran dengan keelokan musik asal Sulawesi Utara tersebut. ”Mana yang mau belajar? Foto dulu, yuk,” katanya disambut sekitar 10 anak yang mengacungkan tangan dengan semangat lalu berbaris rapi, Minggu (10/9/2023).\r\n\r\nBeiby menaungi pemain kolintang, berikut penyanyinya dan penari kabasaran. Bersama pengurus-pengurus sanggar, totalnya mencapai lebih dari 100 orang. Bapontar tengah bersiap tampil di hadapan tamu-tamu Discover North Sulawesi di Hotel Borobudur, Jakarta, pekan selanjutnya.\r\n\r\nMereka juga menggelar pertunjukan saat pembukaan Pertemuan Menteri Keuangan dan Gubernur Bank Sentral ASEAN di Hotel Mulia, Jakarta, akhir Agustus 2023. Bapontar sudah unjuk gigi kian kemari tak hanya di gedung megah, tetapi juga hunian kaum papa, bahkan di mana bau busuk menyergap sampai jauh.\r\n\r\nMereka, di antaranya, beraksi di Tempat Pengelolaan Sampah Terpadu Bantargebang, Bekasi, Jawa Barat, tahun 2012. Meski harus memboyong genset dan menahan mual, Beiby dan enam musisi tak kurang gembiranya menyaksikan para pemulung ikut bernyanyi.\r\n\r\n”Pulangnya, saya malah tekor. Saya disodori bon Rp 200.000 atau Rp 300.000 begitu, sama pemilik warung,” tuturnya. Rupanya, pemulung-pemulung mengambil makanan, rokok, dan minuman, tetapi entah mengapa mereka mengira Beiby mentraktirnya. Bukannya jengkel, ia malah tertawa-tawa.\r\n\r\nBapontar pun sejenak menghalau gundah warga yang tinggal di kolong Jembatan Karet dan Jatibaru, Jakarta. Demikian pula dengan pedagang sayur di Pasar Induk Kramatjati, porter di Stasiun Gambir dan Terminal Kampung Rambutan, hingga penjual ikan di Muara Angke yang terhibur.\r\n\r\n”Biar saja kalau belum bisa menarik peserta untuk belajar kolintang, tapi saya senang. Kepuasan karena seenggaknya kolintang lebih dikenal,” ucapnya. Dari Bantargebang ke Istana, Bapontar juga menyajikan aktraksinya di hadapan sejumlah kepala negara.\r\n\r\nPerdana Menteri India Narendra Modi yang melawat pada tahun 2018, umpamanya, tak segan menerabas batas-batas protokoler. Begitu kagumnya dengan lagu yang dibawakan, ia pun beranjak untuk bersalaman dan berfoto hingga tak ayal menimbulkan kehebohan Bapontar.\r\n\r\nSaking girangnya, beberapa penampil sampai nyaris pingsan mencecap asam garam paling mengesankan itu selama Bapontar berdiri. ”Padahal, tinggal tiga hari sebelum tampil, dari New Delhi minta lagu India tahun 1951. Dicari-cari lewat Youtube. Penyanyinya sampai mau nangis,” ujar Beiby sembari tergelak.\r\n\r\nRatu Denmark Margrethe II bersama Pangeran Consort Henrik yang singgah, tahun 2015, tak kalah terpesona hingga menitipkan memo bertuliskan tangan. ”Mereka sampai berhenti makan malam sebentar. Bapontar juga pernah mengiringi kunjungan Presiden Perancis,” katanya.',	'1695896584.jpg',	'2023-09-28 10:23:04',	'2023-09-28 10:23:04');

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
(1,	'Portal Berita C',	'portalberitac',	'portalberitac@gmail.com',	NULL,	'$2y$10$1lW1IbEL4YxJwmJH58d1D.BpcrYAL7DDOkis0opVuUN/feSXoHVPi',	NULL,	'2023-07-13 09:53:48',	'2023-07-13 09:53:48');

-- 2023-09-28 10:27:43
