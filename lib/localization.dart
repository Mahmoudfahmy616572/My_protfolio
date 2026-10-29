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
        'Applying to Germany means 13,000+ programmes, uni-assist rules and deadlines spread across a dozen portals. UniPath collapses that into one workflow: match → documents → track.\n\n• 13,600+ programmes from 369 German universities, filterable by field, city, degree, language, IELTS, tuition\n• Weighted match score from GPA, major synonyms, language evidence and budget — computed in a background isolate and cached for 6 hours\n• AI shortlist and chat grounded in programmes already fetched from Postgres — it cannot invent a university\n• Document hub: readiness checks, AI review, CV / SOP / cover-letter generation, Arabic-correct PDF export\n• Application tracker with statuses, deadlines and Gmail / Outlook email classification\n• Premium via Paymob: server-side writes only, HMAC-verified webhook, amount checks, 3-day grace period\n\nTech Stack: Flutter, BLoC/Cubit, Supabase (Postgres/RLS/Edge Functions), Gemini, Paymob',
    'project_ship_link': 'ShipLink',
    'project_ship_link_desc_short':
        'E-commerce & delivery platform with real-time order tracking.',
    'project_ship_link_desc':
        'Most delivery startups stitch a store, a courier app and an admin panel together from three different vendors. ShipLink ships all five surfaces from one Flutter codebase — with data secured per role, not per screen.\n\n• 5 targets from one codebase: customer app + driver app (Android flavors), responsive web store, driver web, admin panel\n• Real-time order tracking: live driver GPS over Supabase Realtime on FlutterMap + MapTiler (ETA, polyline routes, custom markers)\n• Paymob payment gateway (new card, saved card, 3D-secure callback) + Cash on Delivery\n• Google OAuth authentication (web + mobile)\n• Product catalog with categories, search, filters, sorting, offers and stock-watch\n• Cart, wishlist, promo codes, order management, PDF invoices, order & support chat, reviews and driver ratings\n• Driver module: order acceptance, pickup/delivery flow, earnings dashboard, background location\n• Admin panel (Flutter Web) for dashboard, users, drivers, orders and products\n• Push notifications via Firebase Cloud Messaging (FCM), English / Arabic with RTL\n• 111 automated tests (tracking, routing, geocoding, models, cubits)\n\nTech Stack: Flutter, BLoC/Cubit, Supabase (Postgres/RLS/Edge Functions), Paymob, MapTiler, Firebase',
    'project_sneakers': 'Sneakers',
    'project_sneakers_desc_short':
        'E-commerce app for sneakers with product browsing and checkout.',
    'project_sneakers_desc':
        'E-commerce app for sneakers with product browsing, cart management, and checkout flow.',
    'project_soundora': 'SoundOra',
    'project_soundora_desc_short':
        'Cross-platform Arabic music app with real-time maqam detection, synced lyrics, spatial audio, and smart playlists.',
    'project_soundora_desc':
        'An Arabic music player built for how Arabic music actually works: maqam-aware playback, lyrics you can follow in real time, and discovery driven by mood rather than genre.\n\n• Real-time Arabic maqam detection with confidence (Rast, Nahawand, Hijaz, Bayati, Saba, Kurd, Sikah, Ajam) and radio stations by scale\n• Synced lyrics with tap-to-seek, karaoke mode, emotion colouring and shareable lyric cards\n• SmartDJ playlists in 4 modes (Party, Chill, Workout, Sleep) and MoodMap discovery across 7 moods\n• Spatial audio, offline downloads, listening parties with friends, achievements and XP\n• Quran section and TimeMachine (browse by decade or what released today)\n• Supabase / Postgres backend, BLoC state, Android · iOS · Web\n\nTech Stack: Flutter, Dart, Supabase, PostgreSQL, Bloc/Cubit, Firebase',
    'project_minishop': 'miniShop',
    'project_minishop_desc_short':
        'Lightweight e-commerce app with product listing and search.',
    'project_minishop_desc':
        'Lightweight e-commerce app with product listing, search, and order management.',
    'project_nexora': 'Nexora',
    'project_nexora_desc_short':
        'AI-powered career copilot for profile building, CV creation, and interview prep.',
    'project_nexora_desc':
        'The hard question is not "how do I write a CV" — it is "which jobs actually fit me, and can I prove it". Nexora answers with a deterministic match score, a CV tailored to that exact job, and a scored mock interview.\n\n• Career intake from CV upload, GitHub import or guided AI questions → versioned Career DNA\n• Match engine written in pure Dart (skills, seniority, domain, gaps) — the LLM never owns a number\n• CV Studio: job-tailored generation, factual fallback, validation pass, 3 PDF templates, version history, ATS evaluation\n• Voice mock interviews with TTS + speech-to-text and scored feedback\n• Application pipeline tracker, English / Arabic with RTL, 57 test files\n• 8 Supabase Edge Functions proxy the LLM (Groq) with JWT checks, JSON repair and deterministic fallbacks\n\nTech Stack: Flutter, BLoC, Supabase (Postgres/RLS/Edge Functions), Groq LLMs',
    'project_kalimny': 'Kalimny',
    'project_kalimny_desc_short':
        'Real-time AI voice language tutor with a 3D avatar, 4 languages, CEFR units, auto-summaries, and unit exams.',
    'project_kalimny_desc':
        'Language learners freeze in real conversations because textbook drills do not feel like talking to a person. Kalimny pairs you with a friendly 3D AI voice tutor (Jonas & Lina) that jokes, laughs, and corrects you gently in real time.\n\n• Full-duplex speech-to-speech voice sessions over WebSocket (Gemini Live API) with live transcript and 3D procedural avatar\n• 4 languages (German, English, French, Spanish) × 6 real-world scenarios (Airport, Restaurant, Job Interview, Shopping, Taxi, 5-min Challenge)\n• Structured CEFR curriculum (A1–B2): completing ≥70% of a session automatically generates the lesson summary and unlocks the mandatory unit exam required to unlock the next unit\n• Automatic Mistakes & Vocabulary Bank + Smart Flashcards generated from your actual conversation errors\n• Daily streak & XP score system to keep learners practicing every day\n\nTech Stack: Next.js, TypeScript, Supabase (Postgres/RLS), Gemini Live Audio, Three.js / WebGL',
    'screenshots_gallery': 'Screenshots Gallery',
    'promo_video': 'Explained Walkthrough Video',
    'user_promo_video': 'Customer App Walkthrough',
    'driver_promo_video': 'Driver App Walkthrough',
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
        'التقديم على ألمانيا معناه 13,000+ برنامج وقواعد uni-assist ومواعيد نهائية موزّعة على عشرات المواقع. UniPath بيحوّل ده لمسار واحد: مطابقة → مستندات → متابعة.\n\n• أكتر من 13,600 برنامج من 369 جامعة ألمانية، بفلترة حسب التخصص والمدينة والدرجة واللغة والآيلتس والرسوم\n• درجة مطابقة مرجّحة من المعدل وتكافؤ التخصص والأدلة اللغوية والميزانية — بتتحسب في isolate بالخلفية ومخزّنة 6 ساعات\n• ترشيح ومحادثة ذكية مبنية على برامج مسحوبة فعلاً من Postgres — مستحيل يخترع جامعة\n• مركز مستندات: فحص الجاهزية، مراجعة بالـ AI، توليد CV وSOP وخطاب دافع، وتصدير PDF بعربي مظبوط\n• تتبع الطلبات بحالات ومواعيد نهائية وتصنيف إيميلات القبول من Gmail وOutlook\n• اشتراك مدفوع عبر Paymob: الكتابة من السيرفر بس، webhook متحقَّق بـ HMAC، فحص المبلغ، و3 أيام grace\n\nالتقنيات: Flutter، BLoC/Cubit، Supabase (Postgres/RLS/Edge Functions)، Gemini، Paymob',
    'project_ship_link': 'ShipLink',
    'project_ship_link_desc_short':
        'منصة تجارة إلكترونية وتوصيل مع تتبع فوري للطلبات.',
    'project_ship_link_desc':
        'معظم مشاريع التوصيل بتجمّع المتجر وتطبيق المندوب ولوحة التحكم من 3 شركات مختلفة. ShipLink بيسلّم الخمس واجهات من كود Flutter واحد — والصلاحيات محمية على مستوى الدور، مش الشاشة.\n\n• 5 أهداف من كود واحد: تطبيق العميل + تطبيق السائق (flavors لأندرويد)، متجر ويب متجاوب، ويب السائق، ولوحة التحكم\n• تتبع لحظي: موقع السائق عبر Supabase Realtime على FlutterMap + MapTiler (وقت وصول، خطوط مسار، علامات مخصصة)\n• بوابة Paymob (كارت جديد، كارت محفوظ، تحقق 3D-Secure) + الدفع عند الاستلام\n• تسجيل دخول بـ Google OAuth (ويب + موبايل)\n• كتالوج بأقسام وبحث وفلتر وفرز وعروض ومتابعة مخزون\n• سلة وقائمة رغبات وأكواد خصم وإدارة طلبات وفواتير PDF وشات طلب ودعم وتقييمات\n• وحدة السائق: قبول الطلبات، تدفق الاستلام/التسليم، لوحة أرباح، موقع في الخلفية\n• لوحة تحكم (Flutter Web) للداشبورد والمستخدمين والسائقين والطلبات والمنتجات\n• إشعارات FCM، عربي/إنجليزي بدعم RTL كامل\n• 111 اختبار آلي (تتبع، توجيه، geocoding، موديلات، كيوبتات)\n\nالتقنيات: Flutter، Bloc/Cubit، Supabase (Postgres/RLS/Edge Functions)، Paymob، MapTiler، Firebase',
    'project_sneakers': 'سنيكرز',
    'project_sneakers_desc_short':
        'تطبيق متجر إلكتروني للأحذية الرياضية مع تصفح المنتجات وعملية الدفع.',
    'project_sneakers_desc':
        'تطبيق متجر إلكتروني للأحذية الرياضية مع تصفح المنتجات وإدارة السلة وعملية الدفع.',
    'project_soundora': 'ساوند أورا',
    'project_soundora_desc_short':
        'تطبيق موسيقى عربية متعدد المنصات مع كشف المقام لحظياً وكلمات متزامنة وصوت مكاني وقوائم ذكية.',
    'project_soundora_desc':
        'مشغل موسيقى عربي مبني على طريقة الموسيقى العربية الحقيقية: تشغيل واعي بالمقام، كلمات بتتابعها لحظة بلحظة، واكتشاف حسب المزاج مش النوع.\n\n• كشف المقام العربي لحظياً مع نسبة ثقة (رست، نهاوند، حجاز، بياتي، صبا، كرد، سيكاه، عجم) وإذاعات حسب السلم\n• كلمات متزامنة مع نقر للبحث، وضع كاريوكي، تلوين للمشاعر، وبطاقات كلمات قابلة للمشاركة\n• قوائم SmartDJ بأربع أنماط (حفلة، هدوء، تمارين، نوم) وMoodMap على 7 مزاجات\n• صوت مكاني، تحميل للاستماع أوفلاين، جلسات استماع جماعية، إنجازات وXP\n• قسم القرآن + TimeMachine (تصفح حسب العقد أو اللي نزل النهاردة)\n• باك إند Supabase/Postgres، إدارة حالة BLoC، ومنصات أندرويد · iOS · ويب\n\nالتقنيات: Flutter، Dart، Supabase، PostgreSQL، Bloc/Cubit، Firebase',
    'project_minishop': 'ميني شوب',
    'project_minishop_desc_short':
        'تطبيق متجر إلكتروني خفيف مع عرض المنتجات والبحث.',
    'project_minishop_desc':
        'تطبيق متجر إلكتروني خفيف مع عرض المنتجات والبحث وإدارة الطلبات.',
    'project_nexora': 'نكسورا',
    'project_nexora_desc_short':
        'منصة ذكاء مهني مدعومة بالذكاء الاصطناعي لبناء الملف الشخصي وإعداد السيرة الذاتية والمقابلات.',
    'project_nexora_desc':
        'السؤال الصعب مش "أكتب السيرة الذاتية إزاي"، السؤال "أنهي وظائف بتناسبني فعلاً وإزاي أثبتها". نكسورا بترد بدرجة مطابقة محسوبة، سيرة مكتوبة للوظيفة دي بالذات، ومقابلة تدريبية متقيَّمة.\n\n• بناء الملف من رفع CV أو استيراد GitHub أو أسئلة موجهة → Career DNA بإصدارات\n• محرك مطابقة بـ Dart خالص (مهارات، خبرة، مجال، فجوات) — الـ AI مش بيملك أي رقم\n• استوديو السيرة: توليد مخصص للوظيفة، fallback واقعي، فحص قبل الحفظ، 3 قوالب PDF، سجل إصدارات، وتقييم ATS\n• مقابلات صوتية تدريبية بـ TTS + تحويل الكلام لنص وتقييم بالدرجات\n• تتبع طلبات العمل، عربي/إنجليزي بدعم RTL، و57 ملف اختبار\n• 8 Edge Functions على Supabase تحمي مفاتيح الـ AI (Groq) مع فحص JWT وإصلاح JSON وfallback\n\nالتقنيات: Flutter، BLoC، Supabase (Postgres/RLS/Edge Functions)، Groq LLMs',
    'project_kalimny': 'كلمني (Kalimny)',
    'project_kalimny_desc_short':
        'مدرّس ذكاء اصطناعي صوتي لحظي بشخصية 3D و4 لغات ومنهج وحدات وامتحانات وملخصات تلقائية.',
    'project_kalimny_desc':
        'أغلب متعلمي اللغات بيتوتروا وقت الكلام الحقيقي لأن التمارين النصية مش شبه المحادثة. «كلمني» بيخليك تتكلم صوتياً في الوقت الفعلي مع مدرّس AI ثلاثي الأبعاد (يوناس ولينا) ودود بيهزر ويضحك ويصحح أخطاءك بلطف.\n\n• محادثات صوتية حية (Speech-to-Speech) عبر Gemini Live WebSocket مع أفاتار 3D تفاعلي وكتابة مباشرة للمحادثة\n• 4 لغات كاملة (الألمانية · الإنجليزية · الفرنسية · الإسبانية) × 6 سيناريوهات واقعية (المطار، المطعم، مقابلة عمل، التسوق، تاكسي، تحدي 5 دقائق)\n• منهج CEFR متدرج: إتمام 70% من وقت الجلسة بيولّد ملخص الدرس تلقائياً ويفتح امتحان الوحدة كشرط أساسي لفتح الوحدة التالية\n• بنك «أخطائي» تلقائي + فلاش كاردز ذكية من الكلمات والغلطات اللي ظهرت في كلامك\n• نظام ستريك وسكور يومي يشجع المتعلم يواظب كل يوم من غير انقطاع\n\nالتقنيات: Next.js، TypeScript، Supabase (Postgres/RLS)، Gemini Live Audio، Three.js',
    'screenshots_gallery': 'معرض شاشات التطبيق',
    'promo_video': 'فيديو شرح التطبيق بالتفصيل',
    'user_promo_video': 'فيديو شرح تطبيق العميل',
    'driver_promo_video': 'فيديو شرح تطبيق السائق',
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
