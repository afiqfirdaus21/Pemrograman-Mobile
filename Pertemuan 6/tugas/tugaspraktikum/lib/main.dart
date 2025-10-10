import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0D9488),
      ), // teal-ish
      useMaterial3: true,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile & Counter App',
      theme: baseTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: baseTheme.colorScheme.primary,
          foregroundColor: baseTheme.colorScheme.onPrimary,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: baseTheme.colorScheme.primary,
          foregroundColor: baseTheme.colorScheme.onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: baseTheme.colorScheme.primary,
            foregroundColor: baseTheme.colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: baseTheme.colorScheme.primary),
            foregroundColor: baseTheme.colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ),
      home: const HomeShell(),
    );
  }
}

// Shell utama dengan BottomNavigationBar untuk navigasi antar halaman
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  // Gunakan GlobalKey agar FAB di shell bisa memanggil increment() di CounterPage
  final GlobalKey<CounterPageState> _counterKey = GlobalKey<CounterPageState>();

  String get _title => _currentIndex == 0 ? 'Profil Mahasiswa' : 'Counter App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          // Bonus: IconButton
          if (_currentIndex == 0)
            IconButton(
              tooltip: 'Info Aplikasi',
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'My Profile & Counter App',
                  applicationVersion: '1.0.0',
                  children: const [Text('Contoh aplikasi Flutter sederhana.')],
                );
              },
            ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const ProfilePage(),
          CounterPage(key: _counterKey),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Counter',
          ),
        ],
        onTap: (i) => setState(() => _currentIndex = i),
      ),
      // FAB hanya tampil di halaman Counter dan menambah angka
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
              onPressed: () => _counterKey.currentState?.increment(),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

// 1) Halaman Profil (StatelessWidget)
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Header: FlutterLogo + Foto Profil
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHighest.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Foto Profil (placeholder)
                CircleAvatar(
                  radius: 44,
                  backgroundImage: const AssetImage('assets/afiq.png'),
                  backgroundColor: Colors.transparent,
                ),

                const SizedBox(height: 8),
                Text(
                  'Muhammad Afiq Firdaus',
                  style: TextStyle(color: scheme.onSurfaceVariant),
                ),
              ],
            ),
          ),

          // Identitas: Nama, NIM, Jurusan
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.primaryContainer.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama: Muhammad Afiq Firdaus',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'NIM: 2341760189',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Jurusan: Teknologi informasi',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),

          // Kontak dengan Row + Icons
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerLow.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.email, color: scheme.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'fafiq8445@gmail.com',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    IconButton(
                      tooltip: 'Kirim Email',
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Mengirim email...')),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.phone, color: scheme.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '+62 895-0469-8493',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    IconButton(
                      tooltip: 'Panggil',
                      icon: const Icon(Icons.call),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Memanggil...')),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImagePlaceholderBox extends StatelessWidget {
  const _ImagePlaceholderBox();

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(8);
    return ClipRRect(
      borderRadius: border,
      child: Container(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.7),
        child: const Center(
          child: Placeholder(color: Colors.grey, strokeWidth: 1.5),
        ),
      ),
    );
  }
}

// 2) Halaman Counter (StatefulWidget)
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  int _count = 0;

  void increment() => setState(() => _count++);
  void decrement() => setState(() => _count--);
  void reset() => setState(() => _count = 0);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(
      context,
    ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w700);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Nilai Counter',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('$_count', style: textStyle),
            const SizedBox(height: 24),
            // Tombol disusun dengan Row
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(onPressed: decrement, child: const Text('-')),
                const SizedBox(width: 12),
                ElevatedButton(onPressed: increment, child: const Text('+')),
                const SizedBox(width: 12),
                OutlinedButton(onPressed: reset, child: const Text('Reset')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
