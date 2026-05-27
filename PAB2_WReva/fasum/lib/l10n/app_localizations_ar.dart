// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get pleaseEnterValidEmail => 'يرجى إدخال بريد إلكتروني صالح';

  @override
  String get password => 'كلمة المرور';

  @override
  String get pleaseEnterPassword => 'يرجى إدخال كلمة المرور';

  @override
  String get passwordTooShort => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get pleaseConfirmPassword => 'يرجى تأكيد كلمة المرور';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get pleaseEnterFullName => 'يرجى إدخال الاسم الكامل';

  @override
  String get noUserFound => 'لم يتم العثور على مستخدم بهذا البريد الإلكتروني';

  @override
  String get wrongPassword => 'كلمة المرور غير صحيحة. حاول مرة أخرى.';

  @override
  String get weakPassword => 'كلمة المرور ضعيفة جدًا.';

  @override
  String get emailAlreadyInUse => 'هذا البريد الإلكتروني مستخدم بالفعل.';

  @override
  String get invalidEmail => 'عنوان البريد الإلكتروني غير صالح.';

  @override
  String get genericError => 'حدث خطأ. يرجى المحاولة مرة أخرى.';

  @override
  String errorOccurred(Object error) {
    return 'حدث خطأ: $error';
  }

  @override
  String get reportDetail => 'تفاصيل البلاغ';

  @override
  String get viewFullImage => 'عرض الصورة كاملة';

  @override
  String get openInGoogleMaps => 'فتح في خرائط Google';

  @override
  String get unableToOpenMaps => 'تعذر فتح خرائط Google';

  @override
  String get filterCategory => 'تصفية الفئة';

  @override
  String get allCategories => 'جميع الفئات';

  @override
  String get noReportsInThisCategory => 'لا توجد بلاغات في هذه الفئة.';

  @override
  String secondsAgo(Object count) {
    return 'منذ $count ثانية';
  }

  @override
  String minutesAgo(Object count) {
    return 'منذ $count دقيقة';
  }

  @override
  String hoursAgo(Object count) {
    return 'منذ $count ساعة';
  }

  @override
  String get oneDayAgo => 'منذ يوم واحد';

  @override
  String get categoryJalanRusak => 'طريق متضرر';

  @override
  String get categoryMarkaPudar => 'علامات طريق باهتة';

  @override
  String get categoryLampuMati => 'مصباح شارع معطل';

  @override
  String get categoryTrotoarRusak => 'رصيف متضرر';

  @override
  String get categoryRambuRusak => 'إشارة مرور متضررة';

  @override
  String get categoryJembatanRusak => 'جسر متضرر';

  @override
  String get categorySampahMenumpuk => 'تراكم النفايات';

  @override
  String get categorySaluranTersumbat => 'مصرف مسدود';

  @override
  String get categorySungaiTercemar => 'نهر ملوث';

  @override
  String get categorySampahSungai => 'نفايات في النهر';

  @override
  String get categoryPohonTumbang => 'شجرة ساقطة';

  @override
  String get categoryTamanRusak => 'حديقة متضررة';

  @override
  String get categoryFasilitasRusak => 'مرفق متضرر';

  @override
  String get categoryPipaBocor => 'أنبوب متسرب';

  @override
  String get categoryVandalisme => 'تخريب';

  @override
  String get categoryBanjir => 'فيضان';

  @override
  String get categoryLainnya => 'أخرى';

  @override
  String get addPost => 'إضافة منشور';

  @override
  String get takePicture => 'التقاط صورة';

  @override
  String get chooseFromGallery => 'اختر من المعرض';

  @override
  String get cancel => 'إلغاء';

  @override
  String get pleaseAddImageAndDescription => 'يرجى إضافة صورة ووصف.';

  @override
  String get userNotFoundPleaseSignIn =>
      'المستخدم غير موجود. يرجى تسجيل الدخول.';

  @override
  String get postUploadedSuccessfully => 'تم رفع المنشور بنجاح!';

  @override
  String failedToUploadPost(Object error) {
    return 'فشل رفع المنشور: $error';
  }

  @override
  String get locationServicesDisabled => 'خدمات الموقع معطلة.';

  @override
  String get locationPermissionsDenied => 'تم رفض أذونات الموقع.';

  @override
  String failedToRetrieveLocation(Object error) {
    return 'فشل في الحصول على الموقع: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return 'فشل في اختيار الصورة: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return 'فشل في ضغط الصورة: $error';
  }

  @override
  String get generateAnotherDescription => 'إنشاء وصف آخر';

  @override
  String get addBriefDescription => 'أضف وصفًا مختصرًا...';

  @override
  String get post => 'نشر';

  @override
  String get notificationSent => '✅ تم إرسال الإشعار بنجاح';

  @override
  String notificationFailed(Object error) {
    return '❌ فشل إرسال الإشعار: $error';
  }

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get unknownLanguage => 'لغة غير معروفة';

  @override
  String get english => 'الإنجليزية';

  @override
  String get indonesian => 'الإندونيسية';

  @override
  String get mandarin => 'الصينية';

  @override
  String get korea => 'الكورية';

  @override
  String get arab => 'العربية';

  @override
  String failedToLoadReports(String error) {
    return 'فشل تحميل التقارير:\n$error';
  }

  @override
  String get imageNotAvailable => 'الصورة غير متوفرة أو التنسيق غير مدعوم.';

  @override
  String get unableToDisplayReport => 'تعذر عرض هذا التقرير';

  @override
  String get anonymous => 'مجهول';

  @override
  String get newReportNotificationTitle => '⚠️ تقرير جديد';
}
