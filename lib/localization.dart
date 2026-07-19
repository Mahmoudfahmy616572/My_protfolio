import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const _en = {
    'name': 'Mahmoud Fahmy',
    'title': 'Flutter Mobile Developer',
    'location': 'Cairo, Egypt',
    'open_to_work': 'Open to Work',
    'about_me': 'About Me',
    'about_text':
        'I am a passionate Flutter mobile developer with experience in building cross-platform applications. I specialize in creating clean, efficient, and user-friendly mobile apps using Flutter and Dart. I have worked on various projects including e-commerce apps, audio streaming apps, and logistics solutions.',
    'skills': 'Skills',
    'skill_flutter': 'Flutter',
    'skill_dart': 'Dart',
    'skill_firebase': 'Firebase',
    'skill_supabase': 'Supabase',
    'skill_rest_api': 'REST APIs',
    'skill_git': 'Git / GitHub',
    'skill_ui_ux': 'UI/UX Design',
    'filter_all': 'All',
    'filter_junior': 'Junior',
    'filter_intermediate': 'Intermediate',
    'filter_senior': 'Senior',
    'projects': 'Projects',
    'project_unipath': 'UniPath',
    'project_unipath_desc':
        'AI-powered platform helping students navigate German university admissions.\n\n• 13,700+ programs indexed across 588 German universities\n• Smart matching algorithm to find the best-fit programs\n• Advanced search with filters by field, city, degree type, and language\n• Complete application tracking and deadline management\n• Student dashboard for managing applications\n• Personalized recommendations based on student profile\n\nTech Stack: Flutter, Supabase, AI/ML, REST APIs',
    'project_ship_link': 'ShipLink',
    'project_ship_link_desc':
        'Multi-Vendor E-Commerce & Delivery Platform. A full-stack multi-vendor e-commerce application with a real-time delivery tracking system, built with Flutter and Supabase.\n\n• Dual-app architecture (User app + Driver app) in a single codebase using flavors\n• Real-time order tracking with live location updates (Google Maps)\n• Paymob payment gateway (credit cards, saved cards, callbacks)\n• Google OAuth authentication (web + mobile)\n• Multi-language support (English / Arabic)\n• Product catalog with categories, search, filters, and sorting\n• Shopping cart, wishlist, order management, invoice download\n• Driver management: order acceptance, pickup/delivery flow, earnings dashboard\n• Admin dashboard (HTML/JS) for order and user management\n• Push notifications via FCM\n• Fully responsive web UI (side nav for desktop, bottom nav for mobile)\n\nTech Stack: Flutter, Bloc/Cubit, Supabase, Paymob, Google Maps, Firebase',
    'project_sneakers': 'Sneakers',
    'project_sneakers_desc':
        'E-commerce app for sneakers with product browsing, cart management, and checkout flow.',
    'project_soundora': 'SoundOra',
    'project_soundora_desc':
        'Audio streaming app with music playback, playlist management, and offline support.',
    'project_minishop': 'miniShop',
    'project_minishop_desc':
        'Lightweight e-commerce app with product listing, search, and order management.',
    'view_on_github': 'View on GitHub',
    'view_on_playstore': 'View on Google Play',
    'lives_on': 'Live on',
    'download_cv': 'Download My CV',
    'cv_subtitle':
        'Always up-to-date. Click below to get the latest version of my CV.',
    'download_cv_btn': 'Download CV (PDF)',
    'whatsapp': 'WhatsApp',
    'cv_note':
        'Update your CV file in the GitHub repo and it\'s automatically reflected here.',
    'contact': 'Get In Touch',
    'contact_subtitle':
        'Feel free to reach out for collaboration or opportunities!',
    'form_name': 'Your Name',
    'form_email': 'Your Email',
    'form_message': 'Your Message',
    'form_send': 'Send Message',
    'form_sent': 'Message sent!',
    'light': 'Light',
    'dark': 'Dark',
    'language': 'العربية',
    'copyright': '© 2026 Mahmoud Fahmy. All rights reserved.',
  };

  static const _ar = {
    'name': 'محمود فهمي',
    'title': 'مطور تطبيقات فلاتر',
    'location': 'القاهرة، مصر',
    'open_to_work': 'متاح للعمل',
    'about_me': 'عنّي',
    'about_text':
        'أنا مطور تطبيقات فلاتر شغوف ببناء تطبيقات متعددة المنصات. أتخصص في إنشاء تطبيقات جوال نظيفة وفعالة وسهلة الاستخدام باستخدام Flutter و Dart. عملت على مشاريع متنوعة تشمل تطبيقات التجارة الإلكترونية وتطبيقات بث الموسيقى وحلول الشحن واللوجستيات.',
    'skills': 'المهارات',
    'skill_flutter': 'فلاتر',
    'skill_dart': 'دارت',
    'skill_firebase': 'فايربيز',
    'skill_supabase': 'سوبابيز',
    'skill_rest_api': 'واجهات برمجة',
    'skill_git': 'جيت / جيت هاب',
    'skill_ui_ux': 'تصميم واجهات',
    'filter_all': 'الكل',
    'filter_junior': 'مبتدئ',
    'filter_intermediate': 'متوسط',
    'filter_senior': 'متقدم',
    'projects': 'المشاريع',
    'project_unipath': 'UniPath',
    'project_unipath_desc':
        'منصة مدعومة بالذكاء الاصطناعي لمساعدة الطلاب في التقديم للجامعات الألمانية.\n\n• أكتر من 13,700 برنامج عبر 588 جامعة ألمانية\n• خوارزمية مطابقة ذكية لاكتشاف أفضل البرامج\n• بحث متقدم بفلتر حسب التخصص والمدينة ونوع الدرجة واللغة\n• تتبع كامل للطلبات وإدارة المواعيد النهائية\n• لوحة تحكم للطالب لإدارة الطلبات\n• توصيات مخصصة حسب ملف الطالب\n\nالتقنيات: Flutter، Supabase، AI/ML، REST APIs',
    'project_ship_link': 'ShipLink',
    'project_ship_link_desc':
        'منصة تجارة إلكترونية وتوصيل متعددة البائعين مع تتبع فوري. تطبيق متكامل مبني بـ Flutter و Supabase.\n\n• معمارية تطبيقين (مستخدم + سائق) في كود واحد باستخدام flavors\n• تتبع الطلبات في الوقت الفعلي مع تحديثات الموقع المباشر (Google Maps)\n• بوابة دفع Paymob (بطاقات ائتمان، بطاقات محفوظة)\n• تسجيل الدخول عبر Google OAuth (ويب + موبايل)\n• دعم متعدد اللغات (إنجليزي / عربي)\n• كتالوج منتجات مع أقسام، بحث، فلتر، وفرز\n• سلة تسوق، قائمة رغبات، إدارة طلبات، تحميل الفواتير\n• نظام إدارة السائقين: قبول الطلبات، توصيل/استلام، لوحة أرباح\n• لوحة تحكم إدارية (HTML/JS) لإدارة الطلبات والمستخدمين\n• إشعارات عبر FCM\n• واجهة ويب متجاوبة (قائمة جانبية لديسكتوب، سفلي للموبايل)\n\nالتقنيات: Flutter، Bloc/Cubit، Supabase، Paymob، Google Maps، Firebase',
    'project_sneakers': 'سنيكرز',
    'project_sneakers_desc':
        'تطبيق متجر إلكتروني للأحذية الرياضية مع تصفح المنتجات وإدارة السلة وعملية الدفع.',
    'project_soundora': 'ساوند أورا',
    'project_soundora_desc':
        'تطبيق بث موسيقى مع تشغيل الأغاني وإدارة قوائم التشغيل ودعم التشغيل بدون إنترنت.',
    'project_minishop': 'ميني شوب',
    'project_minishop_desc':
        'تطبيق متجر إلكتروني خفيف مع عرض المنتجات والبحث وإدارة الطلبات.',
    'view_on_github': 'عرض على جيت هاب',
    'view_on_playstore': 'عرض على Google Play',
    'lives_on': 'منشور على',
    'download_cv': 'تحميل السيرة الذاتية',
    'cv_subtitle': 'دائماً محدثة. اضغط للتحميل للحصول على أحدث نسخة من سيرتي الذاتية.',
    'download_cv_btn': 'تحميل السيرة الذاتية (PDF)',
    'whatsapp': 'واتساب',
    'cv_note': 'حدّث ملف الـ CV في مستودع جيت هاب وستظهر التغييرات تلقائياً هنا.',
    'contact': 'تواصل معي',
    'contact_subtitle': 'لا تتردد في التواصل للتعاون أو الفرص المتاحة!',
    'form_name': 'الاسم',
    'form_email': 'البريد الإلكتروني',
    'form_message': 'رسالتك',
    'form_send': 'إرسال الرسالة',
    'form_sent': 'تم الإرسال!',
    'light': 'فاتح',
    'dark': 'داكن',
    'language': 'English',
    'copyright': '© 2026 محمود فهمي. جميع الحقوق محفوظة.',
  };

  static final Map<String, Map<String, String>> _all = {
    'en': _en,
    'ar': _ar,
  };

  String tr(String key) {
    return _all[locale.languageCode]?[key] ?? _en[key] ?? key;
  }

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations(Localizations.localeOf(context));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
