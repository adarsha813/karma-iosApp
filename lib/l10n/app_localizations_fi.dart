// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get settingsTitle => 'Asetukset';

  @override
  String get notificationSettings => 'Ilmoitusasetukset';

  @override
  String get privacySettings => 'Tietosuoja-asetukset';

  @override
  String get accountSettings => 'Tilin asetukset';

  @override
  String get languageSettings => 'Kieliasetukset';

  @override
  String get languageChanged => 'Kieli muuttui';

  @override
  String get existingUserButton => 'Olen olemassa oleva käyttäjä';

  @override
  String get chooseCountryTitle => 'Valitse maa';

  @override
  String get yesText => 'Kyllä';

  @override
  String get noText => 'Ei';

  @override
  String get appBarTitle => 'Profiiliasetukset';

  @override
  String get userIdLabel => 'Käyttäjätunnus *';

  @override
  String get nameLabel => 'Nimi';

  @override
  String get birthCountryLabel => 'Syntymämaa';

  @override
  String get birthCityLabel => 'Syntymäkaupunki';

  @override
  String get countrySelectionTitle => 'Valitse maasi';

  @override
  String get maleLabel => 'Uros';

  @override
  String get femaleLabel => 'Naaras';

  @override
  String get birthDateLabel => 'Syntymäaika';

  @override
  String get birthDatePlaceholder => 'Valitse syntymäaika';

  @override
  String get birthTimeLabel => 'Syntymäaika';

  @override
  String get birthTimePlaceholder => 'Valitse syntymäaika';

  @override
  String get saveProfileButton => 'Tallenna profiili';

  @override
  String get noCitiesFound => 'Ei löytynyt kaupunkeja';

  @override
  String cityPlaceholder(Object country) {
    return 'Syötä kaupunki maassa $country';
  }

  @override
  String get countryFirstPlaceholder => 'Valitse ensin maa';

  @override
  String get versionHistoryTitle => 'Versiohistoria';

  @override
  String get notSetText => 'Ei asetettu';

  @override
  String nameHistory(Object name) {
    return 'Nimi: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Kaupunki: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Maa: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Sukupuoli: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Syntymäaika: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Syntymäaika: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Sijainti: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Aikavyöhyke: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Kesäaika: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Osavaltio: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Päivitetty $date';
  }

  @override
  String get userIdRequired => 'Käyttäjätunnus vaaditaan';

  @override
  String get profileSaved => 'Profiili tallennettu onnistuneesti';

  @override
  String get saveFailed => 'Profiilin tallennus epäonnistui';

  @override
  String get errorPrefix => 'Virhe:';

  @override
  String get onboardingChooseLanguage => 'Valitse kieli';

  @override
  String get onboardingChooseLanguageDesc =>
      'Valitse haluamasi kieli jatkaaksesi.';

  @override
  String get onboardingWhatIsAstrology => 'Mitä on astrologia?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologia on ikivanha tieteenala, joka tutkii taivaankappaleiden liikkeitä ja niiden vaikutusta ihmisen elämään. Se tarjoaa tietoa persoonallisuudesta, ihmissuhteista ja elämän tapahtumista.';

  @override
  String get onboardingWhyUseApp => 'Miksi käyttää tätä sovellusta?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Saat tarkkoja, ihmisten luomia horoskooppeja ja ohjeita, jotka on räätälöity syntymäkarttasi mukaan. Tee tietoon perustuvia päätöksiä kokeneiden astrologien päivittäisten ennusteiden ja henkilökohtaisten neuvojen avulla.';

  @override
  String get onboardingHowToUse => 'Kuinka käyttää tätä sovellusta?';

  @override
  String get onboardingHowToUseDesc =>
      'Syötä vain syntymäaikasi, tarkka aikasi, syntymäpaikkasi ja muut asiaankuuluvat tiedot aloittaaksesi heti. Tutustu päivittäisiin horoskooppeihin, kysy kysymyksiä asiantuntevilta astrologeilta ja hallinnoi profiiliasi saadaksesi tarkkoja, henkilökohtaisia ennusteita – kirjautumista ei vaadita.';

  @override
  String get onboardingGetStarted => 'Aloita';

  @override
  String get onboardingNewUser => 'Uusi käyttäjä';

  @override
  String get onboardingExistingUser => 'Nykyinen käyttäjä';

  @override
  String get onboardingBack => 'Takaisin';

  @override
  String get onboardingNext => 'Seuraava';

  @override
  String get userIdNotFound =>
      'Käyttäjätunnusta ei löytynyt. Kirjaudu sisään tai luo profiilisi.';

  @override
  String get clearNotificationsTitle => 'Tyhjennä ilmoitukset';

  @override
  String get clearNotificationsMessage =>
      'Haluatko varmasti tyhjentää kaikki ilmoitukset?';

  @override
  String get clearNotificationsSuccess =>
      'Kaikki ilmoitukset poistettu onnistuneesti.';

  @override
  String get clearHoroscopeTitle => 'Selkeä horoskooppi';

  @override
  String get clearHoroscopeMessage =>
      'Oletko varma, että haluat tyhjentää horoskooppitietosi?';

  @override
  String get clearHoroscopeSuccess => 'Horoskooppi tyhjennetty onnistuneesti.';

  @override
  String get clearChatTitle => 'Tyhjennä keskusteluhistoria';

  @override
  String get clearChatMessage =>
      'Oletko varma, että haluat poistaa koko keskusteluhistoriasi?';

  @override
  String get clearChatLocal => 'Keskustelu tyhjennetty paikallisesti.';

  @override
  String get deleteAccountTitle => 'Poista tili';

  @override
  String get deleteAccountMessage =>
      'Haluatko varmasti poistaa tilisi? Tämä tyhjentää myös kaiken keskusteluhistoriasi ja ilmoituksesi.';

  @override
  String get deleteAccountSuccess => 'Tilisi ja kaikki tiedot on poistettu.';

  @override
  String get deleteAccountError => 'Virhe tilin poistamisessa';

  @override
  String get logoutTitle => 'Kirjaudu ulos';

  @override
  String get logoutMessage => 'Haluatko varmasti kirjautua ulos?';

  @override
  String get termsPrivacyTitle => 'Käyttöehdot ja tietosuoja';

  @override
  String get privacyPolicyTitle => 'Tietosuojakäytäntö';

  @override
  String get termsConditionsTitle => 'Käyttöehdot';

  @override
  String get dataControlTitle => 'Tietojen hallinta';

  @override
  String get cancelButton => 'Peruuttaa';

  @override
  String get confirmButton => 'Vahvistaa';

  @override
  String get clearQuestionsSuccess =>
      'Kaikki kysymykset poistettu onnistuneesti.';

  @override
  String get yoginiLabel => 'Jogini';

  @override
  String get lordLabel => 'Herra';

  @override
  String get startLabel => 'Aloita';

  @override
  String get recoverAccount => 'Palauta tili';

  @override
  String get endLabel => 'Loppu';

  @override
  String get startDateLabel => 'Aloituspäivämäärä';

  @override
  String get endDateLabel => 'Päättymispäivä';

  @override
  String get notAvailable => 'Ei saatavilla';

  @override
  String get noData => 'Ei tietoja';

  @override
  String get unknownError => 'Tuntematon virhe';

  @override
  String get retryButton => 'Yritä uudelleen';

  @override
  String get kundaliGeneratorTitle => 'Kundali-generaattori';

  @override
  String get natalChartTitle => 'Syntymäkartta';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raši';

  @override
  String get ascDegreeLabel => 'Nouseva tutkinto';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Tuntematon';

  @override
  String get clearHoroscope => 'Selkeä horoskooppi';

  @override
  String get clearNotifications => 'Tyhjennä ilmoitukset';

  @override
  String get clearChatHistory => 'Tyhjennä keskusteluhistoria';

  @override
  String get logout => 'Kirjaudu ulos';

  @override
  String get deleteAccount => 'Poista tili';

  @override
  String get allFieldsRequired => 'Kaikki kentät ovat pakollisia.';

  @override
  String get accountRecoveredSuccess => 'Tili palautettu onnistuneesti.';

  @override
  String get recoveryFailed => 'Palautus epäonnistui. Tarkista tietosi.';

  @override
  String get recoverySecretLabel => 'Palautumisen salaisuus:';

  @override
  String get aboutUsTitle => 'Tietoa meistä';

  @override
  String get aboutOurCompany => 'Tietoa yrityksestämme';

  @override
  String get aboutCompanyDescription =>
      'Karmalla autamme sinua löytämään todellisen elämänpolkusi ajattoman vedalaisen astrologian viisauden avulla. Jokainen näkemys tulee oikeilta, kokeneilta astrologeilta, ja se on huolellisesti laadittu ainutlaatuisen syntymäkarttasi pohjalta. Päivittäisistä horoskoopeista henkilökohtaiseen ohjaukseen, Karma tuo muinaisen tiedon saataville yli 100 kielellä.';

  @override
  String get ourMission => 'Missiomme';

  @override
  String get missionDescription =>
      'Missiomme on yksinkertainen: tarjota aitoa, ihmisen johtamaa astrologista ohjausta, joka antaa sinulle mahdollisuuden tehdä luottavaisia ja tietoon perustuvia päätöksiä. Jokainen ennuste ja konsultaatio heijastaa vuosien ammattitaitoa, ei automatisoituja algoritmeja.';

  @override
  String get ourVision => 'Visiomme';

  @override
  String get visionDescription =>
      'Pyrimme olemaan maailman luotetuin vedalaisen astrologian alusta, joka auttaa ihmisiä kaikkialla ymmärtämään itseään, valintojaan ja elämänmatkaansa selkeästi ja itsevarmasti.';

  @override
  String get ourValues => 'Arvomme';

  @override
  String get valuesDescription =>
      'Karmalla arvostamme aitoutta, tarkkuutta ja luottamusta. Olemme sitoutuneet tarjoamaan ohjausta, joka on paitsi tarkkaa myös merkityksellistä, auttaen sinua navigoimaan elämässäsi oivaltavasti ja itsevarmasti.';

  @override
  String get contactUs => 'Ota yhteyttä';

  @override
  String get contactEmail => 'Sähköposti: support@yourcompany.com';

  @override
  String get contactWebsite => 'Verkkosivusto: www.omayritys.com';

  @override
  String get customerSupport => 'Asiakastuki';

  @override
  String get supportHeroTitle => 'Olemme täällä auttaaksemme';

  @override
  String get supportHeroDescription =>
      'Täytä alla oleva lomake, niin tukitiimimme ottaa sinuun yhteyttä mahdollisimman pian.';

  @override
  String get yourName => 'Sinun nimesi';

  @override
  String get yourEmail => 'Sähköpostiosoitteesi';

  @override
  String get message => 'Viesti';

  @override
  String get enterEmail => 'Anna sähköpostiosoitteesi';

  @override
  String get enterValidEmail => 'Anna kelvollinen sähköpostiosoite';

  @override
  String enterField(Object fieldName) {
    return 'Syötä $fieldName';
  }

  @override
  String get send => 'Lähetä';

  @override
  String get sending => 'Lähetetään...';

  @override
  String get emailSentSuccess => '✅ Sähköposti lähetetty onnistuneesti!';

  @override
  String get emailSendFailed => '❌ Sähköpostin lähettäminen epäonnistui';

  @override
  String get astroDictionaryTitle => 'Astro-sanakirja';

  @override
  String get searchTermsHint => 'Hakutermit...';

  @override
  String get noTermsFound => 'Ei termejä';

  @override
  String get buyQuestionsTitle => 'Osta kysymykset';

  @override
  String get userNotAuthenticated => 'Käyttäjää ei ole todennettu';

  @override
  String get loadStoreDataFailed => 'Kauppatietojen lataus epäonnistui';

  @override
  String get missingAuthToken => 'Puuttuva todennustunnus';

  @override
  String get merchantDisplayName => 'Astro-chat-sovellus';

  @override
  String get paymentSuccessful => '✅ Maksu onnistui! Kysymys lähetetty';

  @override
  String paymentFailed(Object error) {
    return '❌ Maksu epäonnistui: $error';
  }

  @override
  String get yourBalance => 'Saldosi';

  @override
  String questionsBalance(Object count) {
    return '$count Kysymykset';
  }

  @override
  String get availableOffers => 'Saatavilla olevat tarjoukset';

  @override
  String questionsCount(Object count) {
    return '$count Kysymys';
  }

  @override
  String get buyButton => 'Ostaa';

  @override
  String get dailyHoroscopeTitle => '🌟 Päivän horoskooppi';

  @override
  String get userIdMissing => 'Käyttäjätunnus puuttuu';

  @override
  String get fetchHoroscopesFailed => 'Horoskooppien hakeminen epäonnistui';

  @override
  String get noHoroscopeFound => 'Horoskooppia ei löytynyt.';

  @override
  String get signLabel => 'Merkki';

  @override
  String get todayLabel => 'Tänään';

  @override
  String get yesterdayLabel => 'Eilen';

  @override
  String get thisWeekLabel => 'Tällä viikolla';

  @override
  String get lastMonthLabel => 'Viime kuukausi';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Kirjoita kysymyksesi...';

  @override
  String get paymentRequired => 'Maksu vaaditaan';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Olet käyttänyt ilmaiset kysymyksesi. Maksa $amount jatkaaksesi.';
  }

  @override
  String get payNowButton => 'Maksa nyt';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ilmaista kysymystä jäljellä';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count maksettua kysymystä jäljellä';
  }

  @override
  String get thankYouFeedback => 'Kiitos palautteestasi!';

  @override
  String get ratingSubmitted => 'Arvosana lähetetty!';

  @override
  String get setUserIdFirst => 'Aseta ensin käyttäjätunnuksesi';

  @override
  String get failedToFetchPrevious =>
      'Aiempien kysymysten ja vastausten hakeminen epäonnistui';

  @override
  String errorOccurred(Object error) {
    return 'Virhe: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro-profiili';

  @override
  String get drawerDailyHoroscope => 'Päivän horoskooppi';

  @override
  String get drawerBuyQuestions => 'Osta kysymykset';

  @override
  String get drawerAstroDictionary => 'Astro-sanakirja';

  @override
  String get drawerSettings => 'Asetukset';

  @override
  String get drawerCustomerSupport => 'Asiakastuki';

  @override
  String get drawerAbout => 'Noin';

  @override
  String get drawerProfileSettings => 'Profiiliasetukset';

  @override
  String get demoNotificationTitle => '🔔 Demoilmoitus';

  @override
  String get demoNotificationBody => 'Tämä on testi-ilmoitus sovelluksestasi!';

  @override
  String get notificationsTitle => 'Ilmoitukset';

  @override
  String get noNotifications => 'Ei ilmoituksia';

  @override
  String get allTab => 'Kaikki';

  @override
  String get markAllAsRead => 'Merkitse kaikki luetuiksi';

  @override
  String get notificationMarkedRead => 'Ilmoitus merkitty luetuksi';

  @override
  String get failedToLoadNotifications => 'Ilmoitusten lataaminen epäonnistui';

  @override
  String get failedToMarkRead => 'Luetuksi merkitseminen epäonnistui';

  @override
  String get failedToMarkAllRead =>
      'Kaikkien merkitseminen luetuiksi epäonnistui';

  @override
  String get socketConnected => 'Pistorasia kytketty';

  @override
  String get socketDisconnected => 'Pistorasia irti';

  @override
  String get newNotificationReceived => 'Uusi ilmoitus vastaanotettu';

  @override
  String get generalCategory => 'Yleistä';

  @override
  String get horoscopeCategory => 'Horoskooppi';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Järjestelmä';

  @override
  String get updateCategory => 'Päivitykset';

  @override
  String get howToAskTitle => 'Kuinka kysyä';

  @override
  String get noQuestionsAvailable => 'Ei kysymyksiä saatavilla';

  @override
  String get failedToLoadQuestions => 'Kysymysten lataaminen epäonnistui';

  @override
  String get pullToRefresh => 'Vedä päivittääksesi';

  @override
  String get careerCategory => 'Ura';

  @override
  String get loveCategory => 'Rakkaus ja ihmissuhteet';

  @override
  String get healthCategory => 'Terveys';

  @override
  String get financeCategory => 'Rahoitus';

  @override
  String get familyCategory => 'Perhe';

  @override
  String get educationCategory => 'Koulutus';

  @override
  String get travelCategory => 'Matkustaa';

  @override
  String get spiritualCategory => 'Hengellinen';

  @override
  String get profileLoaded => 'Profiili ladattu onnistuneesti';

  @override
  String get imageUploaded => 'Kuva ladattu onnistuneesti';

  @override
  String get savedInformationConfirmation => 'Olen tallentanut nämä tiedot';

  @override
  String get noHistoryAvailable => 'Ei historiaa saatavilla';

  @override
  String get missingUserIdError => 'Käyttäjätunnus vaaditaan';

  @override
  String get networkError => 'Verkkovirhe. Yritä uudelleen.';

  @override
  String get timeoutError => 'Pyyntö aikakatkaistiin';

  @override
  String get genericError => 'Jokin meni pieleen';

  @override
  String get reactionUpdateError => 'Reaktion päivittäminen epäonnistui';

  @override
  String get noSearchResults => 'Ei hakutuloksia';

  @override
  String get clearSearch => 'Tyhjennä haku';

  @override
  String get resultsFound => 'Tulokset löytyivät';

  @override
  String get recoverySecretHint =>
      'Kopioi-liitä ei välttämättä toimi, kirjoita manuaalisesti';

  @override
  String get recoverAccountDescription =>
      'Palauta tilisi noudattamalla näitä ohjeita';

  @override
  String get processingLabel => 'Käsitellään...';

  @override
  String get clearChatSuccess => 'Keskustelu onnistui';

  @override
  String get notificationsEnabled => 'Ilmoitukset käytössä';

  @override
  String get notificationsDisabled => 'Ilmoitukset poistettu käytöstä';

  @override
  String get securityNotice => 'Tietosi salataan ja tallennetaan turvallisesti';

  @override
  String get loading => 'Ladataan...';

  @override
  String get selectLanguage => 'Valitse kieli';

  @override
  String get onboardingGetStartedDesc => 'Aloita valitsemalla kielesi';

  @override
  String get accountRecoveryTitle => '🔐 Tilin palautustiedot';

  @override
  String get recoveryInstructions =>
      'Säilytä nämä tiedot turvallisesti. Tarvitset niitä tilisi palauttamiseen.';

  @override
  String get importantNotice => '⚠️ Tärkeää:';

  @override
  String get astrologerProfileTitle => 'Astrologin profiili';

  @override
  String get personalAstrologer => 'Henkilökohtainen astrologi';

  @override
  String get makePersonalAstrologer => 'Tee henkilökohtainen astrologi';

  @override
  String get favoriteDescription =>
      'Kysymyksesi ohjataan tälle astrologille. Jos hän ei ole tavoitettavissa, toinen pätevä astrologi auttaa sinua.';

  @override
  String get educationQualifications => 'Koulutus ja pätevyydet';

  @override
  String get aboutSection => 'Noin';

  @override
  String get shareProfile => 'Jaa profiili';

  @override
  String get loadingAstrologer => 'Astrologin tietoja ladataan...';

  @override
  String get failedToLoadAstrologer =>
      'Astrologin tietojen lataaminen epäonnistui';

  @override
  String get authenticationRequired => 'Todennus vaaditaan. Kirjaudu sisään.';

  @override
  String securityCheckFailed(Object error) {
    return 'Turvatarkistus epäonnistui: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name on nyt henkilökohtainen astrologisi';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Poistettu $name suosikeista';
  }

  @override
  String get toggleFavoriteError => 'Suosikki-tilan päivittäminen epäonnistui';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Koulutus: $education\n📜 Pätevyys: $qualification\n⏳ Kokemus: $experience';
  }

  @override
  String get notProvided => 'Ei annettu';

  @override
  String reviews(Object count) {
    return '($count arvostelua)';
  }

  @override
  String get specialties => 'Erikoisuudet';

  @override
  String get experience => 'Kokea';

  @override
  String get qualification => 'pätevyys';

  @override
  String get education => 'Koulutus';

  @override
  String get recoveryTips =>
      '• Ota kuvakaappaus näistä tiedoista\n• Säilytä niitä turvallisessa paikassa\n• Älä jaa niitä kenenkään kanssa\n• Nämä näytetään vain kerran';

  @override
  String get themeSettingsTitle => 'Teeman asetukset';

  @override
  String get lightThemeLabel => 'Valo';

  @override
  String get lightThemeDescription => 'Käytä aina vaaleaa teemaa';

  @override
  String get darkThemeLabel => 'Tumma';

  @override
  String get darkThemeDescription => 'Käytä aina tummaa teemaa';

  @override
  String get systemThemeLabel => 'Järjestelmä';

  @override
  String get systemThemeDarkDescription =>
      'Noudata järjestelmäasetuksia tummalle teemalle';

  @override
  String get systemThemeLightDescription =>
      'Noudata järjestelmäasetuksia vaalean teeman osalta';

  @override
  String get switchToLight => 'Vaihda vaaleaan';

  @override
  String get switchToDark => 'Vaihda tummaan';

  @override
  String get ourTeam => 'Tiimimme';

  @override
  String get teamDescription =>
      'Ammattitaitoisten vedalaisten astrologien tiimillämme on vuosien kokemus planeettojen vaikutusten ja elämänmallien tulkinnasta. Omistautuneen tuki- ja kehitystiimin tukemana Karma tarjoaa saumattoman, luotettavan ja globaalin kokemuksen jokaiselle käyttäjälle.';
}
