# QuizKu – Aplikasi Kuis Pilihan Ganda

## Identitas Mahasiswa
- **Nama**  : M. Abid Alfakhri
- **NIM**   : 241401084
- **Lab**   : 6

## Informasi Aplikasi
- **Nama Aplikasi** : QuizKu
- **Deskripsi** : Aplikasi kuis pilihan ganda. Alur 4 halaman: pengguna memasukkan nama di halaman Welcome, memilih salah satu dari tiga kuis di halaman Daftar Kuis, menjawab soal di halaman Kuis, lalu melihat skor akhir beserta review jawaban di halaman Hasil.
- **Fitur**
  - Input nama pemain dengan validasi
  - 3 kuis dengan kategori (Flutter, Tools) dan filter kategori lewat chip
  - Status tiap kuis (Belum Dimulai / Skor terakhir)
  - Progress bar soal, tombol Lanjut dan Sebelumnya
  - Progres jawaban tidak hilang saat layar dirotasi atau berpindah halaman (Provider)
  - Halaman hasil dengan skor dan review jawaban benar/salah, serta tombol Ulangi Kuis
  - Dark dan Light mode dengan tombol toggle (bonus)
  - Adaptive dan responsive: ukuran berbasis MediaQuery, daftar kuis 2 kolom di tablet dan web (bonus)

## Cara Menjalankan
```bash
flutter create .
flutter pub get
flutter run
```

## Struktur Proyek
```
lib/
├── main.dart
├── data/        quizzes_data.dart
├── models/      question.dart, quiz.dart
├── providers/   quiz_provider.dart, theme_provider.dart
├── screens/     welcome_page.dart, home_page.dart, quiz_page.dart, result_page.dart
├── theme/       app_theme.dart
├── utils/       responsive.dart
└── widgets/     primary_button, pill_field, category_chip, status_badge,
                 quiz_card, option_tile, quiz_progress_bar, review_tile,
                 screen_header, app_logo, gradient_background, theme_toggle_button
```

## Dokumentasi
### Credit Aset
- Font Poppins, Indian Type Foundry, lisensi SIL OFL 1.1: https://fonts.google.com/specimen/Poppins
- Logo, ilustrasi kartu kuis, dan piala hasil (emoji): OpenMoji, lisensi CC BY-SA 4.0
  - Situs: https://openmoji.org
  - Repository: https://github.com/hfg-gmuend/openmoji
  - Lisensi: https://creativecommons.org/licenses/by-sa/4.0/
- Ikon: Material Icons bawaan Flutter
- Referensi gaya visual: mockup aplikasi "Browse Courses / Shorts / Articles / Quizzes" (isi sumber atau link referensi)

### Screenshot Tiap Halaman
| Welcome | Daftar Kuis | Kuis | Hasil |
|---|---|---|---|
| <img src="screenshots/Welcome.png" width="180"> | <img src="screenshots/DaftarKuis.png" width="180"> | <img src="screenshots/Kuis.png" width="180"> | <img src="screenshots/Hasil.png" width="180"> |

### Link Mockup / Prototype
https://www.figma.com/design/9jSNBP9MACc19MiBBJ2y8L/Mockup-QuizKu?node-id=0-1&t=p3FsOrkZXeiMQIbe-1

