import '../models/question.dart';
import '../models/quiz.dart';

const List<String> quizCategories = ['Semua', 'Flutter', 'Tools'];

const List<Quiz> quizzesData = [
  Quiz(
    id: 'dasar-flutter',
    title: 'Dasar Flutter & Dart',
    category: 'Flutter',
    minutes: 5,
    art: 'assets/images/art_flutter.png',
    questions: [
      Question(
        text: 'Bahasa pemrograman apa yang digunakan untuk membuat aplikasi Flutter?',
        options: ['Kotlin', 'Dart', 'Swift', 'JavaScript'],
        correctIndex: 1,
      ),
      Question(
        text: 'Widget Flutter yang tidak menyimpan state internal disebut...',
        options: ['StatefulWidget', 'InheritedWidget', 'StatelessWidget', 'RenderWidget'],
        correctIndex: 2,
      ),
      Question(
        text: 'Method yang dipanggil untuk memperbarui tampilan pada StatefulWidget adalah...',
        options: ['refresh()', 'setState()', 'update()', 'rebuild()'],
        correctIndex: 1,
      ),
      Question(
        text: 'File yang digunakan untuk mendaftarkan aset dan font di Flutter adalah...',
        options: ['main.dart', 'pubspec.yaml', 'build.gradle', 'manifest.json'],
        correctIndex: 1,
      ),
      Question(
        text: 'Widget yang menyusun anak-anaknya secara vertikal adalah...',
        options: ['Row', 'Stack', 'Column', 'Wrap'],
        correctIndex: 2,
      ),
    ],
  ),
  Quiz(
    id: 'navigasi-state',
    title: 'Navigasi & State Management',
    category: 'Flutter',
    minutes: 4,
    art: 'assets/images/art_state.png',
    questions: [
      Question(
        text: 'Perintah untuk berpindah ke halaman baru di Flutter adalah...',
        options: ['Navigator.push()', 'Page.open()', 'Route.go()', 'Screen.show()'],
        correctIndex: 0,
      ),
      Question(
        text: 'Package yang umum dipakai untuk state management sederhana di Flutter adalah...',
        options: ['http', 'provider', 'path', 'intl'],
        correctIndex: 1,
      ),
      Question(
        text: 'Class yang dipakai untuk mengetahui ukuran layar perangkat adalah...',
        options: ['MediaQuery', 'ScreenInfo', 'DeviceSize', 'ViewPort'],
        correctIndex: 0,
      ),
      Question(
        text: 'Class yang memberi tahu widget agar rebuild saat datanya berubah pada Provider adalah...',
        options: ['ChangeNotifier', 'FutureBuilder', 'TextEditingController', 'GlobalKey'],
        correctIndex: 0,
      ),
    ],
  ),
  Quiz(
    id: 'git-tools',
    title: 'Git & Alat Pengembangan',
    category: 'Tools',
    minutes: 4,
    art: 'assets/images/art_tools.png',
    questions: [
      Question(
        text: 'Perintah Git untuk menyimpan perubahan ke riwayat lokal adalah...',
        options: ['git push', 'git commit', 'git clone', 'git fetch'],
        correctIndex: 1,
      ),
      Question(
        text: 'Fitur Flutter yang menampilkan perubahan kode tanpa restart penuh disebut...',
        options: ['Hot Reload', 'Cold Boot', 'Live Build', 'Fast Compile'],
        correctIndex: 0,
      ),
      Question(
        text: 'Perintah Git untuk membuat repository baru di folder lokal adalah...',
        options: ['git start', 'git create', 'git init', 'git new'],
        correctIndex: 2,
      ),
      Question(
        text: 'Perintah Git untuk mengirim commit lokal ke GitHub adalah...',
        options: ['git push', 'git pull', 'git merge', 'git stash'],
        correctIndex: 0,
      ),
    ],
  ),
];
