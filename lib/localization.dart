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
    'exp_freelance': 'Freelance Flutter Developer',
    'exp_freelance_role': 'Self-Employed',
    'exp_freelance_period': '2024 – 2026',
    'exp_freelance_desc':
        'Built 15+ personal and freelance projects ranging from eCommerce apps (ShipLink, Sneakers) to a smart Arabic music app (SoundOra), handling the full lifecycle from UI/UX to backend, APIs, and Play Store deployment.',
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
        'E-commerce & delivery platform with real-time order tracking.',
    'project_ship_link_desc':
        'E-commerce & delivery platform. A full-stack application with a real-time delivery tracking system, built with Flutter and Supabase.\n\n• 5 delivery targets from one codebase: User app + Driver app (Android flavors), responsive Web store, Driver web and Admin panel\n• Real-time order tracking: live driver GPS over Supabase Realtime on FlutterMap + MapTiler (ETA, polyline routes, custom markers)\n• Paymob payment gateway (new card, saved card, 3D-secure callback) + Cash on Delivery\n• Google OAuth authentication (web + mobile)\n• Multi-language support (English / Arabic)\n• Product catalog with categories, search, filters, sorting, offers and stock-watch\n• Shopping cart, wishlist, promo codes, order management, invoice download (PDF)\n• Driver module: order acceptance, pickup/delivery flow, earnings dashboard, background location\n• Admin panel (Flutter Web) for dashboard, users, drivers, orders and products\n• Push notifications via Firebase Cloud Messaging (FCM)\n• Order chat, support chat, reviews and driver ratings\n• 111 automated tests (tracking, routing, geocoding, models, cubits)\n\nTech Stack: Flutter, BLoC/Cubit, Supabase (Postgres/RLS/Edge Functions), Paymob, MapTiler, Firebase',
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
    'project_nexora': 'Nexora',
    'project_nexora_desc_short':
        'AI-powered career copilot for profile building, CV creation, and interview prep.',
    'project_nexora_desc':
        'AI-powered career intelligence platform. Build your profile, find the right opportunities, create standout CVs, practice interviews, and land your dream role. Features include AI Opportunity Analysis, Career DNA profiling, mock interviews, and application tracking.',
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
    'exp_freelance': 'مطور فلاتر حر',
    'exp_freelance_role': 'عمل حر',
    'exp_freelance_period': '2024 – 2026',
    'exp_freelance_desc':
        'بنيت أكثر من 15 مشروعاً شخصياً وحراً تتراوح بين تطبيقات التجارة الإلكترونية (ShipLink، Sneakers) وتطبيق الموسيقى العربية الذكية (SoundOra)، متكلفاً بمسار التطوير الكامل من الواجهات إلى الباك إند وواجهات البرمجة ونشر التطبيقات على متجر Play.',
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
        'منصة تجارة إلكترونية وتوصيل مع تتبع فوري للطلبات.',
    'project_ship_link_desc':
        'منصة تجارة إلكترونية وتوصيل. تطبيق متكامل مع نظام تتبع توصيل فوري، مبني بـ Flutter و Supabase.\n\n• 5 أهداف نشر من كود واحد: تطبيق المستخدم + تطبيق السائق (flavors لأندرويد)، متجر ويب متجاوب، ويب السائق ولوحة التحكم\n• تتبع الطلبات في الوقت الفعلي: موقع السائق المباشر عبر Supabase Realtime على FlutterMap + MapTiler (زمن الوصول، خطوط المسار، علامات مخصصة)\n• بوابة دفع Paymob (بطاقة جديدة، بطاقة محفوظة، تحقق 3D-Secure) + الدفع عند الاستلام\n• تسجيل الدخول عبر Google OAuth (ويب + موبايل)\n• دعم متعدد اللغات (إنجليزي / عربي)\n• كتالوج منتجات مع أقسام، بحث، فلتر، فرز، عروض ومتابعة المخزون\n• سلة تسوق، قائمة رغبات، أكواد خصم، إدارة طلبات، تحميل الفواتير (PDF)\n• وحدة السائق: قبول الطلبات، تدفق الاستلام/التسليم، لوحة أرباح، موقع بالخلفية\n• لوحة تحكم إدارية (Flutter Web) للداشبورد والمستخدمين والسائقين والطلبات والمنتجات\n• إشعارات عبر Firebase Cloud Messaging (FCM)\n• شات الطلب وشات الدعم، تقييمات المنتجات وتقييم السائقين\n• 111 اختبار آلي (التتبع، التوجيه، التعرّف على الجغرافيا، الموديلات، الكيوبتات)\n\nالتقنيات: Flutter، Bloc/Cubit، Supabase (Postgres/RLS/Edge Functions)، Paymob، MapTiler، Firebase',
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
    'project_nexora': 'نكسورا',
    'project_nexora_desc_short':
        'منصة ذكاء مهني مدعومة بالذكاء الاصطناعي لبناء الملف الشخصي وإعداد السيرة الذاتية والمقابلات.',
    'project_nexora_desc':
        'منصة ذكاء مهني مدعومة بالذكاء الاصطناعي. ابنِ ملفك الشخصي، ابحث عن الفرص المناسبة، أنشئ سير ذاتية مميزة، تدرب على المقابلات، واحصل على وظيفة أحلامك. تشمل ميزات تحليل الفرص بالذكاء الاصطناعي، ملف التعريف المهني، المقابلات التدريبية، وتتبع طلبات العمل.',
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
