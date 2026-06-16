# Majulah Shop Mobile

Repositori ini berisi sebuah aplikasi Football Shop sederhana menggunakan Flutter yang dibuat untuk memenuhi tugas individu mata kuliah Pemrograman Berbasis Platform.

<details> 
<summary>Tugas Individu 7</summary>

## 1\. Widget Tree dan Hubungan Parent-Child

**Widget Tree** adalah representasi struktur dari seluruh UI (User Interface) di Flutter. Karena di Flutter semuanya adalah widget, UI dibangun dengan menyusun widget di dalam widget lain. Susunan bersarang (nested) inilah yang membentuk sebuah struktur pohon (tree).

**Hubungan Parent-Child** adalah inti dari widget tree:

- **Parent:** Adalah widget yang berisi widget lain.
- **Child:** Adalah widget yang berada di dalam widget lain.

Hubungan ini sangat penting karena **parent sering kali mengontrol atau memengaruhi child-nya**.

**Contoh:**

```dart
Center( // <-- PARENT
  child: Text( // <-- CHILD
    'Hello, Flutter!',
  ),
)

// Hubungannya: Center (parent) memberi instruksi kepada Text (child) untuk diposisikan di tengah layar. Text sendiri hanya menampilkan teks 'Hello, Flutter!'.
```

## 2\. Widget yang digunakan

### a\. Widget Kustom (Custom Widgets)

- **`MyApp`** (`StatelessWidget`):
  - **Fungsi:** _root widget_ untuk membungkus seluruh aplikasi dengan `MaterialApp` dan mengatur tema global (primary color: Merah).
- **`MyHomePage`** (`StatelessWidget`):
  - **Fungsi:** widget halaman utama untuk membangun seluruh tampilan halaman, termasuk `AppBar`, kartu informasi (NPM, Nama, Kelas), dan `GridView` yang berisi menu (`ItemCard`).
- **`InfoCard`** (`StatelessWidget`):
  - **Fungsi:** Widget kustom untuk menampilkan kartu informasi kecil (seperti NPM, Nama, dan Kelas). Isinya adalah `Card` yang memiliki `Column` untuk menyusun `Text` judul dan `Text` konten.
- **`ItemCard`** (`StatelessWidget`):
  - **Fungsi:** Widget kustom untuk menampilkan satu item menu di dalam `GridView`. Isinya adalah `Material` (untuk warna dan sudut melengkung) yang dibungkus `InkWell` (agar bisa diklik) dan menampilkan `Icon` serta `Text` di dalamnya.

### b\. Widget Struktur & Navigasi

- **`MaterialApp`**:
  - **Fungsi:** Widget utama di `main.dart`, menyediakan banyak fungsionalitas dasar seperti tema (`theme`), navigasi, dan `home` aplikasi ke `MyHomePage`.
- **`Scaffold`**:
  - **Fungsi:** Struktur dasar halaman di `MyHomePage`, menyediakan "kerangka" halaman yang memiliki slot untuk `appBar` dan `body`.
- **`AppBar`**:
  - **Fungsi:** _Bar_ atas berwarna (diambil dari tema) yang ditampilkan di dalam `Scaffold`. Dalam kode ini, fungsinya adalah menampilkan `Text` judul 'Majulah Shop'.
- **`ScaffoldMessenger`**:
  - **Fungsi:** Digunakan (melalui `ScaffoldMessenger.of(context)`) di dalam `ItemCard` untuk menampilkan `SnackBar` (pesan pop-up) di bagian bawah layar ketika sebuah item menu diklik.

### c\. Widget Tata Letak (Layout)

- **`Column`**:
  - **Fungsi:** Menyusun widget-widget child secara **vertikal** (dari atas ke bawah).
  - **Penggunaan:**
    1.  Di `MyHomePage`: Menyusun `Row` (info card), `SizedBox` (jarak), dan `Center` (grid) secara vertikal.
    2.  Di `Center`: Menyusun `Text` sambutan dan `GridView` secara vertikal.
    3.  Di `InfoCard`: Menyusun `Text` judul dan `Text` konten secara vertikal.
    4.  Di `ItemCard`: Menyusun `Icon` dan `Text` nama item secara vertikal.
- **`Row`**:
  - **Fungsi:** Menyusun widget-widget child secara **horizontal** (dari kiri ke kanan).
  - **Penggunaan:** Di `MyHomePage`, digunakan untuk menyusun ketiga `InfoCard` (NPM, Nama, Kelas) secara berdampingan.
- **`Center`**:
  - **Fungsi:** Memosisikan widget child di tengah-tengah area yang tersedia.
  - **Penggunaan:**
    1.  Di `MyHomePage`: Memastikan `Column` (yang berisi teks sambutan dan grid) berada di tengah layar.
    2.  Di `ItemCard`: Memastikan `Column` (ikon dan teks) berada di tengah kartu.
- **`Padding`**:
  - **Fungsi:** Memberikan ruang kosong (jarak) di sekeliling widget child.
  - **Penggunaan:**
    1.  Membungkus `body` utama untuk memberi jarak 16.0 di semua sisi.
    2.  Membungkus `Text` sambutan untuk memberi jarak 16.0 di atasnya.
    3.  Di dalam `ItemCard`, memberi jarak 3.0 antara ikon dan teks.
- **`SizedBox`**:
  - **Fungsi:** Membuat sebuah kotak dengan ukuran tertentu. Sering digunakan sebagai pemberi jarak (spacer).
  - **Penggunaan:**
    1.  Di `MyHomePage`: Memberi jarak vertikal 16.0 antara `Row` info dan `Center`.
    2.  Di `InfoCard`: Memberi jarak vertikal 8.0 antara `Text` judul dan `Text` konten.
- **`GridView`** (via `GridView.count`):
  - **Fungsi:** Menyusun widget-widget child dalam bentuk _grid_. `GridView.count` secara spesifik memungkinkan untuk menentukan jumlah kolom (`crossAxisCount: 3`).

### d\. Widget Kontainer & Tampilan (Containers & Display)

- **`Container`**:
  - **Fungsi:** Sebuah kotak yang bisa diatur `padding`, `width`, `height`, dekorasi, dll.
  - **Penggunaan:**
    1.  Di `InfoCard`: Membungkus `Column` untuk memberi `padding` 16.0 dan mengatur lebarnya (`width`) secara responsif menggunakan `MediaQuery`.
    2.  Di `ItemCard`: Membungkus `Column` (ikon dan teks) untuk memberi `padding` 8.0.
- **`Card`**:
  - **Fungsi:** Membuat sebuah panel (kartu) dengan gaya Material Design, lengkap dengan sudut melengkung dan bayangan (`elevation`).
  - **Penggunaan:** Di `InfoCard`, ini adalah widget dasar yang membungkus konten informasi.
- **`Material`**:
  - **Fungsi:** Menyediakan "permukaan" Material Design.
  - **Penggunaan:** Di `ItemCard`, ini digunakan untuk memberi warna latar belakang (`item.color`) dan membuat sudut melengkung (`borderRadius`) pada kartu menu.
- **`Text`**:
  - **Fungsi:** Menampilkan string (teks) di layar.
  - **Penggunaan:** Digunakan di banyak tempat: menampilkan judul `AppBar`, teks sambutan, judul dan konten di `InfoCard`, serta nama item di `ItemCard`.
- **`Icon`**:
  - **Fungsi:** Menampilkan sebuah ikon grafis.
  - **Penggunaan:** Di `ItemCard`, untuk menampilkan ikon menu (seperti `Icons.shopping_bag`).

### e\. Widget Interaktif (Interactive)

- **`InkWell`**:
  - **Fungsi:** Membuat widget anaknya menjadi interaktif (bisa diklik) dan memberikan _ripple effect_ khas Material Design saat disentuh.
  - **Penggunaan:** Di `ItemCard`, ini membungkus `Container` agar seluruh area kartu bisa diklik (`onTap`) untuk memunculkan `SnackBar`.

## 3\. Fungsi MaterialApp

`MaterialApp` adalah widget fundamental yang membungkus banyak fungsionalitas inti yang dibutuhkan oleh sebagian besar aplikasi. Widget ini mengimplementasikan **Material Design**, yaitu sistem desain visual dari Google.

**Fungsi utamanya adalah menyediakan:**

1.  **Navigasi (Routing):** Mengelola tumpukan layar (pages/routes) sehingga bisa berpindah antar halaman (misalnya, `Navigator.push`).
2.  **Theming (Tema):** Menyediakan data tema (seperti warna primer, jenis font, tema mode gelap/terang) ke seluruh widget di bawahnya.
3.  **Lokalisasi (i18n):** Dukungan untuk berbagai bahasa dan format regional.
4.  **Builder Dasar:** Menyediakan fungsionalitas dasar yang diharapkan oleh widget Material lain (seperti `Scaffold`, `AppBar`, `Dialog`).

**Mengapa sering jadi Root Widget?**
`MaterialApp` digunakan sebagai _root_ dari aplikasi karena widget-widget lain di dalam aplikasi (seperti `Scaffold` atau `TextButton`) perlu "mencari ke atas" (lookup) di dalam widget tree untuk menemukan dan menggunakan fungsionalitas inti ini (seperti `Navigator` atau `ThemeData`).

Jika aplikasi tidak dibungkus dengan `MaterialApp` (atau `CupertinoApp` untuk gaya iOS), banyak widget umum tidak akan berfungsi dengan benar.

## 4\. StatelessWidget vs. StatefulWidget

Ini adalah perbedaan paling mendasar dalam membangun widget di Flutter.

### StatelessWidget

- **Apa itu?** Widget yang **tidak dapat diubah (immutable)**. Setelah dibuat, properti dan tampilannya tidak bisa berubah _dari dalam dirinya sendiri_.
- **Karakteristik:** Tidak memiliki "State" (keadaan) internal. Tampilannya murni ditentukan oleh konfigurasi yang diterimanya dari parent-nya.
- **Metode Utama:** `build()`.
- **Kapan digunakan?** Gunakan **StatelessWidget** saat UI _tidak perlu berubah_ berdasarkan interaksi pengguna atau data internal. Contoh: Ikon, label teks statis, atau tombol yang hanya melaporkan klik tapi tidak mengubah tampilannya sendiri.

### StatefulWidget

- **Apa itu?** Widget yang **dapat diubah (mutable)** dan dinamis. Tampilannya bisa berubah selama _runtime_ (saat aplikasi berjalan).
- **Karakteristik:** Memiliki objek `State` internal yang bisa menyimpan data. Ketika data di dalam `State` berubah (dengan memanggil `setState()`), Flutter akan **membangun ulang (rebuild)** widget tersebut dengan data baru.
- **Metode Utama:** `createState()` (untuk membuat objek State) dan `build()` (di dalam kelas State).
- **Kapan digunakan?** Gunakan **StatefulWidget** saat UI perlu berubah. Contoh: Checkbox yang bisa dicentang, slider yang bisa digeser, _text field_ tempat pengguna mengetik, atau layar yang menampilkan data yang sedang di-load dari internet.

**Singkatnya:** Jika widget perlu "mengingat" sesuatu (seperti dicentang atau tidak, teks yang sedang diketik, atau data yang sedang dimuat), gunakan `StatefulWidget`. Jika tidak, gunakan `StatelessWidget`.

## 5\. BuildContext

**Apa itu BuildContext?**
`BuildContext` adalah "lokasi" atau "alamat" dari sebuah widget di dalam widget tree. Setiap widget mendapatkan `BuildContext`-nya sendiri sebagai parameter di dalam metode `build(BuildContext context)`.

**Mengapa Penting?**
`BuildContext` sangat penting karena inilah cara sebuah widget berinteraksi dengan widget lain di dalam tree, terutama dengan **ancestors (parent-parent di atasnya)**.

Ia digunakan untuk "meminta" atau "mencari" layanan atau data dari widget yang berada _di atasnya_ dalam tree.

**Bagaimana Penggunaannya di Metode `build`?**
Di dalam metode `build`, menggunakan `context` digunakan untuk:

1.  **Mendapatkan Tema:**
    `Theme.of(context).primaryColor`
2.  **Navigasi:**
    `Navigator.of(context).push(newPage)`
3.  **Menampilkan SnackBar:**
    `ScaffoldMessenger.of(context).showSnackBar(...)`

Tanpa `BuildContext`, sebuah widget akan terisolasi dan tidak tahu di mana posisinya atau bagaimana cara mengakses layanan utama seperti Tema atau Navigator.

## 6\. Hot Reload vs. Hot Restart

Ini adalah dua fitur produktivitas utama di Flutter.

### Hot Reload

- **Apa itu?** Proses menginjeksikan file kode Dart yang sudah diperbarui ke dalam **Dart Virtual Machine (VM)** yang sedang berjalan.
- **Bagaimana cara kerjanya?** Flutter akan **membangun ulang (rebuild)** widget tree dengan cepat.
- **Apa yang terjadi?**
  - UI diperbarui secara instan (biasanya dalam \< 1 detik).
  - **State (keadaan) aplikasi tetap terjaga.** Jika sedang mengisi formulir di halaman ketiga, tampilan akan tetap di halaman ketiga dan teks di formulir itu tidak hilang.
- **Kapan digunakan?** Sempurna untuk mengubah UI, memperbaiki layout, mengubah warna, atau logika tampilan.

### Hot Restart

- **Apa itu?** Proses memuat ulang seluruh kode aplikasi dan **memulai ulang Dart VM**.
- **Bagaimana cara kerjanya?** Ini seperti menghentikan dan menjalankan ulang aplikasi, tetapi jauh lebih cepat daripada "Full Restart" (menutup paksa aplikasi).
- **Apa yang terjadi?**
  - UI diperbarui dengan kode terbaru.
  - **State (keadaan) aplikasi di-reset.** Aplikasi akan kembali ke keadaan awal (halaman utama), dan semua data di memori hilang.
- **Kapan digunakan?** Ini digunakan ketika perubahan terlalu besar untuk Hot Reload, misalnya:
  - Mengubah data `static` atau global.
  - Mengubah konstruktor widget yang sudah ada.
  - Jika Hot Reload gagal atau aplikasi menjadi janggal setelah Hot Reload.

**Ringkasan Perbedaan:**

| Fitur           | Kecepatan              | State Aplikasi     | Kapan Digunakan                                              |
| :-------------- | :--------------------- | :----------------- | :----------------------------------------------------------- |
| **Hot Reload**  | Sangat Cepat (\< 1d)   | **Tetap Terjaga**  | Perubahan UI, layout, logika minor.                          |
| **Hot Restart** | Cepat (beberapa detik) | **Direset/Hilang** | Perubahan besar, mengubah state, atau saat Hot Reload gagal. |

</details>

<details> 
<summary>Tugas Individu 8</summary>

### 1. Perbedaan `Navigator.push()` dan `Navigator.pushReplacement()`

Kedua metode ini digunakan untuk berpindah antar halaman (Route), namun memiliki perilaku yang berbeda terhadap _stack_ (tumpukan) navigasi.

- **`Navigator.push()`**: Menambahkan rute baru ke _atas_ stack navigasi saat ini. Pengguna dapat kembali ke halaman sebelumnya dengan menekan tombol _back_ (di Android) atau tombol kembali di `AppBar`.

  - **Kapan digunakan di Majulah Shop?** Gunakan ini ketika pengguna bisa kembali ke halaman sebelumnya. Contohnya, jika pengguna menekan salah satu produk untuk melihat detailnya, gunakan `push()` agar mereka bisa kembali ke daftar produk setelah selesai melihat detail.

- **`Navigator.pushReplacement()`**: Mengganti rute saat ini dengan rute baru di stack navigasi. Halaman sebelumnya dibuang dari stack, sehingga pengguna _tidak bisa_ kembali ke halaman tersebut dengan tombol _back_.
  - **Kapan digunakan di Majulah Shop?** Ini sangat tepat digunakan untuk navigasi menu utama seperti yang sudah diimplementasikan di `LeftDrawer` dan `ItemCard` untuk "Create Product". Saat berpindah dari halaman "Home" ke "Create Product" melalui drawer, tombol _back_ membawa pengguna kembali ke menu drawer yang terbuka, melainkan langsung keluar aplikasi atau ke halaman utama yang sebenarnya.

### 2. Pemanfaatan Hierarchy Widget untuk Konsistensi

Dalam aplikasi Majulah Shop, kombinasi `Scaffold`, `AppBar`, dan `Drawer` digunakan untuk menciptakan kerangka (skeleton) halaman yang seragam:

- **`Scaffold`**: Ini adalah fondasi utama setiap halaman. Baik `MyHomePage` maupun `ProductFormPage` menggunakan widget ini sebagai root dari tampilan. `Scaffold` menyediakan struktur dasar visual Material Design yang secara otomatis mengatur penempatan `AppBar`, `body`, dan `drawer`.
- **`AppBar`**: Dengan menggunakan `AppBar` di dalam `Scaffold` pada setiap halaman memastikan setiap layar memiliki judul di posisi yang sama. Di `menu.dart`, `AppBar` menampilkan judul "Majulah Shop", sedangkan di `product_form.dart` menampilkan "Add Product Form". Konsistensi ini memudahkan pengguna mengenali konteks halaman.
- **`Drawer` (LeftDrawer)**: Dengan menggunakan widget yang sama pada properti `drawer` di kedua halaman (`MyHomePage` dan `ProductFormPage`) menjamin menu navigasi selalu sama dimanapun pengguna berada.

### 3. Kelebihan Layout Widget pada Form

Dalam desain antarmuka, khususnya form, widget layout berikut sangat penting:

- **`Padding`**: Memberikan jarak antara elemen dengan elemen lain atau dengan tepi layar agar tampilan tidak terkesan padat dan lebih mudah dibaca.
  - _Contoh di aplikasi:_ Setiap `TextFormField` (seperti Name, Price, Description) dengan `Padding(padding: const EdgeInsets.all(8.0), ...)` agar input field tidak menempel satu sama lain dan memiliki ruang.
- **`SingleChildScrollView`**: Memungkinkan konten untuk di-_scroll_ jika ukurannya melebihi tinggi layar. Ini sangat krusial untuk form, karena saat keyboard muncul di ponsel, area layar yang terlihat menjadi kecil. Tanpa widget ini, akan muncul error _overflow_ (garis kuning-hitam).
  - _Contoh di aplikasi:_ Seluruh isi form di `ProductFormPage` dengan `SingleChildScrollView` agar pengguna tetap bisa mengisi form meski menggunakan perangkat berlayar kecil.
- **`ListView`**: Mirip dengan `SingleChildScrollView` tetapi lebih optimal untuk daftar item yang panjang atau dinamis.
  - _Contoh di aplikasi:_ `LeftDrawer` untuk menyusun daftar menu navigasi (`ListTile` untuk Home dan Create Product) secara vertikal.

### 4. Penyesuaian Warna Tema (Branding)

Penyesuaian warna tema agar aplikasi memiliki identitas visual yang konsisten dilakukan secara terpusat melalui widget `MaterialApp` di file `main.dart`.

- **Tema Global:** Warna tema didefinisikan melalui `ThemeData` di `main.dart` dengan menggunakan `ColorScheme.fromSwatch(primarySwatch: Colors.red)` yang menjadi warna dasar brand toko.
- **Penerapan pada Widget:**
  - **AppBar:** Di `menu.dart`, `AppBar` dikonfigurasi untuk mengambil warna langsung dari skema tema utama menggunakan `Theme.of(context).colorScheme.primary`.
  - **Drawer:** Bagian header pada `LeftDrawer` juga diatur langsung dari tema global, memastikan untuk selalu selaras jika warna brand utama berubah.
  - **Form Halaman:** Halaman `ProductFormPage` menyesuaikan identitas visual dengan menggunakan `Colors.redAccent` pada `AppBar` untuk tetap memberikan nuansa merah yang konsisten.
  </details>

<details> 
<summary>Tugas Individu 9</summary>

## 1. Model Dart vs. `Map<String, dynamic>`

Saat mengambil data JSON dari API (seperti yang terlihat di `all_product_list.dart`), data tersebut tiba sebagai `Map<String, dynamic>` setelah di-_decode_. Menggunakan _map_ ini secara langsung di seluruh aplikasi memiliki konsekuensi serius:

- **Validasi Tipe (Type Safety):**

  - **Tanpa Model:** `Map` tidak menjamin tipe data. Saat mengakses `data['price']`, tidak ada jaminan apakah itu `int`, `double`, atau `String`. Kesalahan asumsi tipe (misal, melakukan `data['price'] + 100` saat `data['price']` adalah `String "15000"`) akan menyebabkan _crash_ saat aplikasi berjalan (_runtime error_).
  - **Dengan Model:** Sebuah model (seperti `ProductEntry` di `all_product_list.dart`) mendefinisikan tipe data secara eksplisit (misal `final int price;`). Proses _parsing_ di dalam `factory ProductEntry.fromJson(Map<String, dynamic> json)` menangani konversi dan validasi di satu tempat. Jika data API tidak sesuai, kegagalan terjadi secara terkendali saat _parsing_, bukan secara acak di UI.

- **Null-Safety:**

  - **Tanpa Model:** Tidak ada jaminan _key_ ada. Mencoba mengakses `data['description']` padahal _key_-nya tidak ada akan mengembalikan `null`. Jika kode selanjutnya mencoba menggunakan nilai ini (misal `data['description'].toUpperCase()`), aplikasi akan _crash_ (_NullPointerException_).
  - **Dengan Model:** Model secara jelas mendefinisikan apa yang boleh `null` (misal `final String? description;`) dan apa yang tidak boleh (misal `final String name;`). _Compiler_ Dart kemudian akan memaksa penanganan nilai _nullable_ dengan aman di seluruh aplikasi.

- **Maintainability (Perawatan Kode):**
  - **Tanpa Model:** Akses data menggunakan _string_ literal (misal `data['product_name']`). Jika terjadi salah ketik (`data['prodct_name']`), _compiler_ tidak akan tahu, dan data hanya akan `null` (sulit di-debug).
  - **Dengan Model:** Akses data menggunakan properti (misal `product.product_name`). Jika terjadi salah ketik (`product.prodct_name`), _compiler_ akan langsung memberi tahu "Error: Properti tidak ditemukan" _sebelum_ aplikasi dijalankan. Ini juga memungkinkan _autocomplete_ di IDE.

## 2. Fungsi `http` vs. `CookieRequest`

- **Package `http`:**

  - Ini adalah _client_ HTTP dasar. Fungsinya adalah sebagai "mesin" untuk mengirim permintaan (GET, POST, dll.) ke URL dan menerima respons.
  - Paket ini bersifat **stateless**. Setiap panggilan (`http.get(...)`) adalah transaksi independen. Ia tidak "mengingat" panggilan sebelumnya. Jika _login_ berhasil pada satu panggilan POST, panggilan GET berikutnya tidak akan tahu status _login_ tersebut.

- **`CookieRequest` (dari `pbp_django_auth`):**
  - Ini adalah _wrapper_ (pembungkus) yang **mengelola state (keadaan) autentikasi**.
  - Peran utamanya adalah menangani _cookie_ sesi secara otomatis.
  - Saat fungsi `request.login` (seperti di `login.dart`) berhasil, _server_ Django akan mengirim _header_ `Set-Cookie` berisi `sessionid`. `CookieRequest` akan **menyimpan** _cookie_ ini.
  - Untuk semua permintaan berikutnya (seperti `request.get` di `all_product_list.dart` atau `request.postJson` di `register.dart`), `CookieRequest` akan **secara otomatis melampirkan** _cookie_ yang tersimpan itu.
  - Django kemudian menerima _cookie_ ini, mengenali sesi pengguna, dan memberikan akses ke data yang dilindungi.

**Perbedaan Peran:** `http` adalah kurir yang hanya mengantar paket satu kali. `CookieRequest` adalah kurir yang sama, tetapi juga memegang "kartu akses" (cookie) dan menunjukkannya setiap kali diperlukan untuk masuk ke gedung (server).

## 3. Pentingnya Membagikan _Instance_ `CookieRequest`

_Instance_ `CookieRequest` perlu dibagikan ke semua komponen karena _instance_ inilah yang **menyimpan state (keadaan) login**, yaitu _cookie_ sesi.

- **Apa yang terjadi jika _tidak_ dibagikan?**

  1.  Di `LoginPage`, sebuah `CookieRequest` **(Instance A)** dibuat.
  2.  Pengguna _login_. `Instance A` menerima dan menyimpan `sessionid`.
  3.  Aplikasi pindah ke `AllProductListPage`.
  4.  `AllProductListPage` membuat `CookieRequest` baru **(Instance B)**.
  5.  `Instance B` tidak memiliki `sessionid` yang didapat oleh `Instance A`.
  6.  Saat `Instance B` mencoba mengambil data (`request.get`), Django akan merespons "401 Unauthorized" karena permintaan tersebut tidak memiliki _cookie_ autentikasi.

- **Dengan berbagi _instance_ (misal menggunakan `Provider`):**
  `LoginPage` dan `AllProductListPage` sama-sama mengakses _instance_ yang sama melalui `context.watch<CookieRequest>()`. Saat `LoginPage` _login_, _cookie_ disimpan di _instance_ tersebut. Saat `AllProductListPage` melakukan `request.get`, ia menggunakan _instance_ yang sama, yang sudah memiliki _cookie_, sehingga autentikasi berhasil.

## 4. Konfigurasi Konektivitas Flutter ke Django

Konfigurasi ini penting untuk menjembatani komunikasi antara _client_ (Flutter) dan _server_ (Django).

- **`10.0.2.2` di `ALLOWED_HOSTS`:**

  - **Mengapa?** Saat aplikasi Flutter berjalan di Android Emulator, `localhost` atau `127.0.0.1` merujuk ke _emulator itu sendiri_, bukan ke _host machine_ (laptop/PC) tempat server Django berjalan. Android menyediakan alamat IP alias `10.0.2.2` untuk "menjangkau keluar" dari emulator ke `localhost` milik _host machine_.
  - **Konsekuensi:** Jika tidak ditambahkan, Django akan menerima permintaan dari _host_ `10.0.2.2`, yang tidak ada dalam daftar `ALLOWED_HOSTS`. Django akan memblokir permintaan ini dengan _error_ "DisallowedHost".

- **Mengaktifkan CORS (Cross-Origin Resource Sharing):**

  - **Mengapa?** Ini adalah fitur keamanan _browser_. Untuk Flutter Web, _client_ (misal `localhost:5000`) memiliki _origin_ (domain) yang berbeda dari _server_ (misal `localhost:8000`). CORS adalah cara server Django memberi tahu _browser_ bahwa "Domain `localhost:5000` diizinkan meminta data."
  - **Konsekuensi:** Tanpa konfigurasi CORS yang benar di Django, _browser_ akan memblokir permintaan _cross-origin_ dari Flutter Web, dan akan muncul _error_ CORS di _console browser_.

- **Pengaturan `SameSite`/Cookie:**

  - **Mengapa?** Ini adalah atribut keamanan _cookie_ untuk mencegah serangan CSRF. _Browser_ modern mungkin membatasi pengiriman _cookie_ antar domain yang berbeda. Untuk autentikasi _cross-origin_ (Flutter Web), pengaturan seperti `SameSite='None'` dan `Secure=True` (memerlukan HTTPS) mungkin diperlukan agar _browser_ mau mengirim `sessionid`.
  - **Konsekuensi:** Jika konfigurasi salah, _browser_ mungkin tidak akan mengirimkan `sessionid` kembali ke Django, sehingga Django menganggap pengguna belum _login_ di setiap permintaan.

- **Izin Akses Internet di Android (`AndroidManifest.xml`):**
  - **Mengapa?** Aplikasi Android berjalan di dalam _sandbox_ yang aman dan tidak diizinkan mengakses internet secara _default_ untuk melindungi privasi. Menambahkan `<uses-permission android:name="android.permission.INTERNET" />` secara eksplisit memberikan izin tersebut.
  - **Konsekuensi:** Tanpa izin ini, _sistem operasi_ Android akan memblokir semua upaya aplikasi Flutter untuk melakukan panggilan jaringan. Aplikasi tidak akan pernah bisa menghubungi server Django, dan akan gagal dengan _error_ jaringan (misal, _SocketException_).

## 5. Mekanisme Pengiriman Data (Input ke Display)

Berikut alur pengiriman data, misalnya saat **Register**:

1.  **Input (Flutter):** Pengguna memasukkan `username`, `password1`, dan `password2` ke dalam `TextFormField` di `RegisterPage`.
2.  **Event (Flutter):** Pengguna menekan tombol "Register". Fungsi `onPressed` dipanggil.
3.  **Serialisasi (Flutter):** Data dari _controller_ diambil dan disusun menjadi sebuah `Map`. `Map` ini diubah menjadi _string_ JSON menggunakan `jsonEncode`.
4.  **Request (Flutter):** `CookieRequest` (via `request.postJson`) mengirimkan _string_ JSON tersebut sebagai _body_ dari HTTP POST ke _endpoint_ Django (`/auth/register/`).
5.  **Processing (Django):** _View_ `register` di `views.py` menerima permintaan. Ia mem-parsing _body_ JSON (`json.loads(request.body)`).
6.  **Validasi & Database (Django):** _View_ melakukan validasi (misal, password cocok, username belum ada). Jika lolos, `User.objects.create_user(...)` dipanggil untuk membuat dan menyimpan pengguna baru di _database_.
7.  **Response (Django):** _View_ membuat `JsonResponse` (misal `{"status": "success", ...}`) dan mengirimkannya kembali ke Flutter sebagai balasan.
8.  **State Update (Flutter):** Flutter (di `register.dart`) menerima respons. Jika `response['status'] == 'success'`, aplikasi menampilkan `SnackBar` dan melakukan navigasi (`Navigator.pushReplacement`) ke `LoginPage`.

Alur serupa terjadi saat mengambil data: `request.get` dikirim (`all_product_list.dart`), Django merespons dengan JSON _list_ produk, Flutter mengubah JSON itu menjadi `List<ProductEntry>` menggunakan `ProductEntry.fromJson`, dan `FutureBuilder` menampilkannya di layar.

## 6. Mekanisme Autentikasi (Login, Register, Logout)

Mekanisme ini diatur oleh _file_ `views.py` di Django dan `login.dart`/`register.dart` di Flutter.

### Register

1.  **Flutter (`RegisterPage`):** Mengirim `username`, `password1`, dan `password2` sebagai JSON _body_ ke `/auth/register/`.
2.  **Django (`views.py` - `register`):** Menerima JSON, memvalidasi data (password harus cocok, username unik). Jika valid, `User.objects.create_user()` dipanggil untuk membuat akun baru.
3.  **Respon:** Django mengirim `JsonResponse` berisi status sukses. Flutter menampilkan `SnackBar` dan mengarahkan ke `LoginPage`.

### Login

1.  **Flutter (`LoginPage`):** Mengirim `username` dan `password` menggunakan `request.login` ke `/auth/login/`. (Ini adalah _helper_ dari `pbp_django_auth` yang mengirim data sebagai `form-data`).
2.  **Django (`views.py` - `login`):** Menerima data. `authenticate()` digunakan untuk memverifikasi kredensial.
3.  **Kunci Sesi:** Jika `authenticate()` berhasil, fungsi `auth_login(request, user)` dipanggil. Fungsi inilah yang **membuat _session_** di _database_ Django dan **mengirim _header_ `Set-Cookie`** (berisi `sessionid`) kembali ke _client_ sebagai bagian dari respons.
4.  **Respon:** Django mengirim `JsonResponse` (misal `{"status": True, ...}`).
5.  **Flutter (`CookieRequest`):** _Instance_ `CookieRequest` secara otomatis "menangkap" _header_ `Set-Cookie` dan **menyimpan `sessionid`** di dalam dirinya. Properti `request.loggedIn` kini menjadi `true`.
6.  **Flutter (`LoginPage`):** Kode di `login.dart` memeriksa `if (request.loggedIn)`. Karena `true`, `Navigator.pushReplacement` dieksekusi untuk masuk ke `MyHomePage`.

### Logout

1.  **Flutter:** (Diasumsikan) Tombol _logout_ memanggil fungsi `request.logout` (dari `pbp_django_auth`) yang mengirim permintaan ke `/auth/logout/` (sesuai `urls.py`). `CookieRequest` **otomatis melampirkan** `sessionid` yang tersimpan.
2.  **Django (`views.py` - `logout`):** Menerima permintaan. Karena ada `sessionid`, Django tahu siapa `request.user`. Fungsi `auth_logout(request)` dipanggil.
3.  **Pemusnahan Sesi:** `auth_logout` menghapus _session_ dari _database_ Django, membuat `sessionid` yang lama tidak valid.
4.  **Respon:** Django mengirim `JsonResponse` status sukses dan biasanya juga mengirim _header_ `Set-Cookie` untuk membersihkan _cookie_ di sisi _client_.
5.  **Flutter (`CookieRequest`):** _Instance_ `CookieRequest` menghapus `sessionid` yang disimpannya. Properti `request.loggedIn` menjadi `false`.
6.  **Flutter:** Aplikasi mengarahkan pengguna kembali ke `LoginPage`.

Tentu. Berikut adalah langkah-langkah implementasi untuk membangun fungsionalitas yang dibahas (autentikasi dan pengambilan data) dari awal, dengan mengintegrasikan _file-file_ yang disediakan.

---

## 7. Implementasi Step-by-Step

Proses ini dapat dibagi menjadi tiga fase utama: penyiapan Backend (Django), penyiapan Frontend (Flutter), dan implementasi fitur.

### 1\. 🏛️ Fase Backend: Penyiapan Endpoint Django

Langkah awal adalah memastikan _server_ siap menerima permintaan.

1.  **Membuat Aplikasi Autentikasi:** Di proyek Django, sebuah aplikasi baru (misal `authentication`) dibuat.
2.  **Definisi URL (`urls.py`):**
    - Endpoint untuk _register_, _login_, dan _logout_ didefinisikan dalam `authentication/urls.py`.
    - Path ini (`/login/`, `/register/`, `/logout/`) akan menjadi target URL yang dipanggil oleh Flutter.
3.  **Implementasi Views (`views.py`):**
    - **Register:** Dibuat _view_ `register` yang menangani `POST`. _View_ ini mem-parsing _body_ JSON, memeriksa kecocokan _password_, dan memastikan _username_ unik sebelum membuat pengguna baru via `User.objects.create_user`.
    - **Login:** Dibuat _view_ `login`. _View_ ini menggunakan `authenticate` untuk memvalidasi kredensial. Jika berhasil, `auth_login` dipanggil. Ini adalah langkah krusial yang **membuat sesi** di _database_ dan **mengirim _header_ `Set-Cookie`** ke _client_ (Flutter).
    - **Logout:** Dibuat _view_ `logout` yang memanggil `auth_logout`. Ini menghapus data sesi di _server_, membuat `sessionid` yang ada menjadi tidak valid.
    - **Data Products:** Dibuat _view_ terpisah (misal di `main/views.py`, tidak ditampilkan) yang mengambil semua objek _Product_, men-serialisasinya, dan mengembalikannya sebagai `JsonResponse` (seperti yang dituju oleh `all_product_list.dart`).

### 2\. 🌉 Fase Konfigurasi: Menghubungkan Keduanya

Sebelum _coding_ di Flutter, konektivitas harus dipastikan.

1.  **Konfigurasi Django (`settings.py`):**
    - `'10.0.2.2'` ditambahkan ke `ALLOWED_HOSTS`. Ini penting agar _server_ Django tidak menolak permintaan yang datang dari Android Emulator.
    - _Middleware_ CORS (seperti `django-cors-headers`) diinstal dan dikonfigurasi untuk mengizinkan _origin_ dari _client_ Flutter (penting untuk Flutter Web).
2.  **Konfigurasi Flutter (Android):**
    - Izin internet ditambahkan ke `android/app/src/main/AndroidManifest.xml` (`<uses-permission android:name="android.permission.INTERNET" />`). Tanpa ini, OS Android akan memblokir semua panggilan jaringan.

### 3\. 📱 Fase Frontend: Implementasi Fitur Flutter

1.  **Instalasi & Setup State:**

    - _Package_ `pbp_django_auth` dan `provider` ditambahkan ke `pubspec.yaml`.
    - Di `main.dart`, aplikasi dibungkus dengan `Provider` untuk `CookieRequest`. Ini menciptakan **satu _instance_ `CookieRequest`** yang akan dibagikan ke seluruh aplikasi.

    <!-- end list -->

    ```dart
    // Di main.dart
    Provider(
        create: (_) {
            CookieRequest request = CookieRequest();
            return request;
        },
        child: MaterialApp(...)
    )
    ```

2.  **Implementasi Model (`product_entry.dart`):**

    - Dibuat _class_ `ProductEntry` untuk me-model-kan data produk.
    - Dibuat _factory constructor_ `ProductEntry.fromJson(Map<String, dynamic> json)`. Ini adalah "penerjemah" yang mengubah `Map` dari JSON menjadi objek Dart yang aman secara tipe (_type-safe_).

3.  **Implementasi Register (`register.dart`):**

    - UI dibuat menggunakan `TextFormField` dan _controller_ untuk mengambil input.
    - Di dalam `onPressed` _button_, _instance_ `CookieRequest` diambil menggunakan `context.watch<CookieRequest>()`.
    - Sebuah `Map` dibuat, lalu diubah menjadi _string_ JSON menggunakan `jsonEncode`.
    - `request.postJson(".../auth/register/", ...)` dipanggil dengan URL dari `urls.py` dan _body_ JSON.
    - Respons diperiksa: jika `status == 'success'`, `SnackBar` ditampilkan dan navigasi ke `LoginPage` dilakukan menggunakan `Navigator.pushReplacement`.

4.  **Implementasi Login (`login.dart`):**

    - UI dibuat dengan `TextField` untuk _username_ dan _password_.
    - `CookieRequest` diambil menggunakan `context.watch<CookieRequest>()`.
    - `request.login(".../auth/login/", ...)` dipanggil. _Package_ `pbp_django_auth` menangani pengiriman data _form_ dan **secara otomatis menyimpan _cookie_** yang diterima dari Django.
    - Status diperiksa: `if (request.loggedIn)` akan menjadi `true` jika `auth_login` di Django berhasil.
    - Jika berhasil, `Navigator.pushReplacement` digunakan untuk memindahkan pengguna ke `MyHomePage` (menu utama).

5.  **Implementasi Tampil Data (`all_product_list.dart` dan `my_product_list.dart`):**

    - Halaman ini dibuat sebagai `StatefulWidget`.
    - Dibuat fungsi `Future<List<ProductEntry>> fetchNews(CookieRequest request)`:
      - Fungsi ini memanggil `await request.get('.../json/')`. Karena `request` adalah _instance_ yang sama dengan yang digunakan saat _login_, _cookie_ sesi akan terkirim secara otomatis.
      - Data JSON di-loop, dan `ProductEntry.fromJson(d)` digunakan untuk membuat daftar objek model.
    - Di dalam `build`, `FutureBuilder` digunakan.

      - `future:` diatur untuk memanggil `fetchNews(request)`, di mana `request` didapat dari `context.watch<CookieRequest>()`.
      - _Builder_ menangani status _snapshot_: menampilkan `CircularProgressIndicator` saat memuat, dan `ListView.builder` untuk menampilkan data jika `snapshot.hasData`.

      Tidak seperti `all_product_list.dart` yang menampilkan _semua_ produk, `my_product_list.dart` dirancang untuk menampilkan produk yang "dimiliki" oleh pengguna yang sedang _login_.

      Cara implementasinya adalah sebagai berikut:

      1.  **Mengambil Semua Data:** Sama seperti sebelumnya, _file_ ini tetap memanggil _endpoint_ yang sama: `await request.get('http://localhost:8000/json/')`. Ini berarti aplikasi Flutter **tetap mengunduh _seluruh_ daftar produk** dari _database_.

      2.  **Mengidentifikasi Pengguna:** Ini adalah langkah kuncinya. Setelah data diterima, kode mengambil nama pengguna yang sedang _login_ dari _instance_ `CookieRequest` itu sendiri: `final String? loggedInUsername = request.jsonData['username'];`.

          - Data `username` ini kemungkinan besar disimpan di dalam `request.jsonData` saat proses _login_ berhasil (seperti yang terlihat di `login.dart`, di mana respons _login_ berisi _field_ `username`).

      3.  **Melakukan Pemfilteran (Filtering):** Saat melakukan _looping_ pada semua data (`for (var d in data)`), ditambahkan sebuah kondisi `if`.

      4.  **Logika Kondisi:** `if (d['username'] == loggedInUsername)`.

          - Hanya produk yang _field_ `username`-nya (yang didapat dari JSON) **cocok** dengan `loggedInUsername` (yang disimpan di `CookieRequest`) yang akan diproses dan ditambahkan ke `myProductList`.
          - Jika pengguna tidak _login_ (`loggedInUsername == null`), fungsi ini akan mengembalikan daftar kosong `[]`.

      5.  **Menampilkan Hasil:** `FutureBuilder` kemudian hanya me-render `myProductList` yang berisi produk yang sudah difilter tersebut, dan `AppBar` menampilkan judul "My Products".

</details>
