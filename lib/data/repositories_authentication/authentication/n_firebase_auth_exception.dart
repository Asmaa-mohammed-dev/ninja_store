class NFirebaseException implements Exception {
  final String code;

  NFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'permission-denied':
        return 'ليس لديك صلاحية لتنفيذ هذا الإجراء.';
      case 'unavailable':
        return 'الخادم غير متاح حاليًا، يرجى المحاولة لاحقًا.';
      case 'weak-password':
        return 'كلمة المرور المُدخلة ضعيفة.';
      case 'email-already-in-use':
        return 'هذا البريد الإلكتروني مستخدم بالفعل.';
      case 'invalid-email':
        return 'عنوان البريد الإلكتروني غير صحيح.';
      default:
        return 'حدث خطأ في Firebase، يُرجى المحاولة مرة أخرى.';
    }
  }
}

class NFirebaseAuthException {
  final String code;
  NFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم من قبل.';
      case 'weak-password':
        return 'كلمة المرور ضعيفة.';
      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح.';
      case 'operation-not-allowed':
        return 'هذه العملية غير مسموح بها.';
      case 'user-disabled':
        return 'تم تعطيل حساب المستخدم.';
      case 'user-not-found':
        return 'لا يوجد مستخدم بهذا البريد الإلكتروني.';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة.';
      case 'too-many-requests':
        return 'عدد كبير من المحاولات، يرجى المحاولة لاحقًا.';
      case 'network-request-failed':
        return 'فشل الاتصال بالشبكة، تأكد من اتصال الإنترنت.';
      default:
        return 'حدث خطأ غير متوقع، حاول مرة أخرى.';
    }
  }
}

class NFormatException implements Exception {
  const NFormatException();

  String get message => 'تنسيق البيانات غير صحيح.';
}

class NPlatformException implements Exception {
  final String code;

  NPlatformException(this.code);

  String get message {
    switch (code) {
      case 'network_error':
        return 'خطأ في الشبكة، يرجى التحقق من الاتصال بالإنترنت.';
      case 'device_not_supported':
        return 'هذا الجهاز لا يدعم هذه الميزة.';
      default:
        return 'حدث خطأ من النظام، حاول مرة أخرى.';
    }
  }
}
