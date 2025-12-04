// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kinyarwanda (`rw`).
class AppLocalizationsRw extends AppLocalizations {
  AppLocalizationsRw([String locale = 'rw']) : super(locale);

  @override
  String get settingsTitle => 'Igenamiterere';

  @override
  String get notificationSettings => 'Igenamiterere';

  @override
  String get privacySettings => 'Igenamiterere ryibanga';

  @override
  String get accountSettings => 'Igenamiterere rya Konti';

  @override
  String get languageSettings => 'Igenamiterere ry\'ururimi';

  @override
  String get languageChanged => 'Ururimi rwarahindutse';

  @override
  String get existingUserButton => 'Ndi umukoresha uriho';

  @override
  String get chooseCountryTitle => 'Hitamo Igihugu';

  @override
  String get yesText => 'Yego';

  @override
  String get noText => 'Oya';

  @override
  String get appBarTitle => 'Igenamiterere ry\'umwirondoro';

  @override
  String get userIdLabel => 'ID ID *';

  @override
  String get nameLabel => 'Izina';

  @override
  String get birthCountryLabel => 'Igihugu cy\'amavuko';

  @override
  String get birthCityLabel => 'Umujyi wavukiye';

  @override
  String get countrySelectionTitle => 'Hitamo igihugu cyawe';

  @override
  String get maleLabel => 'Umugabo';

  @override
  String get femaleLabel => 'Umugore';

  @override
  String get birthDateLabel => 'Itariki y\'amavuko';

  @override
  String get birthDatePlaceholder => 'Hitamo Itariki Yavutse';

  @override
  String get birthTimeLabel => 'Igihe cyo kuvuka';

  @override
  String get birthTimePlaceholder => 'Hitamo Igihe cyo kuvuka';

  @override
  String get saveProfileButton => 'Bika Umwirondoro';

  @override
  String get noCitiesFound => 'Nta mijyi yabonetse';

  @override
  String cityPlaceholder(Object country) {
    return 'Enter city in $country';
  }

  @override
  String get countryFirstPlaceholder => 'Hitamo igihugu mbere';

  @override
  String get versionHistoryTitle => 'Amateka ya verisiyo';

  @override
  String get notSetText => 'Ntabwo yashyizweho';

  @override
  String nameHistory(Object name) {
    return 'Name: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'City: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Country: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Gender: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Birth Date: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Birth Time: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Location: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'State: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Updated on $date';
  }

  @override
  String get userIdRequired => 'ID ID irakenewe';

  @override
  String get profileSaved => 'Umwirondoro wabitswe neza';

  @override
  String get saveFailed => 'Kunanirwa kubika umwirondoro';

  @override
  String get errorPrefix => 'Ikosa:';

  @override
  String get onboardingChooseLanguage => 'Hitamo Ururimi rwawe';

  @override
  String get onboardingChooseLanguageDesc =>
      'Hitamo ururimi ukunda kugirango ukomeze.';

  @override
  String get onboardingWhatIsAstrology => 'Kuraguza inyenyeri ni iki?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Kuraguza inyenyeri nubushakashatsi bwimibiri yo mwijuru ...';

  @override
  String get onboardingWhyUseApp => 'Kuki ukoresha iyi porogaramu?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Shaka horoscopes yihariye, guhanura burimunsi, nubuyobozi bwo gufata ibyemezo byuzuye.';

  @override
  String get onboardingHowToUse => 'Nigute ushobora gukoresha iyi porogaramu?';

  @override
  String get onboardingHowToUseDesc =>
      'Kuyobora byoroshye, genzura horoscopes ya buri munsi, kandi ucunge umwirondoro wawe kugirango uhanure neza.';

  @override
  String get onboardingGetStarted => 'Tangira';

  @override
  String get onboardingNewUser => 'Umukoresha mushya';

  @override
  String get onboardingExistingUser => 'Umukoresha uriho';

  @override
  String get onboardingBack => 'Inyuma';

  @override
  String get onboardingNext => 'Ibikurikira';

  @override
  String get userIdNotFound =>
      'Indangamuntu y\'abakoresha ntabwo yabonetse. Nyamuneka injira cyangwa ushireho umwirondoro wawe.';

  @override
  String get clearNotificationsTitle => 'Kumenyesha neza';

  @override
  String get clearNotificationsMessage =>
      'Uzi neza ko ushaka gukuraho amatangazo yose?';

  @override
  String get clearNotificationsSuccess => 'Amatangazo yose yasibwe neza.';

  @override
  String get clearHoroscopeTitle => 'Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Uzi neza ko ushaka gukuraho amakuru ya horoscope?';

  @override
  String get clearHoroscopeSuccess => 'Horoscope yahanaguwe neza.';

  @override
  String get clearChatTitle => 'Sobanura Amateka y\'Ibiganiro';

  @override
  String get clearChatMessage =>
      'Uzi neza ko ushaka gusiba amateka yawe yose yo kuganira?';

  @override
  String get clearChatLocal => 'Ikiganiro cyakuweho.';

  @override
  String get deleteAccountTitle => 'Siba Konti';

  @override
  String get deleteAccountMessage =>
      'Uzi neza ko ushaka gusiba konte yawe? Ibi kandi bizahanagura amateka yawe yose yo kuganira no kumenyeshwa.';

  @override
  String get deleteAccountSuccess => 'Konti yawe hamwe namakuru yose yakuweho.';

  @override
  String get deleteAccountError => 'Ikosa ryo gusiba konti';

  @override
  String get logoutTitle => 'Kwinjira';

  @override
  String get logoutMessage => 'Uzi neza ko ushaka gusohoka?';

  @override
  String get termsPrivacyTitle => 'Amabwiriza & Ibanga';

  @override
  String get privacyPolicyTitle => 'Politiki Yibanga';

  @override
  String get termsConditionsTitle => 'Amabwiriza';

  @override
  String get dataControlTitle => 'Kugenzura amakuru';

  @override
  String get cancelButton => 'Kureka';

  @override
  String get confirmButton => 'Emeza';

  @override
  String get clearQuestionsSuccess => 'Ibibazo byose byasibwe neza.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Mwami';

  @override
  String get startLabel => 'Tangira';

  @override
  String get recoverAccount => 'Kugarura Konti';

  @override
  String get endLabel => 'Iherezo';

  @override
  String get startDateLabel => 'Itariki yo gutangiriraho';

  @override
  String get endDateLabel => 'Itariki yo kurangiriraho';

  @override
  String get notAvailable => 'Ntiboneka';

  @override
  String get noData => 'Nta makuru';

  @override
  String get unknownError => 'Ikosa ritazwi';

  @override
  String get retryButton => 'Ongera ugerageze';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Imbonerahamwe ya Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Impamyabumenyi';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Ntazwi';

  @override
  String get clearHoroscope => 'Horoscope';

  @override
  String get clearNotifications => 'Kumenyesha neza';

  @override
  String get clearChatHistory => 'Sobanura Amateka y\'Ibiganiro';

  @override
  String get logout => 'Kwinjira';

  @override
  String get deleteAccount => 'Siba Konti';

  @override
  String get allFieldsRequired => 'Imirima yose irakenewe.';

  @override
  String get accountRecoveredSuccess => 'Konti yagaruwe neza.';

  @override
  String get recoveryFailed => 'Gusubirana byarananiranye. Reba amakuru yawe.';

  @override
  String get recoverySecretLabel => 'Ibanga ryo Kugarura:';

  @override
  String get aboutUsTitle => 'Ibyerekeye Twebwe';

  @override
  String get aboutOurCompany => 'Ibyerekeye Isosiyete Yacu';

  @override
  String get aboutCompanyDescription =>
      'Kuri Karma, turagufasha gutahura inzira yawe yubuzima nyayo binyuze mubwenge butajegajega bwinyenyeri Vedic. Ubushishozi bwose buturuka mubyukuri, inyenyeri zifite ubunararibonye, zakozwe neza ukurikije imbonerahamwe yawe y\'amavuko idasanzwe. Kuva kuri horoscopes ya buri munsi kugeza ku buyobozi bwihariye, Karma ituma ubumenyi bwa kera bugera mu ndimi zirenga 100.';

  @override
  String get ourMission => 'Inshingano zacu';

  @override
  String get missionDescription =>
      'Inshingano yacu iroroshye: gutanga ukuri kwukuri, kayobowe nabantu kuraguza inyenyeri biguha imbaraga zo gufata ibyemezo byizewe, byuzuye. Buri guhanura no kugisha inama byerekana imyaka yubuhanga bwumwuga, ntabwo algorithms yikora.';

  @override
  String get ourVision => 'Icyerekezo cyacu';

  @override
  String get visionDescription =>
      'Duharanira kuba urubuga rwizewe kwisi kwisi kuraguza inyenyeri za Vedic, dufasha abantu aho bari hose kwiyumvisha ubwabo, amahitamo yabo, nurugendo rwubuzima bwabo bisobanutse kandi bizeye.';

  @override
  String get ourValues => 'Indangagaciro';

  @override
  String get valuesDescription =>
      'Kuri Karma, duha agaciro ukuri, neza, no kwizera. Twiyemeje gutanga ubuyobozi butari ukuri gusa ariko kandi bufite ireme, bugufasha kuyobora ubuzima ufite ubushishozi nicyizere.';

  @override
  String get contactUs => 'Twandikire';

  @override
  String get contactEmail => 'Imeri: inkunga@yourcompany.com';

  @override
  String get contactWebsite => 'Urubuga: www.urubuga rwawe';

  @override
  String get customerSupport => 'Inkunga y\'abakiriya';

  @override
  String get supportHeroTitle => 'Turi hano kugirango dufashe';

  @override
  String get supportHeroDescription =>
      'Uzuza iyi fomu hepfo hanyuma itsinda ryacu ridutera inkunga rizakugarukira vuba bishoboka.';

  @override
  String get yourName => 'Izina ryawe';

  @override
  String get yourEmail => 'Imeri yawe';

  @override
  String get message => 'Ubutumwa';

  @override
  String get enterEmail => 'Injira imeri yawe';

  @override
  String get enterValidEmail => 'Injiza imeri yemewe';

  @override
  String enterField(Object fieldName) {
    return 'Enter $fieldName';
  }

  @override
  String get send => 'Ohereza';

  @override
  String get sending => 'Kohereza ...';

  @override
  String get emailSentSuccess => 'Mail Imeri yoherejwe neza!';

  @override
  String get emailSendFailed => 'Kunanirwa kohereza imeri';

  @override
  String get astroDictionaryTitle => 'Inkoranyamagambo';

  @override
  String get searchTermsHint => 'Amagambo yo gushakisha ...';

  @override
  String get noTermsFound => 'Nta magambo yabonetse';

  @override
  String get buyQuestionsTitle => 'Gura Ibibazo';

  @override
  String get userNotAuthenticated => 'Umukoresha ntabwo yemewe';

  @override
  String get loadStoreDataFailed => 'Kunanirwa gupakira amakuru yububiko';

  @override
  String get missingAuthToken => 'Kubura auth token';

  @override
  String get merchantDisplayName => 'Ikiganiro cya Astro';

  @override
  String get paymentSuccessful => 'Kwishura neza! Ikibazo cyoherejwe';

  @override
  String paymentFailed(Object error) {
    return '❌ Payment failed: $error';
  }

  @override
  String get yourBalance => 'Impirimbanyi yawe';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Impano Ziboneka';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Gura';

  @override
  String get dailyHoroscopeTitle => 'Hor Horoscope ya buri munsi';

  @override
  String get userIdMissing => 'Indangamuntu y\'abakoresha irabuze';

  @override
  String get fetchHoroscopesFailed => 'Kunanirwa kuzana horoscopes';

  @override
  String get noHoroscopeFound => 'Nta horoscope yabonetse.';

  @override
  String get signLabel => 'Shyira umukono';

  @override
  String get todayLabel => 'Uyu munsi';

  @override
  String get yesterdayLabel => 'Ejo';

  @override
  String get thisWeekLabel => 'Muri iki cyumweru';

  @override
  String get lastMonthLabel => 'Ukwezi gushize';

  @override
  String get chatTitle => 'Kuganira';

  @override
  String get typeYourQuestionHint => 'Andika ikibazo cyawe ...';

  @override
  String get paymentRequired => 'Birasabwa Kwishura';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Wakoresheje ibibazo byubusa. Kwishura $amount kugirango ukomeze.';
  }

  @override
  String get payNowButton => 'Iyishyure nonaha';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count free questions remaining';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count paid questions remaining';
  }

  @override
  String get thankYouFeedback => 'Urakoze kubitekerezo byawe!';

  @override
  String get ratingSubmitted => 'Urutonde rwatanzwe!';

  @override
  String get setUserIdFirst => 'Nyamuneka shyira indangamuntu yawe mbere';

  @override
  String get failedToFetchPrevious =>
      'Kunanirwa kuzana ibibazo nibisubizo byabanje';

  @override
  String errorOccurred(Object error) {
    return 'Error: $error';
  }

  @override
  String get drawerAstroProfile => 'Umwirondoro wa Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscope ya buri munsi';

  @override
  String get drawerBuyQuestions => 'Gura Ibibazo';

  @override
  String get drawerAstroDictionary => 'Inkoranyamagambo';

  @override
  String get drawerSettings => 'Igenamiterere';

  @override
  String get drawerCustomerSupport => 'Inkunga y\'abakiriya';

  @override
  String get drawerAbout => 'Ibyerekeye';

  @override
  String get drawerProfileSettings => 'Igenamiterere ry\'umwirondoro';

  @override
  String get demoNotificationTitle => 'Not Kumenyesha Demo';

  @override
  String get demoNotificationBody =>
      'Ubu ni integuza yikizamini muri porogaramu yawe!';

  @override
  String get notificationsTitle => 'Kumenyesha';

  @override
  String get noNotifications => 'Nta menyesha';

  @override
  String get allTab => 'Byose';

  @override
  String get markAllAsRead => 'Shyira akamenyetso nkuko wasomwe';

  @override
  String get notificationMarkedRead =>
      'Imenyekanisha ryashyizweho nkuko ryasomwe';

  @override
  String get failedToLoadNotifications => 'Kunanirwa kwimenyesha';

  @override
  String get failedToMarkRead => 'Kunanirwa gushira akamenyetso nkuko byasomwe';

  @override
  String get failedToMarkAllRead =>
      'Kunanirwa gushiraho ibimenyetso byose nkuko byasomwe';

  @override
  String get socketConnected => 'Sock ihujwe';

  @override
  String get socketDisconnected => 'Sock yaciwe';

  @override
  String get newNotificationReceived => 'Imenyekanisha rishya ryakiriwe';

  @override
  String get generalCategory => 'Jenerali';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Kuganira';

  @override
  String get systemCategory => 'Sisitemu';

  @override
  String get updateCategory => 'Ibishya';

  @override
  String get howToAskTitle => 'Uburyo bwo Kubaza';

  @override
  String get noQuestionsAvailable => 'Nta kibazo gihari';

  @override
  String get failedToLoadQuestions => 'Kunanirwa gupakira ibibazo';

  @override
  String get pullToRefresh => 'Kurura kugarura ubuyanja';

  @override
  String get careerCategory => 'Umwuga';

  @override
  String get loveCategory => 'Urukundo & Isano';

  @override
  String get healthCategory => 'Ubuzima';

  @override
  String get financeCategory => 'Imari';

  @override
  String get familyCategory => 'Umuryango';

  @override
  String get educationCategory => 'Uburezi';

  @override
  String get travelCategory => 'Urugendo';

  @override
  String get spiritualCategory => 'Umwuka';

  @override
  String get profileLoaded => 'Umwirondoro wuzuye neza';

  @override
  String get imageUploaded => 'Ishusho yoherejwe neza';

  @override
  String get savedInformationConfirmation => 'Nabitse aya makuru';

  @override
  String get noHistoryAvailable => 'Nta mateka aboneka';

  @override
  String get missingUserIdError => 'ID ID irakenewe';

  @override
  String get networkError => 'Ikosa ry\'urusobe. Nyamuneka gerageza.';

  @override
  String get timeoutError => 'Gusaba igihe cyateganijwe';

  @override
  String get genericError => 'Ikintu kitagenze neza';

  @override
  String get reactionUpdateError => 'Kunanirwa kuvugurura reaction';

  @override
  String get noSearchResults => 'Nta bisubizo by\'ishakisha byabonetse';

  @override
  String get clearSearch => 'Gushakisha neza';

  @override
  String get resultsFound => 'Ibisubizo byabonetse';

  @override
  String get recoverySecretHint =>
      'Gukoporora-paste ntishobora gukora, andika intoki';

  @override
  String get recoverAccountDescription =>
      'Kurikiza izi ntambwe kugirango ugarure konte yawe';

  @override
  String get processingLabel => 'Gutunganya ...';

  @override
  String get clearChatSuccess => 'Ikiganiro cyatsinzwe neza';

  @override
  String get notificationsEnabled => 'Kumenyesha birashoboka';

  @override
  String get notificationsDisabled => 'Amatangazo yarahagaritswe';

  @override
  String get securityNotice => 'Amakuru yawe arahishe neza kandi arabitswe';

  @override
  String get loading => 'Kuremera ...';

  @override
  String get selectLanguage => 'Hitamo Ururimi';

  @override
  String get onboardingGetStartedDesc => 'Tangira uhitamo ururimi rwawe';

  @override
  String get accountRecoveryTitle => '🔐 Ibisobanuro birambuye kuri konti';

  @override
  String get recoveryInstructions =>
      'Nyamuneka uzigame aya makuru neza. Uzakenera kugarura konte yawe.';

  @override
  String get importantNotice => 'Ingenzi:';

  @override
  String get astrologerProfileTitle => 'Umwirondoro w\'inyenyeri';

  @override
  String get personalAstrologer => 'Kuraguza inyenyeri';

  @override
  String get makePersonalAstrologer => 'Kora inyenyeri kugiti cyawe';

  @override
  String get favoriteDescription =>
      'Ibibazo byawe bizashyirwa imbere kuriyi nyenyeri. Niba bidashoboka, undi munyenyeri wujuje ibyangombwa azagufasha.';

  @override
  String get educationQualifications => 'Uburezi & Impamyabumenyi';

  @override
  String get aboutSection => 'Ibyerekeye';

  @override
  String get shareProfile => 'Sangira Umwirondoro';

  @override
  String get loadingAstrologer => 'Gupakira inyenyeri zirambuye ...';

  @override
  String get failedToLoadAstrologer => 'Kunanirwa gupakira inyenyeri zirambuye';

  @override
  String get authenticationRequired => 'Kwemeza birakenewe. Nyamuneka injira.';

  @override
  String securityCheckFailed(Object error) {
    return 'Security check failed: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name is now your Personal Astrologer';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Removed $name from favorites';
  }

  @override
  String get toggleFavoriteError => 'Kunanirwa kuvugurura imiterere ukunda';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Education: $education\n📜 Qualification: $qualification\n⏳ Experience: $experience';
  }

  @override
  String get notProvided => 'Ntabwo yatanzwe';

  @override
  String reviews(Object count) {
    return '($count reviews)';
  }

  @override
  String get specialties => 'Umwihariko';

  @override
  String get experience => 'Uburambe';

  @override
  String get qualification => 'Impamyabumenyi';

  @override
  String get education => 'Uburezi';

  @override
  String get recoveryTips =>
      '• Fata amashusho yaya makuru\n• Ubike ahantu hizewe\n• Ntugasangire n\'umuntu uwo ari we wese\n• Ibi bizerekanwa rimwe gusa';

  @override
  String get themeSettingsTitle => 'Igenamiterere';

  @override
  String get lightThemeLabel => 'Umucyo';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Umwijima';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Sisitemu';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'Ikipe yacu';

  @override
  String get teamDescription =>
      'Itsinda ryacu ryabahanga mu bumenyi bw\'inyenyeri Vedic bazana uburambe bwimyaka yo gusobanura ingaruka zimibumbe nubuzima. Dushyigikiwe nitsinda ryabigenewe hamwe nitsinda ryiterambere, Karma atanga uburambe, bwizewe, kandi kwisi yose kuri buri mukoresha.';
}
