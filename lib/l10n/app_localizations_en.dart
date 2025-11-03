// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settingsTitle => 'Settings';

  @override
  String get notificationSettings => 'Notification Settings';

  @override
  String get privacySettings => 'Privacy Settings';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get languageSettings => 'Language Settings';

  @override
  String get languageChanged => 'Language changed';

  @override
  String get existingUserButton => 'I am an existing user';

  @override
  String get chooseCountryTitle => 'Choose Country';

  @override
  String get yesText => 'Yes';

  @override
  String get noText => 'No';

  @override
  String get appBarTitle => 'Profile Settings';

  @override
  String get userIdLabel => 'User ID *';

  @override
  String get nameLabel => 'Name';

  @override
  String get birthCountryLabel => 'Birth Country';

  @override
  String get birthCityLabel => 'Birth City';

  @override
  String get countrySelectionTitle => 'Choose your country';

  @override
  String get maleLabel => 'Male';

  @override
  String get femaleLabel => 'Female';

  @override
  String get birthDateLabel => 'Birth Date';

  @override
  String get birthDatePlaceholder => 'Select Birth Date';

  @override
  String get birthTimeLabel => 'Birth Time';

  @override
  String get birthTimePlaceholder => 'Select Birth Time';

  @override
  String get saveProfileButton => 'Save Profile';

  @override
  String get noCitiesFound => 'No cities found';

  @override
  String cityPlaceholder(Object country) {
    return 'Enter city in $country';
  }

  @override
  String get countryFirstPlaceholder => 'Select country first';

  @override
  String get versionHistoryTitle => 'Version History';

  @override
  String get notSetText => 'Not set';

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
  String get userIdRequired => 'User ID is required';

  @override
  String get profileSaved => 'Profile saved successfully';

  @override
  String get saveFailed => 'Failed to save profile';

  @override
  String get errorPrefix => 'Error:';

  @override
  String get onboardingChooseLanguage => 'Choose Your Language';

  @override
  String get onboardingChooseLanguageDesc =>
      'Select your preferred language to continue.';

  @override
  String get onboardingWhatIsAstrology => 'What is Astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrology is the study of celestial bodies...';

  @override
  String get onboardingWhyUseApp => 'Why use this app?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Get personalized horoscopes, daily predictions, and guidance to make informed decisions.';

  @override
  String get onboardingHowToUse => 'How to use this app?';

  @override
  String get onboardingHowToUseDesc =>
      'Navigate easily, check daily horoscopes, and manage your profile for accurate predictions.';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboardingNewUser => 'New User';

  @override
  String get onboardingExistingUser => 'Existing User';

  @override
  String get onboardingBack => 'Back';

  @override
  String get onboardingNext => 'Next';

  @override
  String get userIdNotFound =>
      'User ID not found. Please login or set your profile.';

  @override
  String get clearNotificationsTitle => 'Clear Notifications';

  @override
  String get clearNotificationsMessage =>
      'Are you sure you want to clear all notifications?';

  @override
  String get clearNotificationsSuccess =>
      'All notifications cleared successfully.';

  @override
  String get clearHoroscopeTitle => 'Clear Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Are you sure you want to clear your horoscope data?';

  @override
  String get clearHoroscopeSuccess => 'Horoscope cleared successfully.';

  @override
  String get clearChatTitle => 'Clear Chat History';

  @override
  String get clearChatMessage =>
      'Are you sure you want to delete all your chat history?';

  @override
  String get clearChatLocal => 'Chat cleared locally.';

  @override
  String get deleteAccountTitle => 'Delete Account';

  @override
  String get deleteAccountMessage =>
      'Are you sure you want to delete your account? This will also clear all your chat history and notifications.';

  @override
  String get deleteAccountSuccess =>
      'Your account and all data have been removed.';

  @override
  String get deleteAccountError => 'Error deleting account';

  @override
  String get logoutTitle => 'Logout';

  @override
  String get logoutMessage => 'Are you sure you want to logout?';

  @override
  String get termsPrivacyTitle => 'Terms & Privacy';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get termsConditionsTitle => 'Terms & Conditions';

  @override
  String get dataControlTitle => 'Data Control';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get confirmButton => 'Confirm';

  @override
  String get clearQuestionsSuccess => 'All questions deleted successfully.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Lord';

  @override
  String get startLabel => 'Start';

  @override
  String get recoverAccount => 'Recover Account';

  @override
  String get endLabel => 'End';

  @override
  String get startDateLabel => 'Start Date';

  @override
  String get endDateLabel => 'End Date';

  @override
  String get notAvailable => 'Not available';

  @override
  String get noData => 'No data';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get retryButton => 'Retry';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Natal Chart';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Ascendant Degree';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Unknown';

  @override
  String get clearHoroscope => 'Clear Horoscope';

  @override
  String get clearNotifications => 'Clear Notifications';

  @override
  String get clearChatHistory => 'Clear Chat History';

  @override
  String get logout => 'Logout';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get allFieldsRequired => 'All fields are required.';

  @override
  String get accountRecoveredSuccess => 'Account recovered successfully.';

  @override
  String get recoveryFailed => 'Recovery failed. Check your information.';

  @override
  String get recoverySecretLabel => 'Recovery Secret:';

  @override
  String get aboutUsTitle => 'About Us';

  @override
  String get aboutOurCompany => 'About Our Company';

  @override
  String get aboutCompanyDescription =>
      'We are committed to delivering the best astrology experience to our users.';

  @override
  String get ourMission => 'Our Mission';

  @override
  String get missionDescription =>
      'To provide accurate and personalized astrology insights to help users make informed decisions in their lives.';

  @override
  String get ourVision => 'Our Vision';

  @override
  String get visionDescription =>
      'To become the most trusted astrology platform, combining technology and ancient wisdom.';

  @override
  String get ourValues => 'Our Values';

  @override
  String get valuesDescription =>
      'Integrity, Accuracy, User-Centric Design, and Continuous Innovation.';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Website: www.yourcompany.com';

  @override
  String get customerSupport => 'Customer Support';

  @override
  String get supportHeroTitle => 'We\'re Here to Help';

  @override
  String get supportHeroDescription =>
      'Fill out the form below and our support team will get back to you as soon as possible.';

  @override
  String get yourName => 'Your Name';

  @override
  String get yourEmail => 'Your Email';

  @override
  String get message => 'Message';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get enterValidEmail => 'Enter a valid email address';

  @override
  String enterField(Object fieldName) {
    return 'Enter $fieldName';
  }

  @override
  String get send => 'Send';

  @override
  String get sending => 'Sending...';

  @override
  String get emailSentSuccess => '✅ Email sent successfully!';

  @override
  String get emailSendFailed => '❌ Failed to send email';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Search terms...';

  @override
  String get noTermsFound => 'No terms found';

  @override
  String get buyQuestionsTitle => 'Buy Questions';

  @override
  String get userNotAuthenticated => 'User not authenticated';

  @override
  String get loadStoreDataFailed => 'Failed to load store data';

  @override
  String get missingAuthToken => 'Missing auth token';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful => '✅ Payment successful! Question sent';

  @override
  String paymentFailed(Object error) {
    return '❌ Payment failed: $error';
  }

  @override
  String get yourBalance => 'Your Balance';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Available Offers';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Buy';

  @override
  String get dailyHoroscopeTitle => '🌟 Daily Horoscope';

  @override
  String get userIdMissing => 'User ID is missing';

  @override
  String get fetchHoroscopesFailed => 'Failed to fetch horoscopes';

  @override
  String get noHoroscopeFound => 'No horoscope found.';

  @override
  String get signLabel => 'Sign';

  @override
  String get todayLabel => 'Today';

  @override
  String get yesterdayLabel => 'Yesterday';

  @override
  String get thisWeekLabel => 'This Week';

  @override
  String get lastMonthLabel => 'Last Month';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Type your question...';

  @override
  String get paymentRequired => 'Payment Required';

  @override
  String get paymentRequiredMessage =>
      'You\'ve used your free questions. Pay ₹50 to continue.';

  @override
  String get payNowButton => 'Pay Now';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count free questions remaining';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count paid questions remaining';
  }

  @override
  String get thankYouFeedback => 'Thank you for your feedback!';

  @override
  String get ratingSubmitted => 'Rating submitted!';

  @override
  String get setUserIdFirst => 'Please set your User ID first';

  @override
  String get failedToFetchPrevious =>
      'Failed to fetch previous questions and answers';

  @override
  String errorOccurred(Object error) {
    return 'Error: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profile';

  @override
  String get drawerDailyHoroscope => 'Daily Horoscope';

  @override
  String get drawerBuyQuestions => 'Buy Questions';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Settings';

  @override
  String get drawerCustomerSupport => 'Customer Support';

  @override
  String get drawerAbout => 'About';

  @override
  String get drawerProfileSettings => 'Profile Settings';

  @override
  String get demoNotificationTitle => '🔔 Demo Notification';

  @override
  String get demoNotificationBody =>
      'This is a test notification from your app!';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get noNotifications => 'No notifications';

  @override
  String get allTab => 'All';

  @override
  String get markAllAsRead => 'Mark all as read';

  @override
  String get notificationMarkedRead => 'Notification marked as read';

  @override
  String get failedToLoadNotifications => 'Failed to load notifications';

  @override
  String get failedToMarkRead => 'Failed to mark as read';

  @override
  String get failedToMarkAllRead => 'Failed to mark all as read';

  @override
  String get socketConnected => 'Socket connected';

  @override
  String get socketDisconnected => 'Socket disconnected';

  @override
  String get newNotificationReceived => 'New notification received';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'System';

  @override
  String get updateCategory => 'Updates';

  @override
  String get howToAskTitle => 'How To Ask';

  @override
  String get noQuestionsAvailable => 'No questions available';

  @override
  String get failedToLoadQuestions => 'Failed to load questions';

  @override
  String get pullToRefresh => 'Pull to refresh';

  @override
  String get careerCategory => 'Career';

  @override
  String get loveCategory => 'Love & Relationships';

  @override
  String get healthCategory => 'Health';

  @override
  String get financeCategory => 'Finance';

  @override
  String get familyCategory => 'Family';

  @override
  String get educationCategory => 'Education';

  @override
  String get travelCategory => 'Travel';

  @override
  String get spiritualCategory => 'Spiritual';

  @override
  String get profileLoaded => 'Profile loaded successfully';

  @override
  String get imageUploaded => 'Image uploaded successfully';

  @override
  String get savedInformationConfirmation => 'I\'ve Saved This Information';

  @override
  String get noHistoryAvailable => 'No history available';

  @override
  String get missingUserIdError => 'User ID is required';

  @override
  String get networkError => 'Network error. Please try again.';

  @override
  String get timeoutError => 'Request timed out';

  @override
  String get genericError => 'Something went wrong';

  @override
  String get reactionUpdateError => 'Failed to update reaction';

  @override
  String get noSearchResults => 'No search results found';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get resultsFound => 'Results found';

  @override
  String get recoverySecretHint => 'Copy-paste may not work, type manually';

  @override
  String get recoverAccountDescription =>
      'Follow these steps to recover your account';

  @override
  String get processingLabel => 'Processing...';

  @override
  String get clearChatSuccess => 'Chat cleared successfully';

  @override
  String get notificationsEnabled => 'Notifications enabled';

  @override
  String get notificationsDisabled => 'Notifications disabled';

  @override
  String get securityNotice => 'Your data is securely encrypted and stored';

  @override
  String get loading => 'Loading...';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get onboardingGetStartedDesc =>
      'Get started by choosing your language';

  @override
  String get accountRecoveryTitle => '🔐 Account Recovery Details';

  @override
  String get recoveryInstructions =>
      'Please save this information securely. You\'ll need it to recover your account.';

  @override
  String get importantNotice => '⚠️ Important:';

  @override
  String get astrologerProfileTitle => 'Astrologer Profile';

  @override
  String get personalAstrologer => 'Personal Astrologer';

  @override
  String get makePersonalAstrologer => 'Make Personal Astrologer';

  @override
  String get favoriteDescription =>
      'Your questions will be prioritized to this astrologer. If unavailable, another qualified astrologer will assist you.';

  @override
  String get educationQualifications => 'Education & Qualifications';

  @override
  String get aboutSection => 'About';

  @override
  String get shareProfile => 'Share Profile';

  @override
  String get loadingAstrologer => 'Loading astrologer details...';

  @override
  String get failedToLoadAstrologer => 'Failed to load astrologer details';

  @override
  String get authenticationRequired =>
      'Authentication required. Please log in.';

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
  String get toggleFavoriteError => 'Failed to update favorite status';

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
  String get notProvided => 'Not provided';

  @override
  String reviews(Object count) {
    return '($count reviews)';
  }

  @override
  String get specialties => 'Specialties';

  @override
  String get experience => 'Experience';

  @override
  String get qualification => 'Qualification';

  @override
  String get education => 'Education';

  @override
  String get recoveryTips =>
      '• Take a screenshot of this information\n• Store it in a secure place\n• Do not share with anyone\n• This will only be shown once';
}
