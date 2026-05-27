// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get signIn => '로그인';

  @override
  String get signUp => '회원가입';

  @override
  String get signOut => '로그아웃';

  @override
  String get email => '이메일';

  @override
  String get pleaseEnterValidEmail => '유효한 이메일을 입력하세요';

  @override
  String get password => '비밀번호';

  @override
  String get pleaseEnterPassword => '비밀번호를 입력하세요';

  @override
  String get passwordTooShort => '비밀번호는 최소 6자 이상이어야 합니다';

  @override
  String get confirmPassword => '비밀번호 확인';

  @override
  String get pleaseConfirmPassword => '비밀번호를 확인하세요';

  @override
  String get passwordsDoNotMatch => '비밀번호가 일치하지 않습니다';

  @override
  String get dontHaveAccount => '계정이 없으신가요?';

  @override
  String get fullName => '전체 이름';

  @override
  String get pleaseEnterFullName => '전체 이름을 입력하세요';

  @override
  String get noUserFound => '해당 이메일의 사용자를 찾을 수 없습니다';

  @override
  String get wrongPassword => '비밀번호가 잘못되었습니다. 다시 시도하세요.';

  @override
  String get weakPassword => '비밀번호가 너무 약합니다.';

  @override
  String get emailAlreadyInUse => '해당 이메일은 이미 사용 중입니다.';

  @override
  String get invalidEmail => '유효하지 않은 이메일 주소입니다.';

  @override
  String get genericError => '오류가 발생했습니다. 다시 시도하세요.';

  @override
  String errorOccurred(Object error) {
    return '오류 발생: $error';
  }

  @override
  String get reportDetail => '신고 상세';

  @override
  String get viewFullImage => '전체 이미지 보기';

  @override
  String get openInGoogleMaps => 'Google 지도에서 열기';

  @override
  String get unableToOpenMaps => 'Google 지도를 열 수 없습니다';

  @override
  String get filterCategory => '카테고리 필터';

  @override
  String get allCategories => '모든 카테고리';

  @override
  String get noReportsInThisCategory => '이 카테고리에 신고가 없습니다.';

  @override
  String secondsAgo(Object count) {
    return '$count초 전';
  }

  @override
  String minutesAgo(Object count) {
    return '$count분 전';
  }

  @override
  String hoursAgo(Object count) {
    return '$count시간 전';
  }

  @override
  String get oneDayAgo => '1일 전';

  @override
  String get categoryJalanRusak => '도로 파손';

  @override
  String get categoryMarkaPudar => '희미해진 도로 표시';

  @override
  String get categoryLampuMati => '고장난 가로등';

  @override
  String get categoryTrotoarRusak => '손상된 보도';

  @override
  String get categoryRambuRusak => '손상된 교통 표지판';

  @override
  String get categoryJembatanRusak => '손상된 다리';

  @override
  String get categorySampahMenumpuk => '쓰레기 적치';

  @override
  String get categorySaluranTersumbat => '막힌 배수로';

  @override
  String get categorySungaiTercemar => '오염된 강';

  @override
  String get categorySampahSungai => '강 쓰레기';

  @override
  String get categoryPohonTumbang => '쓰러진 나무';

  @override
  String get categoryTamanRusak => '손상된 공원';

  @override
  String get categoryFasilitasRusak => '손상된 시설';

  @override
  String get categoryPipaBocor => '누수된 파이프';

  @override
  String get categoryVandalisme => '기물 파손';

  @override
  String get categoryBanjir => '홍수';

  @override
  String get categoryLainnya => '기타';

  @override
  String get addPost => '게시물 추가';

  @override
  String get takePicture => '사진 찍기';

  @override
  String get chooseFromGallery => '갤러리에서 선택';

  @override
  String get cancel => '취소';

  @override
  String get pleaseAddImageAndDescription => '이미지와 설명을 추가하세요.';

  @override
  String get userNotFoundPleaseSignIn => '사용자를 찾을 수 없습니다. 로그인하세요.';

  @override
  String get postUploadedSuccessfully => '게시물이 성공적으로 업로드되었습니다!';

  @override
  String failedToUploadPost(Object error) {
    return '게시물 업로드 실패: $error';
  }

  @override
  String get locationServicesDisabled => '위치 서비스가 비활성화되었습니다.';

  @override
  String get locationPermissionsDenied => '위치 권한이 거부되었습니다.';

  @override
  String failedToRetrieveLocation(Object error) {
    return '위치 가져오기 실패: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return '이미지 선택 실패: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return '이미지 압축 실패: $error';
  }

  @override
  String get generateAnotherDescription => '다른 설명 생성';

  @override
  String get addBriefDescription => '간단한 설명 추가...';

  @override
  String get post => '게시';

  @override
  String get notificationSent => '✅ 알림이 성공적으로 전송되었습니다';

  @override
  String notificationFailed(Object error) {
    return '❌ 알림 전송 실패: $error';
  }

  @override
  String get settings => '설정';

  @override
  String get language => '언어';

  @override
  String get unknownLanguage => '알 수 없는 언어';

  @override
  String get english => '영어';

  @override
  String get indonesian => '인도네시아어';

  @override
  String get mandarin => '중국어';

  @override
  String get korea => '한국어';

  @override
  String get arab => '아랍어';

  @override
  String failedToLoadReports(String error) {
    return '보고서를 불러오지 못했습니다:\n$error';
  }

  @override
  String get imageNotAvailable => '이미지를 사용할 수 없거나 지원되지 않는 형식입니다.';

  @override
  String get unableToDisplayReport => '이 보고서를 표시할 수 없습니다';

  @override
  String get anonymous => '익명';

  @override
  String get newReportNotificationTitle => '⚠️ 새 보고서';
}
