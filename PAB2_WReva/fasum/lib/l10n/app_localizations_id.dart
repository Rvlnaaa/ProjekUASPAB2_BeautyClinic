// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get signIn => 'Masuk';

  @override
  String get signUp => 'Daftar';

  @override
  String get signOut => 'Keluar';

  @override
  String get email => 'Email';

  @override
  String get pleaseEnterValidEmail => 'Silakan masukkan email yang valid';

  @override
  String get password => 'Kata Sandi';

  @override
  String get pleaseEnterPassword => 'Silakan masukkan kata sandi';

  @override
  String get passwordTooShort => 'Kata sandi minimal 6 karakter';

  @override
  String get confirmPassword => 'Konfirmasi Kata Sandi';

  @override
  String get pleaseConfirmPassword => 'Silakan konfirmasi kata sandi';

  @override
  String get passwordsDoNotMatch => 'Kata sandi tidak cocok';

  @override
  String get dontHaveAccount => 'Belum punya akun?';

  @override
  String get fullName => 'Nama Lengkap';

  @override
  String get pleaseEnterFullName => 'Silakan masukkan nama lengkap';

  @override
  String get noUserFound => 'Pengguna dengan email tersebut tidak ditemukan';

  @override
  String get wrongPassword => 'Kata sandi salah. Silakan coba lagi.';

  @override
  String get weakPassword => 'Kata sandi terlalu lemah.';

  @override
  String get emailAlreadyInUse => 'Akun dengan email tersebut sudah digunakan.';

  @override
  String get invalidEmail => 'Alamat email tidak valid.';

  @override
  String get genericError => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String errorOccurred(Object error) {
    return 'Terjadi kesalahan: $error';
  }

  @override
  String get reportDetail => 'Detail Laporan';

  @override
  String get viewFullImage => 'Lihat gambar penuh';

  @override
  String get openInGoogleMaps => 'Buka di Google Maps';

  @override
  String get unableToOpenMaps => 'Tidak dapat membuka Google Maps';

  @override
  String get filterCategory => 'Filter Kategori';

  @override
  String get allCategories => 'Semua Kategori';

  @override
  String get noReportsInThisCategory => 'Tidak ada laporan dalam kategori ini.';

  @override
  String secondsAgo(Object count) {
    return '$count detik yang lalu';
  }

  @override
  String minutesAgo(Object count) {
    return '$count menit yang lalu';
  }

  @override
  String hoursAgo(Object count) {
    return '$count jam yang lalu';
  }

  @override
  String get oneDayAgo => '1 hari yang lalu';

  @override
  String get categoryJalanRusak => 'Jalan Rusak';

  @override
  String get categoryMarkaPudar => 'Marka Pudar';

  @override
  String get categoryLampuMati => 'Lampu Jalan Mati';

  @override
  String get categoryTrotoarRusak => 'Trotoar Rusak';

  @override
  String get categoryRambuRusak => 'Rambu Rusak';

  @override
  String get categoryJembatanRusak => 'Jembatan Rusak';

  @override
  String get categorySampahMenumpuk => 'Sampah Menumpuk';

  @override
  String get categorySaluranTersumbat => 'Saluran Tersumbat';

  @override
  String get categorySungaiTercemar => 'Sungai Tercemar';

  @override
  String get categorySampahSungai => 'Sampah Sungai';

  @override
  String get categoryPohonTumbang => 'Pohon Tumbang';

  @override
  String get categoryTamanRusak => 'Taman Rusak';

  @override
  String get categoryFasilitasRusak => 'Fasilitas Rusak';

  @override
  String get categoryPipaBocor => 'Pipa Bocor';

  @override
  String get categoryVandalisme => 'Vandalisme';

  @override
  String get categoryBanjir => 'Banjir';

  @override
  String get categoryLainnya => 'Lainnya';

  @override
  String get addPost => 'Tambah Postingan';

  @override
  String get takePicture => 'Ambil Foto';

  @override
  String get chooseFromGallery => 'Pilih dari Galeri';

  @override
  String get cancel => 'Batal';

  @override
  String get pleaseAddImageAndDescription =>
      'Silakan tambahkan gambar dan deskripsi.';

  @override
  String get userNotFoundPleaseSignIn =>
      'Pengguna tidak ditemukan. Silakan masuk.';

  @override
  String get postUploadedSuccessfully => 'Postingan berhasil diunggah!';

  @override
  String failedToUploadPost(Object error) {
    return 'Gagal mengunggah postingan: $error';
  }

  @override
  String get locationServicesDisabled => 'Layanan lokasi dinonaktifkan.';

  @override
  String get locationPermissionsDenied => 'Izin lokasi ditolak.';

  @override
  String failedToRetrieveLocation(Object error) {
    return 'Gagal mendapatkan lokasi: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return 'Gagal memilih gambar: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return 'Gagal mengompres gambar: $error';
  }

  @override
  String get generateAnotherDescription => 'Buat deskripsi lain';

  @override
  String get addBriefDescription => 'Tambahkan deskripsi singkat...';

  @override
  String get post => 'Posting';

  @override
  String get notificationSent => '✅ Notifikasi berhasil dikirim';

  @override
  String notificationFailed(Object error) {
    return '❌ Gagal mengirim notifikasi: $error';
  }

  @override
  String get settings => 'Pengaturan';

  @override
  String get language => 'Bahasa';

  @override
  String get unknownLanguage => 'Bahasa Tidak Diketahui';

  @override
  String get english => 'Inggris';

  @override
  String get indonesian => 'Indonesia';

  @override
  String get mandarin => 'Mandarin';

  @override
  String get korea => 'Korea';

  @override
  String get arab => 'Arab';

  @override
  String failedToLoadReports(String error) {
    return 'Gagal memuat laporan:\n$error';
  }

  @override
  String get imageNotAvailable =>
      'Gambar tidak tersedia atau format tidak didukung.';

  @override
  String get unableToDisplayReport => 'Tidak bisa menampilkan laporan ini';

  @override
  String get anonymous => 'Anonim';

  @override
  String get newReportNotificationTitle => '⚠️ Laporan Baru';
}
