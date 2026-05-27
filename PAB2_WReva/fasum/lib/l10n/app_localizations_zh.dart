// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get signIn => '登录';

  @override
  String get signUp => '注册';

  @override
  String get signOut => '退出登录';

  @override
  String get email => '电子邮件';

  @override
  String get pleaseEnterValidEmail => '请输入有效的电子邮件';

  @override
  String get password => '密码';

  @override
  String get pleaseEnterPassword => '请输入密码';

  @override
  String get passwordTooShort => '密码至少需要6个字符';

  @override
  String get confirmPassword => '确认密码';

  @override
  String get pleaseConfirmPassword => '请确认您的密码';

  @override
  String get passwordsDoNotMatch => '密码不匹配';

  @override
  String get dontHaveAccount => '还没有账号？';

  @override
  String get fullName => '全名';

  @override
  String get pleaseEnterFullName => '请输入您的全名';

  @override
  String get noUserFound => '未找到该电子邮件对应的用户';

  @override
  String get wrongPassword => '密码错误，请重试。';

  @override
  String get weakPassword => '密码太弱。';

  @override
  String get emailAlreadyInUse => '该电子邮件已被使用。';

  @override
  String get invalidEmail => '电子邮件地址无效。';

  @override
  String get genericError => '发生错误，请重试。';

  @override
  String errorOccurred(Object error) {
    return '发生错误：$error';
  }

  @override
  String get reportDetail => '报告详情';

  @override
  String get viewFullImage => '查看完整图片';

  @override
  String get openInGoogleMaps => '在 Google 地图中打开';

  @override
  String get unableToOpenMaps => '无法打开 Google 地图';

  @override
  String get filterCategory => '筛选类别';

  @override
  String get allCategories => '所有类别';

  @override
  String get noReportsInThisCategory => '该类别中没有报告。';

  @override
  String secondsAgo(Object count) {
    return '$count 秒前';
  }

  @override
  String minutesAgo(Object count) {
    return '$count 分钟前';
  }

  @override
  String hoursAgo(Object count) {
    return '$count 小时前';
  }

  @override
  String get oneDayAgo => '1 天前';

  @override
  String get categoryJalanRusak => '道路损坏';

  @override
  String get categoryMarkaPudar => '道路标线褪色';

  @override
  String get categoryLampuMati => '路灯损坏';

  @override
  String get categoryTrotoarRusak => '人行道损坏';

  @override
  String get categoryRambuRusak => '交通标志损坏';

  @override
  String get categoryJembatanRusak => '桥梁损坏';

  @override
  String get categorySampahMenumpuk => '垃圾堆积';

  @override
  String get categorySaluranTersumbat => '排水沟堵塞';

  @override
  String get categorySungaiTercemar => '河流污染';

  @override
  String get categorySampahSungai => '河流垃圾';

  @override
  String get categoryPohonTumbang => '树木倒塌';

  @override
  String get categoryTamanRusak => '公园损坏';

  @override
  String get categoryFasilitasRusak => '公共设施损坏';

  @override
  String get categoryPipaBocor => '水管漏水';

  @override
  String get categoryVandalisme => '故意破坏';

  @override
  String get categoryBanjir => '洪水';

  @override
  String get categoryLainnya => '其他';

  @override
  String get addPost => '添加帖子';

  @override
  String get takePicture => '拍照';

  @override
  String get chooseFromGallery => '从图库中选择';

  @override
  String get cancel => '取消';

  @override
  String get pleaseAddImageAndDescription => '请添加图片和描述。';

  @override
  String get userNotFoundPleaseSignIn => '未找到用户，请登录。';

  @override
  String get postUploadedSuccessfully => '帖子上传成功！';

  @override
  String failedToUploadPost(Object error) {
    return '上传帖子失败：$error';
  }

  @override
  String get locationServicesDisabled => '定位服务已禁用。';

  @override
  String get locationPermissionsDenied => '定位权限被拒绝。';

  @override
  String failedToRetrieveLocation(Object error) {
    return '获取位置失败：$error';
  }

  @override
  String failedToPickImage(Object error) {
    return '选择图片失败：$error';
  }

  @override
  String failedToCompressImage(Object error) {
    return '压缩图片失败：$error';
  }

  @override
  String get generateAnotherDescription => '生成另一个描述';

  @override
  String get addBriefDescription => '添加简短描述...';

  @override
  String get post => '发布';

  @override
  String get notificationSent => '✅ 通知发送成功';

  @override
  String notificationFailed(Object error) {
    return '❌ 通知发送失败：$error';
  }

  @override
  String get settings => '设置';

  @override
  String get language => '语言';

  @override
  String get unknownLanguage => '未知语言';

  @override
  String get english => '英语';

  @override
  String get indonesian => '印度尼西亚语';

  @override
  String get mandarin => '中文';

  @override
  String get korea => '韩语';

  @override
  String get arab => '阿拉伯语';

  @override
  String failedToLoadReports(String error) {
    return '加载报告失败：\n$error';
  }

  @override
  String get imageNotAvailable => '图片不可用或格式不受支持。';

  @override
  String get unableToDisplayReport => '无法显示此报告';

  @override
  String get anonymous => '匿名';

  @override
  String get newReportNotificationTitle => '⚠️ 新报告';
}
