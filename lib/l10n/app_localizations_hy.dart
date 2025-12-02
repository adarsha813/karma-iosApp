// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Armenian (`hy`).
class AppLocalizationsHy extends AppLocalizations {
  AppLocalizationsHy([String locale = 'hy']) : super(locale);

  @override
  String get settingsTitle => 'Կարգավորումներ';

  @override
  String get notificationSettings => 'Ծանուցումների կարգավորումներ';

  @override
  String get privacySettings => 'Գաղտնիության կարգավորումներ';

  @override
  String get accountSettings => 'Հաշվի կարգավորումներ';

  @override
  String get languageSettings => 'Լեզվի կարգավորումներ';

  @override
  String get languageChanged => 'Լեզուն փոխվել է';

  @override
  String get existingUserButton => 'Ես արդեն իսկ գրանցված օգտատեր եմ';

  @override
  String get chooseCountryTitle => 'Ընտրեք երկիրը';

  @override
  String get yesText => 'Այո';

  @override
  String get noText => 'Ոչ';

  @override
  String get appBarTitle => 'Պրոֆիլի կարգավորումներ';

  @override
  String get userIdLabel => 'Օգտատիրոջ ID *';

  @override
  String get nameLabel => 'Անուն';

  @override
  String get birthCountryLabel => 'Ծննդյան երկիր';

  @override
  String get birthCityLabel => 'Ծննդավայր';

  @override
  String get countrySelectionTitle => 'Ընտրեք ձեր երկիրը';

  @override
  String get maleLabel => 'Արական';

  @override
  String get femaleLabel => 'Իգական';

  @override
  String get birthDateLabel => 'Ծննդյան ամսաթիվ';

  @override
  String get birthDatePlaceholder => 'Ընտրեք ծննդյան ամսաթիվը';

  @override
  String get birthTimeLabel => 'Ծննդյան ժամը';

  @override
  String get birthTimePlaceholder => 'Ընտրեք ծննդյան ժամը';

  @override
  String get saveProfileButton => 'Պահպանել պրոֆիլը';

  @override
  String get noCitiesFound => 'Քաղաքներ չեն գտնվել';

  @override
  String cityPlaceholder(Object country) {
    return 'Մուտքագրեք քաղաքը $country դաշտում';
  }

  @override
  String get countryFirstPlaceholder => 'Նախ ընտրեք երկիրը';

  @override
  String get versionHistoryTitle => 'Տարբերակների պատմություն';

  @override
  String get notSetText => 'Սահմանված չէ';

  @override
  String nameHistory(Object name) {
    return 'Անուն՝ $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Քաղաք՝ $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Երկիր՝ $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Սեռը՝ $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Ծննդյան ամսաթիվ՝ $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Ծննդյան ժամը՝ $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Գտնվելու վայրը՝ $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Ժամային գոտի՝ GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Վիճակ՝ $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Թարմացվել է $date-ին';
  }

  @override
  String get userIdRequired => 'Օգտատիրոջ ID-ն պարտադիր է';

  @override
  String get profileSaved => 'Պրոֆիլը հաջողությամբ պահպանվեց';

  @override
  String get saveFailed => 'Չհաջողվեց պահպանել պրոֆիլը';

  @override
  String get errorPrefix => 'Սխալ՝';

  @override
  String get onboardingChooseLanguage => 'Ընտրեք ձեր լեզուն';

  @override
  String get onboardingChooseLanguageDesc =>
      'Շարունակելու համար ընտրեք ձեր նախընտրած լեզուն։';

  @override
  String get onboardingWhatIsAstrology => 'Ի՞նչ է աստղագուշակությունը։';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Աստղագուշակությունը երկնային մարմինների ուսումնասիրությունն է...';

  @override
  String get onboardingWhyUseApp => 'Ինչու՞ օգտագործել այս հավելվածը։';

  @override
  String get onboardingWhyUseAppDesc =>
      'Ստացեք անհատականացված հորոսկոպներ, ամենօրյա կանխատեսումներ և ուղեցույց՝ տեղեկացված որոշումներ կայացնելու համար։';

  @override
  String get onboardingHowToUse => 'Ինչպե՞ս օգտագործել այս հավելվածը։';

  @override
  String get onboardingHowToUseDesc =>
      'Հեշտությամբ նավարկեք, ստուգեք ամենօրյա հորոսկոպները և կառավարեք ձեր պրոֆիլը՝ ճշգրիտ կանխատեսումներ ստանալու համար։';

  @override
  String get onboardingGetStarted => 'Սկսել';

  @override
  String get onboardingNewUser => 'Նոր օգտատեր';

  @override
  String get onboardingExistingUser => 'Գոյություն ունեցող օգտատեր';

  @override
  String get onboardingBack => 'Հետ';

  @override
  String get onboardingNext => 'Հաջորդը';

  @override
  String get userIdNotFound =>
      'Օգտատիրոջ ID-ն չի գտնվել։ Մուտք գործեք կամ կարգավորեք ձեր պրոֆիլը։';

  @override
  String get clearNotificationsTitle => 'Մաքրել ծանուցումները';

  @override
  String get clearNotificationsMessage =>
      'Վստա՞հ եք, որ ուզում եք մաքրել բոլոր ծանուցումները։';

  @override
  String get clearNotificationsSuccess =>
      'Բոլոր ծանուցումները հաջողությամբ մաքրվեցին։';

  @override
  String get clearHoroscopeTitle => 'Մաքուր հորոսկոպ';

  @override
  String get clearHoroscopeMessage =>
      'Վստա՞հ եք, որ ուզում եք մաքրել ձեր հորոսկոպի տվյալները։';

  @override
  String get clearHoroscopeSuccess => 'Հորոսկոպը հաջողությամբ մաքրվեց։';

  @override
  String get clearChatTitle => 'Մաքրել զրույցի պատմությունը';

  @override
  String get clearChatMessage =>
      'Վստա՞հ եք, որ ուզում եք ջնջել ձեր զրույցի ամբողջ պատմությունը։';

  @override
  String get clearChatLocal => 'Զրույցը մաքրվել է տեղական մակարդակով։';

  @override
  String get deleteAccountTitle => 'Ջնջել հաշիվը';

  @override
  String get deleteAccountMessage =>
      'Վստա՞հ եք, որ ուզում եք ջնջել ձեր հաշիվը: Սա նաև կջնջի ձեր բոլոր զրույցների պատմությունը և ծանուցումները:';

  @override
  String get deleteAccountSuccess =>
      'Ձեր հաշիվը և բոլոր տվյալները հեռացվել են։';

  @override
  String get deleteAccountError => 'Հաշիվը ջնջելիս սխալ առաջացավ։';

  @override
  String get logoutTitle => 'Ելք';

  @override
  String get logoutMessage => 'Վստա՞հ եք, որ ուզում եք դուրս գալ։';

  @override
  String get termsPrivacyTitle => 'Պայմաններ և գաղտնիություն';

  @override
  String get privacyPolicyTitle => 'Գաղտնիության քաղաքականություն';

  @override
  String get termsConditionsTitle => 'Պայմաններ և դրույթներ';

  @override
  String get dataControlTitle => 'Տվյալների վերահսկողություն';

  @override
  String get cancelButton => 'Չեղարկել';

  @override
  String get confirmButton => 'Հաստատել';

  @override
  String get clearQuestionsSuccess => 'Բոլոր հարցերը հաջողությամբ ջնջվեցին։';

  @override
  String get yoginiLabel => 'Յոգինի';

  @override
  String get lordLabel => 'Տեր';

  @override
  String get startLabel => 'Սկսել';

  @override
  String get recoverAccount => 'Վերականգնել հաշիվը';

  @override
  String get endLabel => 'Ավարտ';

  @override
  String get startDateLabel => 'Սկզբի ամսաթիվ';

  @override
  String get endDateLabel => 'Ավարտի ամսաթիվ';

  @override
  String get notAvailable => 'Հասանելի չէ';

  @override
  String get noData => 'Տվյալներ չկան';

  @override
  String get unknownError => 'Անհայտ սխալ';

  @override
  String get retryButton => 'Կրկին փորձել';

  @override
  String get kundaliGeneratorTitle => 'Կունդալիի գեներատոր';

  @override
  String get natalChartTitle => 'Ծննդյան քարտեզ';

  @override
  String get lagnaLabel => 'Լագնա';

  @override
  String get rashiLabel => 'Ռաշի';

  @override
  String get ascDegreeLabel => 'Ասցենդենտ աստիճան';

  @override
  String get vimshottariDashaTitle => 'Վիմշոտարի Դաշա';

  @override
  String get yoginiDashaTitle => 'Յոգինի Դաշա';

  @override
  String get unknown => 'Անհայտ';

  @override
  String get clearHoroscope => 'Մաքուր հորոսկոպ';

  @override
  String get clearNotifications => 'Մաքրել ծանուցումները';

  @override
  String get clearChatHistory => 'Մաքրել զրույցի պատմությունը';

  @override
  String get logout => 'Ելք';

  @override
  String get deleteAccount => 'Ջնջել հաշիվը';

  @override
  String get allFieldsRequired => 'Բոլոր դաշտերը պարտադիր են։';

  @override
  String get accountRecoveredSuccess => 'Հաշիվը հաջողությամբ վերականգնվեց։';

  @override
  String get recoveryFailed =>
      'Վերականգնումը ձախողվեց։ Ստուգեք ձեր տեղեկությունները։';

  @override
  String get recoverySecretLabel => 'Վերականգնման գաղտնիքը.';

  @override
  String get aboutUsTitle => 'Մեր մասին';

  @override
  String get aboutOurCompany => 'Մեր ընկերության մասին';

  @override
  String get aboutCompanyDescription =>
      'Մենք հանձնառու ենք մեր օգտատերերին լավագույն աստղագուշակական փորձը մատուցելուն։';

  @override
  String get ourMission => 'Մեր առաքելությունը';

  @override
  String get missionDescription =>
      'Տրամադրել ճշգրիտ և անհատականացված աստղագուշակական պատկերացումներ՝ օգտատերերին օգնելու կայացնել տեղեկացված որոշումներ իրենց կյանքում։';

  @override
  String get ourVision => 'Մեր տեսլականը';

  @override
  String get visionDescription =>
      'Դառնալ ամենահուսալի աստղագուշակության հարթակը՝ համատեղելով տեխնոլոգիան և հին իմաստությունը։';

  @override
  String get ourValues => 'Մեր արժեքները';

  @override
  String get valuesDescription =>
      'Ամբողջականություն, ճշգրտություն, օգտատերակենտրոն դիզայն և շարունակական նորարարություն։';

  @override
  String get contactUs => 'Կապ մեզ հետ';

  @override
  String get contactEmail => 'Էլ․ հասցե՝ support@yourcompany.com';

  @override
  String get contactWebsite => 'Կայք՝ www.yourcompany.com';

  @override
  String get customerSupport => 'Հաճախորդների աջակցություն';

  @override
  String get supportHeroTitle => 'Մենք այստեղ ենք՝ օգնելու համար';

  @override
  String get supportHeroDescription =>
      'Լրացրեք ստորև բերված ձևը, և մեր աջակցության թիմը կկապվի ձեզ հետ հնարավորինս շուտ։';

  @override
  String get yourName => 'Ձեր անունը';

  @override
  String get yourEmail => 'Ձեր էլ. փոստը';

  @override
  String get message => 'Հաղորդագրություն';

  @override
  String get enterEmail => 'Մուտքագրեք ձեր էլ․ հասցեն';

  @override
  String get enterValidEmail => 'Մուտքագրեք վավեր էլեկտրոնային հասցե';

  @override
  String enterField(Object fieldName) {
    return 'Մուտքագրեք $fieldName';
  }

  @override
  String get send => 'Ուղարկել';

  @override
  String get sending => 'Ուղարկվում է...';

  @override
  String get emailSentSuccess => '✅ Էլ․ փոստը հաջողությամբ ուղարկվեց։';

  @override
  String get emailSendFailed => '❌ Էլ․փոստը չհաջողվեց ուղարկել';

  @override
  String get astroDictionaryTitle => 'Աստղագիտական բառարան';

  @override
  String get searchTermsHint => 'Որոնման տերմիններ...';

  @override
  String get noTermsFound => 'Տերմիններ չեն գտնվել';

  @override
  String get buyQuestionsTitle => 'Գնման հարցեր';

  @override
  String get userNotAuthenticated => 'Օգտատերը չի հաստատվել';

  @override
  String get loadStoreDataFailed => 'Չհաջողվեց բեռնել խանութի տվյալները';

  @override
  String get missingAuthToken => 'Հաստատման տոկենը բացակայում է';

  @override
  String get merchantDisplayName => 'Astro Chat հավելված';

  @override
  String get paymentSuccessful => '✅ Վճարումը հաջողվեց։ Հարցն ուղարկված է։';

  @override
  String paymentFailed(Object error) {
    return '❌ Վճարումը ձախողվեց՝ $error';
  }

  @override
  String get yourBalance => 'Ձեր մնացորդը';

  @override
  String questionsBalance(Object count) {
    return '$count Հարցեր';
  }

  @override
  String get availableOffers => 'Հասանելի առաջարկներ';

  @override
  String questionsCount(Object count) {
    return '$count Հարց';
  }

  @override
  String get buyButton => 'Գնել';

  @override
  String get dailyHoroscopeTitle => '🌟 Օրական հորոսկոպ';

  @override
  String get userIdMissing => 'Օգտատիրոջ ID-ն բացակայում է';

  @override
  String get fetchHoroscopesFailed => 'Չհաջողվեց ստանալ հորոսկոպները';

  @override
  String get noHoroscopeFound => 'Հորոսկոպ չի գտնվել։';

  @override
  String get signLabel => 'Նշան';

  @override
  String get todayLabel => 'Այսօր';

  @override
  String get yesterdayLabel => 'Երեկ';

  @override
  String get thisWeekLabel => 'Այս շաբաթ';

  @override
  String get lastMonthLabel => 'Անցյալ ամիս';

  @override
  String get chatTitle => 'Զրուցարան';

  @override
  String get typeYourQuestionHint => 'Մուտքագրեք ձեր հարցը...';

  @override
  String get paymentRequired => 'Վճարումը պարտադիր է';

  @override
  String get paymentRequiredMessage =>
      'Դուք օգտագործել եք ձեր անվճար հարցերը։ Վճարեք ₹50՝ շարունակելու համար։';

  @override
  String get payNowButton => 'Վճարեք հիմա';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count Մնացել են անվճար հարցեր';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count վճարովի հարցեր են մնացել';
  }

  @override
  String get thankYouFeedback => 'Շնորհակալություն ձեր կարծիքի համար։';

  @override
  String get ratingSubmitted => 'Գնահատականը ներկայացված է։';

  @override
  String get setUserIdFirst => 'Խնդրում ենք նախ սահմանել ձեր օգտատիրոջ ID-ն';

  @override
  String get failedToFetchPrevious =>
      'Չհաջողվեց ստանալ նախորդ հարցերն ու պատասխանները';

  @override
  String errorOccurred(Object error) {
    return 'Սխալ՝ $error';
  }

  @override
  String get drawerAstroProfile => 'Աստրո պրոֆիլ';

  @override
  String get drawerDailyHoroscope => 'Օրական հորոսկոպ';

  @override
  String get drawerBuyQuestions => 'Գնման հարցեր';

  @override
  String get drawerAstroDictionary => 'Աստղագիտական բառարան';

  @override
  String get drawerSettings => 'Կարգավորումներ';

  @override
  String get drawerCustomerSupport => 'Հաճախորդների աջակցություն';

  @override
  String get drawerAbout => 'Մասին';

  @override
  String get drawerProfileSettings => 'Պրոֆիլի կարգավորումներ';

  @override
  String get demoNotificationTitle => '🔔 Դեմո ծանուցում';

  @override
  String get demoNotificationBody => 'Սա ձեր հավելվածից փորձնական ծանուցում է։';

  @override
  String get notificationsTitle => 'Ծանուցումներ';

  @override
  String get noNotifications => 'Ծանուցումներ չկան';

  @override
  String get allTab => 'Բոլորը';

  @override
  String get markAllAsRead => 'Նշել բոլորը որպես կարդացված';

  @override
  String get notificationMarkedRead => 'Ծանուցումը նշված է որպես կարդացված';

  @override
  String get failedToLoadNotifications => 'Ծանուցումները չհաջողվեց բեռնել';

  @override
  String get failedToMarkRead => 'Չհաջողվեց նշել որպես կարդացված';

  @override
  String get failedToMarkAllRead => 'Չհաջողվեց բոլորը նշել որպես կարդացված';

  @override
  String get socketConnected => 'Սոկեթը միացված է';

  @override
  String get socketDisconnected => 'Վարդակը անջատված է';

  @override
  String get newNotificationReceived => 'Ստացվել է նոր ծանուցում';

  @override
  String get generalCategory => 'Ընդհանուր';

  @override
  String get horoscopeCategory => 'Հորոսկոպ';

  @override
  String get chatCategory => 'Զրուցարան';

  @override
  String get systemCategory => 'Համակարգ';

  @override
  String get updateCategory => 'Թարմացումներ';

  @override
  String get howToAskTitle => 'Ինչպես հարցնել';

  @override
  String get noQuestionsAvailable => 'Հարցեր չկան';

  @override
  String get failedToLoadQuestions => 'Հարցերը չհաջողվեց բեռնել';

  @override
  String get pullToRefresh => 'Քաշեք՝ թարմացնելու համար';

  @override
  String get careerCategory => 'Կարիերա';

  @override
  String get loveCategory => 'Սեր և հարաբերություններ';

  @override
  String get healthCategory => 'Առողջություն';

  @override
  String get financeCategory => 'Ֆինանսներ';

  @override
  String get familyCategory => 'Ընտանիք';

  @override
  String get educationCategory => 'Կրթություն';

  @override
  String get travelCategory => 'Ճանապարհորդություն';

  @override
  String get spiritualCategory => 'Հոգևոր';

  @override
  String get profileLoaded => 'Պրոֆիլը հաջողությամբ բեռնվեց';

  @override
  String get imageUploaded => 'Պատկերը հաջողությամբ վերբեռնվեց';

  @override
  String get savedInformationConfirmation =>
      'Ես պահպանել եմ այս տեղեկատվությունը';

  @override
  String get noHistoryAvailable => 'Պատմությունը հասանելի չէ';

  @override
  String get missingUserIdError => 'Օգտատիրոջ ID-ն պարտադիր է';

  @override
  String get networkError => 'Ցանցի սխալ։ Խնդրում ենք կրկին փորձել։';

  @override
  String get timeoutError => 'Հարցման ժամանակը սպառվել է';

  @override
  String get genericError => 'Ինչ-որ բան սխալ է գնացել';

  @override
  String get reactionUpdateError => 'Չհաջողվեց թարմացնել արձագանքը';

  @override
  String get noSearchResults => 'Որոնման արդյունքներ չեն գտնվել';

  @override
  String get clearSearch => 'Մաքրել որոնումը';

  @override
  String get resultsFound => 'Գտնվել են արդյունքներ';

  @override
  String get recoverySecretHint =>
      'Պատճենել-տեղադրել կարող է չաշխատել, գրեք ձեռքով';

  @override
  String get recoverAccountDescription =>
      'Հետևեք այս քայլերին՝ ձեր հաշիվը վերականգնելու համար';

  @override
  String get processingLabel => 'Մշակվում է...';

  @override
  String get clearChatSuccess => 'Զրույցը հաջողությամբ մաքրվեց';

  @override
  String get notificationsEnabled => 'Ծանուցումները միացված են';

  @override
  String get notificationsDisabled => 'Ծանուցումներն անջատված են';

  @override
  String get securityNotice =>
      'Ձեր տվյալները անվտանգ կերպով կոդավորված և պահվում են';

  @override
  String get loading => 'Բեռնվում է...';

  @override
  String get selectLanguage => 'Ընտրեք լեզուն';

  @override
  String get onboardingGetStartedDesc => 'Սկսեք՝ ընտրելով ձեր լեզուն';

  @override
  String get accountRecoveryTitle => '🔐 Հաշվի վերականգնման մանրամասներ';

  @override
  String get recoveryInstructions =>
      'Խնդրում ենք այս տեղեկատվությունը անվտանգ պահել։ Այն ձեզ անհրաժեշտ կլինի ձեր հաշիվը վերականգնելու համար։';

  @override
  String get importantNotice => '⚠️ Կարևոր է.';

  @override
  String get astrologerProfileTitle => 'Աստղագուշակի պրոֆիլ';

  @override
  String get personalAstrologer => 'Անձնական աստղագուշակ';

  @override
  String get makePersonalAstrologer => 'Ստեղծեք անձնական աստղագուշակ';

  @override
  String get favoriteDescription =>
      'Ձեր հարցերը առաջնահերթ կքննարկվեն այս աստղագուշակի հետ։ Եթե դուք հասանելի չեք, ձեզ կօգնի մեկ այլ որակավորված աստղագուշակ։';

  @override
  String get educationQualifications => 'Կրթություն և որակավորում';

  @override
  String get aboutSection => 'Մասին';

  @override
  String get shareProfile => 'Կիսվել պրոֆիլով';

  @override
  String get loadingAstrologer => 'Աստղաբանի մանրամասները բեռնվում են...';

  @override
  String get failedToLoadAstrologer =>
      'Աստղագուշակի մանրամասները չհաջողվեց բեռնել';

  @override
  String get authenticationRequired =>
      'Անհրաժեշտ է նույնականացում։ Խնդրում ենք մուտք գործել։';

  @override
  String securityCheckFailed(Object error) {
    return 'Անվտանգության ստուգումը ձախողվեց. $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name-ը այժմ ձեր անձնական աստղագուշակն է';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name-ը հեռացվել է ընտրյալներից';
  }

  @override
  String get toggleFavoriteError =>
      'Չհաջողվեց թարմացնել նախընտրածի կարգավիճակը';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Կրթություն՝ $education\n📜 Որակավորում՝ $qualification\n⏳ Աշխատանքային փորձ՝ $experience';
  }

  @override
  String get notProvided => 'Չի տրամադրվել';

  @override
  String reviews(Object count) {
    return '($count ակնարկներ)';
  }

  @override
  String get specialties => 'Մասնագիտություններ';

  @override
  String get experience => 'Փորձառություն';

  @override
  String get qualification => 'Որակավորում';

  @override
  String get education => 'Կրթություն';

  @override
  String get recoveryTips =>
      '• Կատարեք այս տեղեկատվության էկրանի նկարը\n• Պահեք այն անվտանգ տեղում\n• Մի կիսվեք որևէ մեկի հետ\n• Սա կցուցադրվի միայն մեկ անգամ';

  @override
  String get themeSettingsTitle => 'Թեմայի կարգավորումներ';

  @override
  String get lightThemeLabel => 'Լույս';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Մութ';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Համակարգ';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
