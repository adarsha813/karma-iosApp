// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get notificationSettings => 'Paramètres de notification';

  @override
  String get privacySettings => 'Paramètres de confidentialité';

  @override
  String get accountSettings => 'Paramètres du compte';

  @override
  String get languageSettings => 'Paramètres de langue';

  @override
  String get languageChanged => 'La langue a changé';

  @override
  String get existingUserButton => 'Je suis un utilisateur existant';

  @override
  String get chooseCountryTitle => 'Choisir un pays';

  @override
  String get yesText => 'Oui';

  @override
  String get noText => 'Non';

  @override
  String get appBarTitle => 'Paramètres du profil';

  @override
  String get userIdLabel => 'ID de l\'utilisateur *';

  @override
  String get nameLabel => 'Nom';

  @override
  String get birthCountryLabel => 'Pays de naissance';

  @override
  String get birthCityLabel => 'Ville natale';

  @override
  String get countrySelectionTitle => 'Choisissez votre pays';

  @override
  String get maleLabel => 'Mâle';

  @override
  String get femaleLabel => 'Femelle';

  @override
  String get birthDateLabel => 'Date de naissance';

  @override
  String get birthDatePlaceholder => 'Sélectionner la date de naissance';

  @override
  String get birthTimeLabel => 'Heure de naissance';

  @override
  String get birthTimePlaceholder => 'Sélectionnez l\'heure de naissance';

  @override
  String get saveProfileButton => 'Enregistrer le profil';

  @override
  String get noCitiesFound => 'Aucune ville trouvée';

  @override
  String cityPlaceholder(Object country) {
    return 'Saisissez la ville dans $country';
  }

  @override
  String get countryFirstPlaceholder => 'Sélectionnez d\'abord le pays.';

  @override
  String get versionHistoryTitle => 'Historique des versions';

  @override
  String get notSetText => 'Non défini';

  @override
  String nameHistory(Object name) {
    return 'Nom : $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Ville : $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Pays : $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Genre : $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Date de naissance : $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Heure de naissance : $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Localisation : $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Fuseau horaire : GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST : $value';
  }

  @override
  String stateHistory(Object state) {
    return 'État : $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Mis à jour le $date';
  }

  @override
  String get userIdRequired => 'Un identifiant utilisateur est requis.';

  @override
  String get profileSaved => 'Profil enregistré avec succès';

  @override
  String get saveFailed => 'Impossible d\'enregistrer le profil';

  @override
  String get errorPrefix => 'Erreur:';

  @override
  String get onboardingChooseLanguage => 'Choisissez votre langue';

  @override
  String get onboardingChooseLanguageDesc =>
      'Sélectionnez votre langue préférée pour continuer.';

  @override
  String get onboardingWhatIsAstrology => 'Qu\'est-ce que l\'astrologie ?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'L\'astrologie est l\'étude ancienne des mouvements célestes et de leur influence sur la vie humaine, offrant un éclairage sur la personnalité, les relations et les événements de la vie.';

  @override
  String get onboardingWhyUseApp => 'Pourquoi utiliser cette application ?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Recevez des horoscopes précis, établis par des humains, et des conseils personnalisés en fonction de votre thème natal. Prenez des décisions éclairées grâce aux prédictions quotidiennes et aux conseils personnalisés d\'astrologues expérimentés.';

  @override
  String get onboardingHowToUse => 'Comment utiliser cette application ?';

  @override
  String get onboardingHowToUseDesc =>
      'Saisissez simplement votre date, heure et lieu de naissance, ainsi que toute autre information pertinente, pour commencer immédiatement. Consultez votre horoscope quotidien, posez vos questions à des astrologues experts et gérez votre profil pour obtenir des prédictions précises et personnalisées — aucune connexion requise.';

  @override
  String get onboardingGetStarted => 'Commencer';

  @override
  String get onboardingNewUser => 'Nouvel utilisateur';

  @override
  String get onboardingExistingUser => 'Utilisateur existant';

  @override
  String get onboardingBack => 'Dos';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get userIdNotFound =>
      'Identifiant utilisateur introuvable. Veuillez vous connecter ou configurer votre profil.';

  @override
  String get clearNotificationsTitle => 'Effacer les notifications';

  @override
  String get clearNotificationsMessage =>
      'Êtes-vous sûr de vouloir supprimer toutes les notifications ?';

  @override
  String get clearNotificationsSuccess =>
      'Toutes les notifications ont été effacées avec succès.';

  @override
  String get clearHoroscopeTitle => 'Horoscope clair';

  @override
  String get clearHoroscopeMessage =>
      'Êtes-vous sûr(e) de vouloir effacer les données de votre horoscope ?';

  @override
  String get clearHoroscopeSuccess => 'Horoscope résolu avec succès.';

  @override
  String get clearChatTitle => 'Effacer l\'historique des conversations';

  @override
  String get clearChatMessage =>
      'Êtes-vous sûr de vouloir supprimer tout votre historique de conversations ?';

  @override
  String get clearChatLocal => 'Conversation effacée localement.';

  @override
  String get deleteAccountTitle => 'Supprimer le compte';

  @override
  String get deleteAccountMessage =>
      'Êtes-vous sûr de vouloir supprimer votre compte ? Cela effacera également tout votre historique de conversations et vos notifications.';

  @override
  String get deleteAccountSuccess =>
      'Votre compte et toutes vos données ont été supprimés.';

  @override
  String get deleteAccountError => 'Erreur lors de la suppression du compte';

  @override
  String get logoutTitle => 'Déconnexion';

  @override
  String get logoutMessage => 'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String get termsPrivacyTitle =>
      'Conditions d\'utilisation et politique de confidentialité';

  @override
  String get privacyPolicyTitle => 'politique de confidentialité';

  @override
  String get termsConditionsTitle => 'Conditions générales';

  @override
  String get dataControlTitle => 'Contrôle des données';

  @override
  String get cancelButton => 'Annuler';

  @override
  String get confirmButton => 'Confirmer';

  @override
  String get clearQuestionsSuccess =>
      'Toutes les questions ont été supprimées avec succès.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Seigneur';

  @override
  String get startLabel => 'Commencer';

  @override
  String get recoverAccount => 'Récupérer mon compte';

  @override
  String get endLabel => 'Fin';

  @override
  String get startDateLabel => 'Date de début';

  @override
  String get endDateLabel => 'Date de fin';

  @override
  String get notAvailable => 'Pas disponible';

  @override
  String get noData => 'Aucune donnée';

  @override
  String get unknownError => 'Erreur inconnue';

  @override
  String get retryButton => 'Réessayer';

  @override
  String get kundaliGeneratorTitle => 'Générateur de Kundali';

  @override
  String get natalChartTitle => 'Thème natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Degré ascendant';

  @override
  String get vimshottariDashaTitle => 'Dasha Vimshottari';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Inconnu';

  @override
  String get clearHoroscope => 'Horoscope clair';

  @override
  String get clearNotifications => 'Effacer les notifications';

  @override
  String get clearChatHistory => 'Effacer l\'historique des conversations';

  @override
  String get logout => 'Déconnexion';

  @override
  String get deleteAccount => 'Supprimer le compte';

  @override
  String get allFieldsRequired => 'Tous les champs sont obligatoires.';

  @override
  String get accountRecoveredSuccess => 'Compte récupéré avec succès.';

  @override
  String get recoveryFailed =>
      'La récupération a échoué. Veuillez vérifier vos informations.';

  @override
  String get recoverySecretLabel => 'Le secret de la guérison :';

  @override
  String get aboutUsTitle => 'À propos de nous';

  @override
  String get aboutOurCompany => 'À propos de notre entreprise';

  @override
  String get aboutCompanyDescription =>
      'Chez Karma, nous vous aidons à découvrir votre véritable chemin de vie grâce à la sagesse ancestrale de l\'astrologie védique. Chaque analyse est réalisée par de véritables astrologues expérimentés, et élaborée avec soin à partir de votre thème natal unique. Des horoscopes quotidiens aux conseils personnalisés, Karma rend le savoir ancestral accessible dans plus de 100 langues.';

  @override
  String get ourMission => 'Notre mission';

  @override
  String get missionDescription =>
      'Notre mission est simple : vous offrir un accompagnement astrologique authentique et personnalisé pour vous permettre de prendre des décisions éclairées et en toute confiance. Chaque prédiction et consultation repose sur des années d’expertise professionnelle, et non sur des algorithmes automatisés.';

  @override
  String get ourVision => 'Notre vision';

  @override
  String get visionDescription =>
      'Nous aspirons à être la plateforme la plus fiable au monde en matière d\'astrologie védique, aidant les gens du monde entier à se comprendre eux-mêmes, leurs choix et leur parcours de vie avec clarté et confiance.';

  @override
  String get ourValues => 'Nos valeurs';

  @override
  String get valuesDescription =>
      'Chez Karma, nous valorisons l\'authenticité, la précision et la confiance. Nous nous engageons à vous offrir des conseils non seulement justes, mais aussi pertinents, pour vous aider à aborder la vie avec perspicacité et assurance.';

  @override
  String get contactUs => 'Contactez-nous';

  @override
  String get contactEmail => 'Courriel : support@votreentreprise.com';

  @override
  String get contactWebsite => 'Site web : www.votreentreprise.com';

  @override
  String get customerSupport => 'Service client';

  @override
  String get supportHeroTitle => 'Nous sommes là pour vous aider';

  @override
  String get supportHeroDescription =>
      'Remplissez le formulaire ci-dessous et notre équipe d\'assistance vous recontactera dans les plus brefs délais.';

  @override
  String get yourName => 'Votre nom';

  @override
  String get yourEmail => 'Votre courriel';

  @override
  String get message => 'Message';

  @override
  String get enterEmail => 'Saisissez votre adresse e-mail';

  @override
  String get enterValidEmail => 'Veuillez saisir une adresse e-mail valide';

  @override
  String enterField(Object fieldName) {
    return 'Saisissez $fieldName';
  }

  @override
  String get send => 'Envoyer';

  @override
  String get sending => 'Envoi...';

  @override
  String get emailSentSuccess => '✅ Courriel envoyé avec succès !';

  @override
  String get emailSendFailed => '❌ Échec de l\'envoi de l\'e-mail';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Termes de recherche...';

  @override
  String get noTermsFound => 'Aucun terme trouvé';

  @override
  String get buyQuestionsTitle => 'Questions sur l\'achat';

  @override
  String get userNotAuthenticated => 'Utilisateur non authentifié';

  @override
  String get loadStoreDataFailed =>
      'Échec du chargement des données du magasin';

  @override
  String get missingAuthToken => 'Jeton d\'authentification manquant';

  @override
  String get merchantDisplayName => 'Application Astro Chat';

  @override
  String get paymentSuccessful => '✅ Paiement réussi ! Question envoyée';

  @override
  String paymentFailed(Object error) {
    return '❌ Échec du paiement : $error';
  }

  @override
  String get yourBalance => 'Votre solde';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Offres disponibles';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Acheter';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope du jour';

  @override
  String get userIdMissing => 'L\'identifiant utilisateur est manquant.';

  @override
  String get fetchHoroscopesFailed => 'Impossible de récupérer les horoscopes.';

  @override
  String get noHoroscopeFound => 'Horoscope introuvable.';

  @override
  String get signLabel => 'Signe';

  @override
  String get todayLabel => 'Aujourd\'hui';

  @override
  String get yesterdayLabel => 'Hier';

  @override
  String get thisWeekLabel => 'Cette semaine';

  @override
  String get lastMonthLabel => 'Mois dernier';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Saisissez votre question...';

  @override
  String get paymentRequired => 'Paiement requis';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Vous avez utilisé vos questions gratuites. Payez $amount pour continuer.';
  }

  @override
  String get payNowButton => 'Payer maintenant';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count questions gratuites restantes';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count questions payantes restantes';
  }

  @override
  String get thankYouFeedback => 'Merci pour vos commentaires !';

  @override
  String get ratingSubmitted => 'Évaluation soumise !';

  @override
  String get setUserIdFirst =>
      'Veuillez d\'abord définir votre identifiant utilisateur.';

  @override
  String get failedToFetchPrevious =>
      'Impossible de récupérer les questions et réponses précédentes.';

  @override
  String errorOccurred(Object error) {
    return 'Erreur : $error';
  }

  @override
  String get drawerAstroProfile => 'Profil astrologique';

  @override
  String get drawerDailyHoroscope => 'Horoscope du jour';

  @override
  String get drawerBuyQuestions => 'Questions sur l\'achat';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Paramètres';

  @override
  String get drawerCustomerSupport => 'Service client';

  @override
  String get drawerAbout => 'À propos';

  @override
  String get drawerProfileSettings => 'Paramètres du profil';

  @override
  String get demoNotificationTitle => '🔔 Notification de démonstration';

  @override
  String get demoNotificationBody =>
      'Ceci est une notification de test de votre application !';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get noNotifications => 'Aucune notification';

  @override
  String get allTab => 'Tous';

  @override
  String get markAllAsRead => 'Marquer tout comme lu';

  @override
  String get notificationMarkedRead => 'Notification marquée comme lue';

  @override
  String get failedToLoadNotifications =>
      'Impossible de charger les notifications';

  @override
  String get failedToMarkRead => 'Impossible de marquer comme lu';

  @override
  String get failedToMarkAllRead =>
      'Impossible de marquer tous les éléments comme lus';

  @override
  String get socketConnected => 'Prise connectée';

  @override
  String get socketDisconnected => 'Prise déconnectée';

  @override
  String get newNotificationReceived => 'Nouvelle notification reçue';

  @override
  String get generalCategory => 'Général';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Système';

  @override
  String get updateCategory => 'Mises à jour';

  @override
  String get howToAskTitle => 'Comment demander';

  @override
  String get noQuestionsAvailable => 'Aucune question disponible';

  @override
  String get failedToLoadQuestions => 'Impossible de charger les questions';

  @override
  String get pullToRefresh => 'Tirer pour actualiser';

  @override
  String get careerCategory => 'Carrière';

  @override
  String get loveCategory => 'Amour et relations';

  @override
  String get healthCategory => 'Santé';

  @override
  String get financeCategory => 'Finance';

  @override
  String get familyCategory => 'Famille';

  @override
  String get educationCategory => 'Éducation';

  @override
  String get travelCategory => 'Voyage';

  @override
  String get spiritualCategory => 'Spirituel';

  @override
  String get profileLoaded => 'Profil chargé avec succès';

  @override
  String get imageUploaded => 'Image téléchargée avec succès';

  @override
  String get savedInformationConfirmation =>
      'J\'ai enregistré ces informations';

  @override
  String get noHistoryAvailable => 'Aucun historique disponible';

  @override
  String get missingUserIdError => 'Un identifiant utilisateur est requis.';

  @override
  String get networkError => 'Erreur réseau. Veuillez réessayer.';

  @override
  String get timeoutError => 'Délai d\'attente dépassé';

  @override
  String get genericError => 'Quelque chose s\'est mal passé';

  @override
  String get reactionUpdateError => 'Échec de la mise à jour de la réaction';

  @override
  String get noSearchResults => 'Aucun résultat de recherche trouvé';

  @override
  String get clearSearch => 'Recherche propre';

  @override
  String get resultsFound => 'Résultats trouvés';

  @override
  String get recoverySecretHint =>
      'Le copier-coller peut ne pas fonctionner, saisissez le texte manuellement.';

  @override
  String get recoverAccountDescription =>
      'Suivez ces étapes pour récupérer votre compte';

  @override
  String get processingLabel => 'Traitement...';

  @override
  String get clearChatSuccess => 'La conversation a été effacée avec succès.';

  @override
  String get notificationsEnabled => 'Notifications activées';

  @override
  String get notificationsDisabled => 'Notifications désactivées';

  @override
  String get securityNotice =>
      'Vos données sont chiffrées et stockées en toute sécurité.';

  @override
  String get loading => 'Chargement...';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get onboardingGetStartedDesc => 'Commencez par choisir votre langue.';

  @override
  String get accountRecoveryTitle => '🔐 Détails de récupération du compte';

  @override
  String get recoveryInstructions =>
      'Veuillez conserver ces informations en lieu sûr. Vous en aurez besoin pour récupérer votre compte.';

  @override
  String get importantNotice => '⚠️ Important :';

  @override
  String get astrologerProfileTitle => 'Profil d\'astrologue';

  @override
  String get personalAstrologer => 'Astrologue personnel';

  @override
  String get makePersonalAstrologer =>
      'Rendez-vous chez votre astrologue personnel';

  @override
  String get favoriteDescription =>
      'Vos questions seront traitées en priorité par cet astrologue. S\'il est indisponible, un autre astrologue qualifié vous prendra en charge.';

  @override
  String get educationQualifications => 'Formation et qualifications';

  @override
  String get aboutSection => 'À propos';

  @override
  String get shareProfile => 'Partager le profil';

  @override
  String get loadingAstrologer =>
      'Chargement des informations sur l\'astrologue...';

  @override
  String get failedToLoadAstrologer =>
      'Impossible de charger les informations de l\'astrologue';

  @override
  String get authenticationRequired =>
      'Authentification requise. Veuillez vous connecter.';

  @override
  String securityCheckFailed(Object error) {
    return 'Échec du contrôle de sécurité : $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name est désormais votre astrologue personnel';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Supprimé $name des favoris';
  }

  @override
  String get toggleFavoriteError =>
      'Impossible de mettre à jour le statut favori';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n\n🎓 Formation : $education\n\n📜 Diplôme : $qualification\n\n⏳ Expérience : $experience';
  }

  @override
  String get notProvided => 'Non fourni';

  @override
  String reviews(Object count) {
    return '($count avis)';
  }

  @override
  String get specialties => 'Spécialités';

  @override
  String get experience => 'Expérience';

  @override
  String get qualification => 'Qualification';

  @override
  String get education => 'Éducation';

  @override
  String get recoveryTips =>
      '• Faites une capture d\'écran de ces informations.\n\n• Conservez-la en lieu sûr.\n\n• Ne la partagez avec personne.\n\n• Ceci ne sera affiché qu\'une seule fois.';

  @override
  String get themeSettingsTitle => 'Paramètres du thème';

  @override
  String get lightThemeLabel => 'Lumière';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Sombre';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Système';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'Notre équipe';

  @override
  String get teamDescription =>
      'Notre équipe d\'astrologues védiques professionnels possède une longue expérience dans l\'interprétation des influences planétaires et des schémas de vie. Grâce à une équipe de support et de développement dédiée, Karma offre une expérience fluide, fiable et internationale à chaque utilisateur.';
}
