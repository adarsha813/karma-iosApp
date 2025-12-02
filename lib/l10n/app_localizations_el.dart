// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get notificationSettings => 'Ρυθμίσεις ειδοποιήσεων';

  @override
  String get privacySettings => 'Ρυθμίσεις απορρήτου';

  @override
  String get accountSettings => 'Ρυθμίσεις λογαριασμού';

  @override
  String get languageSettings => 'Ρυθμίσεις γλώσσας';

  @override
  String get languageChanged => 'Γλώσσα άλλαξε';

  @override
  String get existingUserButton => 'Είμαι ένας υπάρχοντας χρήστης';

  @override
  String get chooseCountryTitle => 'Επιλέξτε χώρα';

  @override
  String get yesText => 'Ναί';

  @override
  String get noText => 'Οχι';

  @override
  String get appBarTitle => 'Ρυθμίσεις προφίλ';

  @override
  String get userIdLabel => 'Αναγνωριστικό χρήστη *';

  @override
  String get nameLabel => 'Ονομα';

  @override
  String get birthCountryLabel => 'Χώρα Γέννησης';

  @override
  String get birthCityLabel => 'Πόλη γέννησης';

  @override
  String get countrySelectionTitle => 'Επιλέξτε τη χώρα σας';

  @override
  String get maleLabel => 'Αρσενικός';

  @override
  String get femaleLabel => 'Θηλυκός';

  @override
  String get birthDateLabel => 'Ημερομηνία γέννησης';

  @override
  String get birthDatePlaceholder => 'Επιλέξτε Ημερομηνία Γέννησης';

  @override
  String get birthTimeLabel => 'Ώρα Γέννησης';

  @override
  String get birthTimePlaceholder => 'Επιλέξτε Ώρα Γέννησης';

  @override
  String get saveProfileButton => 'Αποθήκευση προφίλ';

  @override
  String get noCitiesFound => 'Δεν βρέθηκαν πόλεις';

  @override
  String cityPlaceholder(Object country) {
    return 'Εισαγάγετε την πόλη στο $country';
  }

  @override
  String get countryFirstPlaceholder => 'Επιλέξτε πρώτα χώρα';

  @override
  String get versionHistoryTitle => 'Ιστορικό εκδόσεων';

  @override
  String get notSetText => 'Δεν έχει οριστεί';

  @override
  String nameHistory(Object name) {
    return 'Όνομα: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Πόλη: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Χώρα: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Φύλο: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Ημερομηνία γέννησης: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Ώρα Γέννησης: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Τοποθεσία: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Ζώνη ώρας: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Θερινή ώρα: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Κατάσταση: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Ενημερώθηκε στις $date';
  }

  @override
  String get userIdRequired => 'Απαιτείται αναγνωριστικό χρήστη';

  @override
  String get profileSaved => 'Το προφίλ αποθηκεύτηκε με επιτυχία.';

  @override
  String get saveFailed => 'Η αποθήκευση του προφίλ απέτυχε';

  @override
  String get errorPrefix => 'Σφάλμα:';

  @override
  String get onboardingChooseLanguage => 'Επιλέξτε τη γλώσσα σας';

  @override
  String get onboardingChooseLanguageDesc =>
      'Επιλέξτε την προτιμώμενη γλώσσα σας για να συνεχίσετε.';

  @override
  String get onboardingWhatIsAstrology => 'Τι είναι η Αστρολογία;';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Η αστρολογία είναι η μελέτη των ουράνιων σωμάτων...';

  @override
  String get onboardingWhyUseApp =>
      'Γιατί να χρησιμοποιήσετε αυτήν την εφαρμογή;';

  @override
  String get onboardingWhyUseAppDesc =>
      'Λάβετε εξατομικευμένα ωροσκόπια, καθημερινές προβλέψεις και καθοδήγηση για να λαμβάνετε τεκμηριωμένες αποφάσεις.';

  @override
  String get onboardingHowToUse => 'Πώς να χρησιμοποιήσετε αυτήν την εφαρμογή;';

  @override
  String get onboardingHowToUseDesc =>
      'Πλοηγηθείτε εύκολα, ελέγξτε τα καθημερινά ωροσκόπια και διαχειριστείτε το προφίλ σας για ακριβείς προβλέψεις.';

  @override
  String get onboardingGetStarted => 'Ξεκινήστε';

  @override
  String get onboardingNewUser => 'Νέος χρήστης';

  @override
  String get onboardingExistingUser => 'Υπάρχων χρήστης';

  @override
  String get onboardingBack => 'Πίσω';

  @override
  String get onboardingNext => 'Επόμενος';

  @override
  String get userIdNotFound =>
      'Δεν βρέθηκε αναγνωριστικό χρήστη. Συνδεθείτε ή ορίστε το προφίλ σας.';

  @override
  String get clearNotificationsTitle => 'Διαγραφή ειδοποιήσεων';

  @override
  String get clearNotificationsMessage =>
      'Είστε βέβαιοι ότι θέλετε να διαγράψετε όλες τις ειδοποιήσεις;';

  @override
  String get clearNotificationsSuccess =>
      'Όλες οι ειδοποιήσεις διαγράφηκαν με επιτυχία.';

  @override
  String get clearHoroscopeTitle => 'Καθαρό Ωροσκόπιο';

  @override
  String get clearHoroscopeMessage =>
      'Είστε σίγουροι ότι θέλετε να διαγράψετε τα δεδομένα του ωροσκοπίου σας;';

  @override
  String get clearHoroscopeSuccess => 'Το ωροσκόπιο διαγράφηκε με επιτυχία.';

  @override
  String get clearChatTitle => 'Εκκαθάριση ιστορικού συνομιλίας';

  @override
  String get clearChatMessage =>
      'Είστε σίγουροι ότι θέλετε να διαγράψετε όλο το ιστορικό συνομιλιών σας;';

  @override
  String get clearChatLocal => 'Η συνομιλία διαγράφηκε τοπικά.';

  @override
  String get deleteAccountTitle => 'Διαγραφή λογαριασμού';

  @override
  String get deleteAccountMessage =>
      'Είστε βέβαιοι ότι θέλετε να διαγράψετε τον λογαριασμό σας; Αυτή η ενέργεια θα διαγράψει επίσης όλο το ιστορικό συνομιλιών και τις ειδοποιήσεις σας.';

  @override
  String get deleteAccountSuccess =>
      'Ο λογαριασμός σας και όλα τα δεδομένα σας έχουν καταργηθεί.';

  @override
  String get deleteAccountError =>
      'Σφάλμα κατά τη διαγραφή του λογαριασμού κατά τη διαγραφή του.';

  @override
  String get logoutTitle => 'Αποσύνδεση';

  @override
  String get logoutMessage => 'Είστε σίγουροι ότι θέλετε να αποσυνδεθείτε;';

  @override
  String get termsPrivacyTitle => 'Όροι και Απόρρητο';

  @override
  String get privacyPolicyTitle => 'Πολιτική Απορρήτου';

  @override
  String get termsConditionsTitle => 'Όροι και Προϋποθέσεις';

  @override
  String get dataControlTitle => 'Έλεγχος Δεδομένων';

  @override
  String get cancelButton => 'Ματαίωση';

  @override
  String get confirmButton => 'Επιβεβαιώνω';

  @override
  String get clearQuestionsSuccess =>
      'Όλες οι ερωτήσεις διαγράφηκαν με επιτυχία.';

  @override
  String get yoginiLabel => 'Γιογκίνι';

  @override
  String get lordLabel => 'Αρχοντας';

  @override
  String get startLabel => 'Αρχή';

  @override
  String get recoverAccount => 'Ανάκτηση Λογαριασμού';

  @override
  String get endLabel => 'Τέλος';

  @override
  String get startDateLabel => 'Ημερομηνία έναρξης';

  @override
  String get endDateLabel => 'Ημερομηνία λήξης';

  @override
  String get notAvailable => 'Δεν είναι διαθέσιμο';

  @override
  String get noData => 'Δεν υπάρχουν δεδομένα';

  @override
  String get unknownError => 'Άγνωστο σφάλμα';

  @override
  String get retryButton => 'Δοκιμάζω πάλι';

  @override
  String get kundaliGeneratorTitle => 'Γεννήτρια Κουντάλι';

  @override
  String get natalChartTitle => 'Γενέθλιος Χάρτης';

  @override
  String get lagnaLabel => 'Λάγκνα';

  @override
  String get rashiLabel => 'Ρασί';

  @override
  String get ascDegreeLabel => 'Ανοδική Μοίρα';

  @override
  String get vimshottariDashaTitle => 'Βιμσοτάρι Ντάσα';

  @override
  String get yoginiDashaTitle => 'Γιογκίνι Ντάσα';

  @override
  String get unknown => 'Αγνωστος';

  @override
  String get clearHoroscope => 'Καθαρό Ωροσκόπιο';

  @override
  String get clearNotifications => 'Διαγραφή ειδοποιήσεων';

  @override
  String get clearChatHistory => 'Εκκαθάριση ιστορικού συνομιλίας';

  @override
  String get logout => 'Αποσύνδεση';

  @override
  String get deleteAccount => 'Διαγραφή λογαριασμού';

  @override
  String get allFieldsRequired => 'Όλα τα πεδία είναι υποχρεωτικά.';

  @override
  String get accountRecoveredSuccess => 'Ο λογαριασμός ανακτήθηκε με επιτυχία.';

  @override
  String get recoveryFailed => 'Η ανάκτηση απέτυχε. Ελέγξτε τα στοιχεία σας.';

  @override
  String get recoverySecretLabel => 'Μυστικό Ανάρρωσης:';

  @override
  String get aboutUsTitle => 'Σχετικά με εμάς';

  @override
  String get aboutOurCompany => 'Σχετικά με την εταιρεία μας';

  @override
  String get aboutCompanyDescription =>
      'Δεσμευόμαστε να προσφέρουμε την καλύτερη αστρολογική εμπειρία στους χρήστες μας.';

  @override
  String get ourMission => 'Η Αποστολή μας';

  @override
  String get missionDescription =>
      'Να παρέχει ακριβείς και εξατομικευμένες αστρολογικές πληροφορίες που θα βοηθήσουν τους χρήστες να λαμβάνουν τεκμηριωμένες αποφάσεις στη ζωή τους.';

  @override
  String get ourVision => 'Το Όραμά μας';

  @override
  String get visionDescription =>
      'Να γίνει η πιο αξιόπιστη πλατφόρμα αστρολογίας, συνδυάζοντας την τεχνολογία και την αρχαία σοφία.';

  @override
  String get ourValues => 'Οι Αξίες μας';

  @override
  String get valuesDescription =>
      'Ακεραιότητα, Ακρίβεια, Σχεδιασμός με επίκεντρο τον χρήστη και Συνεχής Καινοτομία.';

  @override
  String get contactUs => 'Επικοινωνήστε μαζί μας';

  @override
  String get contactEmail => 'Ηλεκτρονικό ταχυδρομείο: support@yourcompany.com';

  @override
  String get contactWebsite => 'Ιστότοπος: www.yourcompany.com';

  @override
  String get customerSupport => 'Υποστήριξη πελατών';

  @override
  String get supportHeroTitle => 'Είμαστε εδώ για να βοηθήσουμε';

  @override
  String get supportHeroDescription =>
      'Συμπληρώστε την παρακάτω φόρμα και η ομάδα υποστήριξής μας θα επικοινωνήσει μαζί σας το συντομότερο δυνατό.';

  @override
  String get yourName => 'Το όνομά σας';

  @override
  String get yourEmail => 'Το ηλεκτρονικό σας ταχυδρομείο';

  @override
  String get message => 'Μήνυμα';

  @override
  String get enterEmail => 'Εισαγάγετε το email σας';

  @override
  String get enterValidEmail =>
      'Εισαγάγετε μια έγκυρη διεύθυνση ηλεκτρονικού ταχυδρομείου';

  @override
  String enterField(Object fieldName) {
    return 'Εισαγάγετε $fieldName';
  }

  @override
  String get send => 'Στέλνω';

  @override
  String get sending => 'Αποστολή...';

  @override
  String get emailSentSuccess => '✅ Το email στάλθηκε με επιτυχία!';

  @override
  String get emailSendFailed => '❌ Αποτυχία αποστολής email';

  @override
  String get astroDictionaryTitle => 'Αστρολογικό Λεξικό';

  @override
  String get searchTermsHint => 'Όροι αναζήτησης...';

  @override
  String get noTermsFound => 'Δεν βρέθηκαν όροι';

  @override
  String get buyQuestionsTitle => 'Ερωτήσεις αγοράς';

  @override
  String get userNotAuthenticated => 'Ο χρήστης δεν έχει πιστοποιηθεί';

  @override
  String get loadStoreDataFailed => 'Αποτυχία φόρτωσης δεδομένων καταστήματος';

  @override
  String get missingAuthToken => 'Λείπει διακριτικό εξουσιοδότησης';

  @override
  String get merchantDisplayName => 'Εφαρμογή Astro Chat';

  @override
  String get paymentSuccessful =>
      '✅ Η πληρωμή ήταν επιτυχής! Η ερώτηση στάλθηκε!';

  @override
  String paymentFailed(Object error) {
    return '❌ Η πληρωμή απέτυχε: $error';
  }

  @override
  String get yourBalance => 'Το Υπόλοιπό σας';

  @override
  String questionsBalance(Object count) {
    return '$count Ερωτήσεις';
  }

  @override
  String get availableOffers => 'Διαθέσιμες προσφορές';

  @override
  String questionsCount(Object count) {
    return '$count Ερώτηση';
  }

  @override
  String get buyButton => 'Αγορά';

  @override
  String get dailyHoroscopeTitle => '🌟 Ημερήσιο Ωροσκόπιο';

  @override
  String get userIdMissing => 'Λείπει το αναγνωριστικό χρήστη';

  @override
  String get fetchHoroscopesFailed => 'Αποτυχία λήψης ωροσκοπίων';

  @override
  String get noHoroscopeFound => 'Δεν βρέθηκε ωροσκόπιο.';

  @override
  String get signLabel => 'Σημείο';

  @override
  String get todayLabel => 'Σήμερα';

  @override
  String get yesterdayLabel => 'Εχθές';

  @override
  String get thisWeekLabel => 'Αυτή την εβδομάδα';

  @override
  String get lastMonthLabel => 'Τον περασμένο μήνα';

  @override
  String get chatTitle => 'Κουβέντα';

  @override
  String get typeYourQuestionHint => 'Πληκτρολογήστε την ερώτησή σας...';

  @override
  String get paymentRequired => 'Απαιτείται πληρωμή';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Χρησιμοποιήσατε τις δωρεάν ερωτήσεις σας. Πληρώστε ₹50 για να συνεχίσετε.';
  }

  @override
  String get payNowButton => 'Πληρώστε τώρα';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count Απομένουν δωρεάν ερωτήσεις';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count Απομένουν ερωτήσεις επί πληρωμή';
  }

  @override
  String get thankYouFeedback => 'Σας ευχαριστούμε για τα σχόλιά σας!';

  @override
  String get ratingSubmitted => 'Η αξιολόγηση υποβλήθηκε!';

  @override
  String get setUserIdFirst =>
      'Παρακαλώ ορίστε πρώτα το αναγνωριστικό χρήστη σας';

  @override
  String get failedToFetchPrevious =>
      'Αποτυχία ανάκτησης προηγούμενων ερωτήσεων και απαντήσεων';

  @override
  String errorOccurred(Object error) {
    return 'Σφάλμα: $error';
  }

  @override
  String get drawerAstroProfile => 'Προφίλ Astro';

  @override
  String get drawerDailyHoroscope => 'Ημερήσιο Ωροσκόπιο';

  @override
  String get drawerBuyQuestions => 'Ερωτήσεις αγοράς';

  @override
  String get drawerAstroDictionary => 'Αστρολογικό Λεξικό';

  @override
  String get drawerSettings => 'Ρυθμίσεις';

  @override
  String get drawerCustomerSupport => 'Υποστήριξη πελατών';

  @override
  String get drawerAbout => 'Για';

  @override
  String get drawerProfileSettings => 'Ρυθμίσεις προφίλ';

  @override
  String get demoNotificationTitle => '🔔 Ειδοποίηση επίδειξης';

  @override
  String get demoNotificationBody =>
      'Αυτή είναι μια δοκιμαστική ειδοποίηση από την εφαρμογή σας!';

  @override
  String get notificationsTitle => 'Ειδοποιήσεις';

  @override
  String get noNotifications => 'Δεν υπάρχουν ειδοποιήσεις';

  @override
  String get allTab => 'Ολοι';

  @override
  String get markAllAsRead => 'Σήμανση όλων ως αναγνωσμένων';

  @override
  String get notificationMarkedRead =>
      'Η ειδοποίηση επισημάνθηκε ως αναγνωσμένη';

  @override
  String get failedToLoadNotifications => 'Η φόρτωση των ειδοποιήσεων απέτυχε';

  @override
  String get failedToMarkRead => 'Η σήμανση ως αναγνωσμένης απέτυχε';

  @override
  String get failedToMarkAllRead => 'Αποτυχία επισήμανσης όλων ως αναγνωσμένων';

  @override
  String get socketConnected => 'Πρίζα συνδεδεμένη';

  @override
  String get socketDisconnected => 'Η υποδοχή αποσυνδέθηκε';

  @override
  String get newNotificationReceived => 'Νέα ειδοποίηση ελήφθη';

  @override
  String get generalCategory => 'Γενικός';

  @override
  String get horoscopeCategory => 'Ωροσκόπιο';

  @override
  String get chatCategory => 'Κουβέντα';

  @override
  String get systemCategory => 'Σύστημα';

  @override
  String get updateCategory => 'Ενημερώσεις';

  @override
  String get howToAskTitle => 'Πώς να ρωτήσετε';

  @override
  String get noQuestionsAvailable => 'Δεν υπάρχουν διαθέσιμες ερωτήσεις';

  @override
  String get failedToLoadQuestions => 'Η φόρτωση ερωτήσεων απέτυχε';

  @override
  String get pullToRefresh => 'Τραβήξτε για ανανέωση';

  @override
  String get careerCategory => 'Καριέρα';

  @override
  String get loveCategory => 'Αγάπη & Σχέσεις';

  @override
  String get healthCategory => 'Υγεία';

  @override
  String get financeCategory => 'Οικονομικά';

  @override
  String get familyCategory => 'Οικογένεια';

  @override
  String get educationCategory => 'Εκπαίδευση';

  @override
  String get travelCategory => 'Ταξίδι';

  @override
  String get spiritualCategory => 'Πνευματικός';

  @override
  String get profileLoaded => 'Το προφίλ φορτώθηκε με επιτυχία.';

  @override
  String get imageUploaded => 'Η εικόνα μεταφορτώθηκε με επιτυχία.';

  @override
  String get savedInformationConfirmation =>
      'Έχω αποθηκεύσει αυτές τις πληροφορίες';

  @override
  String get noHistoryAvailable => 'Δεν υπάρχει διαθέσιμο ιστορικό';

  @override
  String get missingUserIdError => 'Απαιτείται αναγνωριστικό χρήστη';

  @override
  String get networkError => 'Σφάλμα δικτύου. Δοκιμάστε ξανά.';

  @override
  String get timeoutError => 'Το αίτημα έληξε';

  @override
  String get genericError => 'Κάτι πήγε στραβά';

  @override
  String get reactionUpdateError => 'Η ενημέρωση της αντίδρασης απέτυχε';

  @override
  String get noSearchResults => 'Δεν βρέθηκαν αποτελέσματα αναζήτησης';

  @override
  String get clearSearch => 'Εκκαθάριση αναζήτησης';

  @override
  String get resultsFound => 'Βρέθηκαν αποτελέσματα';

  @override
  String get recoverySecretHint =>
      'Η αντιγραφή-επικόλληση ενδέχεται να μην λειτουργεί, πληκτρολογήστε χειροκίνητα';

  @override
  String get recoverAccountDescription =>
      'Ακολουθήστε αυτά τα βήματα για να ανακτήσετε τον λογαριασμό σας';

  @override
  String get processingLabel => 'Επεξεργασία...';

  @override
  String get clearChatSuccess => 'Η συνομιλία διαγράφηκε με επιτυχία.';

  @override
  String get notificationsEnabled => 'Οι ειδοποιήσεις ενεργοποιήθηκαν';

  @override
  String get notificationsDisabled => 'Οι ειδοποιήσεις απενεργοποιήθηκαν';

  @override
  String get securityNotice =>
      'Τα δεδομένα σας κρυπτογραφούνται και αποθηκεύονται με ασφάλεια';

  @override
  String get loading => 'Φόρτωση...';

  @override
  String get selectLanguage => 'Επιλογή Γλώσσας';

  @override
  String get onboardingGetStartedDesc => 'Ξεκινήστε επιλέγοντας τη γλώσσα σας';

  @override
  String get accountRecoveryTitle => '🔐 Λεπτομέρειες ανάκτησης λογαριασμού';

  @override
  String get recoveryInstructions =>
      'Αποθηκεύστε αυτές τις πληροφορίες με ασφάλεια. Θα τις χρειαστείτε για να ανακτήσετε τον λογαριασμό σας.';

  @override
  String get importantNotice => '⚠️ Σημαντικό:';

  @override
  String get astrologerProfileTitle => 'Προφίλ Αστρολόγου';

  @override
  String get personalAstrologer => 'Προσωπικός Αστρολόγος';

  @override
  String get makePersonalAstrologer => 'Δημιουργήστε έναν προσωπικό αστρολόγο';

  @override
  String get favoriteDescription =>
      'Οι ερωτήσεις σας θα εξεταστούν κατά προτεραιότητα από αυτόν τον αστρολόγο. Εάν δεν είστε διαθέσιμος, ένας άλλος εξειδικευμένος αστρολόγος θα σας βοηθήσει.';

  @override
  String get educationQualifications => 'Εκπαίδευση & Προσόντα';

  @override
  String get aboutSection => 'Για';

  @override
  String get shareProfile => 'Κοινοποίηση προφίλ';

  @override
  String get loadingAstrologer => 'Φόρτωση στοιχείων αστρολόγου...';

  @override
  String get failedToLoadAstrologer => 'Αποτυχία φόρτωσης στοιχείων αστρολόγου';

  @override
  String get authenticationRequired =>
      'Απαιτείται έλεγχος ταυτότητας. Παρακαλούμε συνδεθείτε.';

  @override
  String securityCheckFailed(Object error) {
    return 'Ο έλεγχος ασφαλείας απέτυχε: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 Ο/Η $name είναι πλέον ο/η Προσωπικός/ή σας Αστρολόγος';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Αφαιρέθηκε το $name από τα αγαπημένα';
  }

  @override
  String get toggleFavoriteError =>
      'Η ενημέρωση της κατάστασης αγαπημένου απέτυχε';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Εκπαίδευση: $education\n📜 Προσόντα: $qualification\n⏳ Εμπειρία: $experience';
  }

  @override
  String get notProvided => 'Δεν παρέχεται';

  @override
  String reviews(Object count) {
    return '($count αξιολογήσεις)';
  }

  @override
  String get specialties => 'Ειδικότητες';

  @override
  String get experience => 'Εμπειρία';

  @override
  String get qualification => 'Προσόν';

  @override
  String get education => 'Εκπαίδευση';

  @override
  String get recoveryTips =>
      '• Λήψη στιγμιότυπου οθόνης αυτών των πληροφοριών\n• Αποθηκεύστε το σε ασφαλές μέρος\n• Μην το κοινοποιήσετε σε κανέναν\n• Αυτό θα εμφανιστεί μόνο μία φορά';

  @override
  String get themeSettingsTitle => 'Ρυθμίσεις θέματος';

  @override
  String get lightThemeLabel => 'Φως';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Σκοτάδι';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Σύστημα';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
