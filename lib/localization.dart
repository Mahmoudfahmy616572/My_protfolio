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
    'experience': 'Experience',
    'exp_zikola': 'Zikola',
    'exp_zikola_role': 'Flutter Developer',
    'exp_zikola_period': 'Feb 2026 – Jul 2026',
    'exp_zikola_desc':
        'Developed and maintained cross-platform mobile applications using Flutter and Dart, collaborated with the team on new features and UI/UX, and integrated RESTful APIs with state management.',
    'exp_military': 'Military Service',
    'exp_military_desc':
        'Completed one year of mandatory military service.',
    'exp_military_period': 'Mar 2025 – Mar 2026',
    'skill_flutter': 'Flutter',
    'skill_dart': 'Dart',
    'skill_firebase': 'Firebase',
    'skill_supabase': 'Supabase',
    'skill_rest_api': 'REST APIs',
    'skill_git': 'Git / GitHub',
    'skill_ui_ux': 'UI/UX Design',
    'skill_bloc': 'BLoC / Cubit',
    'skill_provider': 'Provider',
    'skill_mvvm': 'MVVM',
    'skill_oop': 'OOP',
    'skill_tcp': 'TCP/IP',
    'skill_stripe': 'Stripe',
    'skill_paymob': 'Paymob',
    'skill_google_maps': 'Google Maps',
    'cat_architecture': 'Programming & Architecture',
    'cat_backend': 'Backend & Databases',
    'cat_apis': 'APIs & Payments',
    'cat_networking': 'Networking',
    'cat_tools': 'Tools & DevOps',
    'filter_all': 'All',
    'filter_junior': 'Junior',
    'filter_intermediate': 'Intermediate',
    'filter_senior': 'Senior',
    'projects': 'Projects',
    'project_unipath': 'UniPath',
    'project_unipath_desc_short':
        'AI-powered platform helping students navigate German university admissions.',
    'project_unipath_desc':
        'AI-powered platform helping students navigate German university admissions.\n\n• 13,700+ programs indexed across 588 German universities\n• Smart matching algorithm to find the best-fit programs\n• Advanced search with filters by field, city, degree type, and language\n• Complete application tracking and deadline management\n• Student dashboard for managing applications\n• Personalized recommendations based on student profile\n• Push notifications via Firebase Cloud Messaging (FCM)\n• Backend API powered by Supabase\n\nTech Stack: Flutter, Firebase, Supabase, AI/ML, REST APIs',
    'project_ship_link': 'ShipLink',
    'project_ship_link_desc_short':
        'Multi-Vendor E-Commerce & Delivery Platform with real-time tracking.',
    'project_ship_link_desc':
        'Multi-Vendor E-Commerce & Delivery Platform. A full-stack multi-vendor e-commerce application with a real-time delivery tracking system, built with Flutter and Supabase.\n\n• Dual-app architecture (User app + Driver app) in a single codebase using flavors\n• Real-time order tracking with live location updates (Google Maps)\n• Paymob payment gateway (credit cards, saved cards, callbacks)\n• Google OAuth authentication (web + mobile)\n• Multi-language support (English / Arabic)\n• Product catalog with categories, search, filters, and sorting\n• Shopping cart, wishlist, order management, invoice download\n• Driver management: order acceptance, pickup/delivery flow, earnings dashboard\n• Admin dashboard (HTML/JS) for order and user management\n• Push notifications via FCM\n• Fully responsive web UI (side nav for desktop, bottom nav for mobile)\n\nTech Stack: Flutter, Bloc/Cubit, Supabase, Paymob, Google Maps, Firebase',
    'project_sneakers': 'Sneakers',
    'project_sneakers_desc_short':
        'E-commerce app for sneakers with product browsing and checkout.',
    'project_sneakers_desc':
        'E-commerce app for sneakers with product browsing, cart management, and checkout flow.',
    'project_soundora': 'SoundOra',
    'project_soundora_desc_short':
        'Cross-platform Arabic music app with real-time maqam detection, synced lyrics, spatial audio, and smart playlists.',
    'project_soundora_desc':
        'Next-gen cross-platform Arabic music experience (Android, iOS, Web) with the first real-time maqam-aware playback engine.\n\n• Live Arabic maqam detection with confidence percentage (Rast, Nahawand, Hijaz, Bayati, Saba, Kurd, Sikah, Ajam)\n• Browse, play, and stream Maqam radio stations by scale\n• Smart lyrics sync with tap-to-seek, emotion coloring, and shareable lyric cards\n• Karaoke mode with synchronized real-time lyrics\n• SmartDJ AI playlist generator with 4 modes (Party, Chill, Workout, Sleep)\n• MoodMap discovery across 7 moods (happy, sad, energetic, calm, focus, party, sleep)\n• Personalized mood-based music for every moment\n• Spatial Audio with 3D immersive sound experience\n• Music Card: create and share beautiful cards from your favorite lyrics\n• Lyrics Memory: learn and remember your favorite lyrics\n• Quran: listen, recite, and explore\n• Listening parties with friends in real-time\n• Achievements & XP to track your music journey\n• Offline downloads for listening anywhere\n• TimeMachine: browse songs by decade or what dropped on this day\n\nTech Stack: Flutter, Dart, Supabase, PostgreSQL, Bloc/Cubit, Firebase',
    'project_minishop': 'miniShop',
    'project_minishop_desc_short':
        'Lightweight e-commerce app with product listing and search.',
    'project_minishop_desc':
        'Lightweight e-commerce app with product listing, search, and order management.',
    'go_to_project': 'Go to Project',
    'view_on_github': 'View on GitHub',
    'promo_website': 'Promo Website',
    'view_on_playstore': 'View on Google Play',
    'lives_on': 'Live on',
    'live_demo': 'Live Demo',
    'user_demo': 'User Demo',
    'driver_demo': 'Driver Demo',
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
    'experience': 'الخبرة',
    'exp_zikola': 'زيكولا',
    'exp_zikola_role': 'مطور فلاتر',
    'exp_zikola_period': 'فبراير 2026 – يوليو 2026',
    'exp_zikola_desc':
        'طوّرت وحافظت على تطبيقات موبايل متعددة المنصات باستخدام Flutter و Dart، تعاونت مع الفريق في مزايا جديدة وتجربة مستخدم، ودمجت واجهات برمجية مع إدارة الحالة.',
    'exp_military': 'الخدمة العسكرية',
    'exp_military_desc': 'أتممت سنة الخدمة العسكرية الإلزامية.',
    'exp_military_period': 'مارس 2025 – مارس 2026',
    'skill_flutter': 'فلاتر',
    'skill_dart': 'دارت',
    'skill_firebase': 'فايربيز',
    'skill_supabase': 'سوبابيز',
    'skill_rest_api': 'واجهات برمجة',
    'skill_git': 'جيت / جيت هاب',
    'skill_ui_ux': 'تصميم واجهات',
    'skill_bloc': 'BLoC / Cubit',
    'skill_provider': 'Provider',
    'skill_mvvm': 'MVVM',
    'skill_oop': 'OOP',
    'skill_tcp': 'TCP/IP',
    'skill_stripe': 'Stripe',
    'skill_paymob': 'Paymob',
    'skill_google_maps': 'خرائط جوجل',
    'cat_architecture': 'البرمجة والهندسة المعمارية',
    'cat_backend': 'الباك إند وقواعد البيانات',
    'cat_apis': 'الواجهات والمدفوعات',
    'cat_networking': 'الشبكات',
    'cat_tools': 'الأدوات والعمليات',
    'filter_all': 'الكل',
    'filter_junior': 'مبتدئ',
    'filter_intermediate': 'متوسط',
    'filter_senior': 'متقدم',
    'projects': 'المشاريع',
    'project_unipath': 'UniPath',
    'project_unipath_desc_short':
        'منصة مدعومة بالذكاء الاصطناعي لمساعدة الطلاب في التقديم للجامعات الألمانية.',
    'project_unipath_desc':
        'منصة مدعومة بالذكاء الاصطناعي لمساعدة الطلاب في التقديم للجامعات الألمانية.\n\n• أكتر من 13,700 برنامج عبر 588 جامعة ألمانية\n• خوارزمية مطابقة ذكية لاكتشاف أفضل البرامج\n• بحث متقدم بفلتر حسب التخصص والمدينة ونوع الدرجة واللغة\n• تتبع كامل للطلبات وإدارة المواعيد النهائية\n• لوحة تحكم للطالب لإدارة الطلبات\n• توصيات مخصصة حسب ملف الطالب\n• إشعارات فورية عبر Firebase Cloud Messaging (FCM)\n• باك إند API مدعوم بـ Supabase\n\nالتقنيات: Flutter، Firebase، Supabase، AI/ML، REST APIs',
    'project_ship_link': 'ShipLink',
    'project_ship_link_desc_short':
        'منصة تجارة إلكترونية وتوصيل متعددة البائعين مع تتبع فوري.',
    'project_ship_link_desc':
        'منصة تجارة إلكترونية وتوصيل متعددة البائعين مع تتبع فوري. تطبيق متكامل مبني بـ Flutter و Supabase.\n\n• معمارية تطبيقين (مستخدم + سائق) في كود واحد باستخدام flavors\n• تتبع الطلبات في الوقت الفعلي مع تحديثات الموقع المباشر (Google Maps)\n• بوابة دفع Paymob (بطاقات ائتمان، بطاقات محفوظة)\n• تسجيل الدخول عبر Google OAuth (ويب + موبايل)\n• دعم متعدد اللغات (إنجليزي / عربي)\n• كتالوج منتجات مع أقسام، بحث، فلتر، وفرز\n• سلة تسوق، قائمة رغبات، إدارة طلبات، تحميل الفواتير\n• نظام إدارة السائقين: قبول الطلبات، توصيل/استلام، لوحة أرباح\n• لوحة تحكم إدارية (HTML/JS) لإدارة الطلبات والمستخدمين\n• إشعارات عبر FCM\n• واجهة ويب متجاوبة (قائمة جانبية لديسكتوب، سفلي للموبايل)\n\nالتقنيات: Flutter، Bloc/Cubit، Supabase، Paymob، Google Maps، Firebase',
    'project_sneakers': 'سنيكرز',
    'project_sneakers_desc_short':
        'تطبيق متجر إلكتروني للأحذية الرياضية مع تصفح المنتجات وعملية الدفع.',
    'project_sneakers_desc':
        'تطبيق متجر إلكتروني للأحذية الرياضية مع تصفح المنتجات وإدارة السلة وعملية الدفع.',
    'project_soundora': 'ساوند أورا',
    'project_soundora_desc_short':
        'تطبيق موسيقى عربية متعدد المنصات مع كشف المقام لحظياً وكلمات متزامنة وصوت مكاني وقوائم ذكية.',
    'project_soundora_desc':
        'تجربة موسيقى عربية متعددة المنصات (Android، iOS، Web) بأول محرك تشغيل واعٍ بالمقام لحظياً.\n\n• كشف المقام العربي لحظياً مع نسبة ثقة (رست، نهاوند، حجاز، بياتي، صبا، كرد، سيكاه، عجم)\n• تصفح وتشغيل وبث محطات راديو المقام حسب السلم\n• كلمات متزامنة مع نقر للبحث وتلوين المشاعر وبطاقات قابلة للمشاركة\n• وضع الكاريوكي مع كلمات لحظية متزامنة\n• مولّد قوائم تشغيل ذكي SmartDJ بـ 4 أنماط (حفلة، هدوء، تمارين، نوم)\n• اكتشاف عبر MoodMap بـ 7 مزاجات (سعيد، حزين، نشيط، هادئ، تركيز، حفلة، نوم)\n• موسيقى مخصصة حسب المزاج لكل لحظة\n• صوت مكاني Spatial Audio بتجربة صوتية ثلاثية الأبعاد\n• بطاقة موسيقى Music Card: أنشئ وشارك بطاقات جميلة من كلماتك المفضلة\n• ذاكرة الكلمات Lyrics Memory: تعلم وتذكر كلماتك المفضلة\n• القرآن: استمع وتلاو واستكشف\n• جلسات استماع جماعية مع الأصدقاء في الوقت الفعلي\n• إنجازات وخبرة XP لتتبع رحلتك الموسيقية\n• تحميل للاستماع بدون إنترنت\n• TimeMachine: تصفح الأغاني حسب العقد أو ما صدر في هذا اليوم\n\nالتقنيات: Flutter، Dart، Supabase، PostgreSQL، Bloc/Cubit، Firebase',
    'project_minishop': 'ميني شوب',
    'project_minishop_desc_short':
        'تطبيق متجر إلكتروني خفيف مع عرض المنتجات والبحث.',
    'project_minishop_desc':
        'تطبيق متجر إلكتروني خفيف مع عرض المنتجات والبحث وإدارة الطلبات.',
    'go_to_project': 'عرض المشروع',
    'view_on_github': 'عرض على جيت هاب',
    'promo_website': 'الموقع الإعلاني',
    'view_on_playstore': 'عرض على Google Play',
    'lives_on': 'منشور على',
    'live_demo': 'تجربة مباشرة',
    'user_demo': 'تجربة المستخدم',
    'driver_demo': 'تجربة السائق',
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
