// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get notificationSettings => 'Configurações de notificação';

  @override
  String get privacySettings => 'Configurações de privacidade';

  @override
  String get accountSettings => 'Configurações de Conta';

  @override
  String get languageSettings => 'Configurações de idioma';

  @override
  String get languageChanged => 'Alteração de idioma';

  @override
  String get existingUserButton => 'Eu já sou um usuário.';

  @override
  String get chooseCountryTitle => 'Selecione o país';

  @override
  String get yesText => 'Sim';

  @override
  String get noText => 'Não';

  @override
  String get appBarTitle => 'Configurações de perfil';

  @override
  String get userIdLabel => 'ID do usuário *';

  @override
  String get nameLabel => 'Nome';

  @override
  String get birthCountryLabel => 'País de nascimento';

  @override
  String get birthCityLabel => 'Cidade natal';

  @override
  String get countrySelectionTitle => 'Escolha o seu país';

  @override
  String get maleLabel => 'Macho';

  @override
  String get femaleLabel => 'Fêmea';

  @override
  String get birthDateLabel => 'Data de nascimento';

  @override
  String get birthDatePlaceholder => 'Selecione a data de nascimento';

  @override
  String get birthTimeLabel => 'Hora do nascimento';

  @override
  String get birthTimePlaceholder => 'Selecione a hora de nascimento';

  @override
  String get saveProfileButton => 'Salvar perfil';

  @override
  String get noCitiesFound => 'Nenhuma cidade encontrada';

  @override
  String cityPlaceholder(Object country) {
    return 'Digite a cidade em $country';
  }

  @override
  String get countryFirstPlaceholder => 'Selecione o país primeiro';

  @override
  String get versionHistoryTitle => 'Histórico de versões';

  @override
  String get notSetText => 'Não definido';

  @override
  String nameHistory(Object name) {
    return 'Nome: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Cidade: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'País: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Gênero: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Data de nascimento: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Hora de nascimento: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Localização: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Horário de verão: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Estado: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Atualizado em $date';
  }

  @override
  String get userIdRequired => 'É necessário o ID de usuário.';

  @override
  String get profileSaved => 'Perfil salvo com sucesso';

  @override
  String get saveFailed => 'Falha ao salvar o perfil';

  @override
  String get errorPrefix => 'Erro:';

  @override
  String get onboardingChooseLanguage => 'Escolha seu idioma';

  @override
  String get onboardingChooseLanguageDesc =>
      'Selecione o idioma de sua preferência para continuar.';

  @override
  String get onboardingWhatIsAstrology => 'O que é Astrologia?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'A astrologia é o estudo dos corpos celestes...';

  @override
  String get onboardingWhyUseApp => 'Por que usar este aplicativo?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Receba horóscopos personalizados, previsões diárias e orientações para tomar decisões informadas.';

  @override
  String get onboardingHowToUse => 'Como usar este aplicativo?';

  @override
  String get onboardingHowToUseDesc =>
      'Navegue com facilidade, confira os horóscopos diários e gerencie seu perfil para previsões precisas.';

  @override
  String get onboardingGetStarted => 'Comece agora';

  @override
  String get onboardingNewUser => 'Novo usuário';

  @override
  String get onboardingExistingUser => 'Usuário existente';

  @override
  String get onboardingBack => 'Voltar';

  @override
  String get onboardingNext => 'Próximo';

  @override
  String get userIdNotFound =>
      'ID de usuário não encontrado. Faça login ou configure seu perfil.';

  @override
  String get clearNotificationsTitle => 'Limpar notificações';

  @override
  String get clearNotificationsMessage =>
      'Tem certeza de que deseja limpar todas as notificações?';

  @override
  String get clearNotificationsSuccess =>
      'Todas as notificações foram apagadas com sucesso.';

  @override
  String get clearHoroscopeTitle => 'Horóscopo Claro';

  @override
  String get clearHoroscopeMessage =>
      'Tem certeza de que deseja apagar os dados do seu horóscopo?';

  @override
  String get clearHoroscopeSuccess => 'Horóscopo analisado com sucesso.';

  @override
  String get clearChatTitle => 'Limpar histórico de bate-papo';

  @override
  String get clearChatMessage =>
      'Tem certeza de que deseja apagar todo o seu histórico de bate-papo?';

  @override
  String get clearChatLocal => 'O chat foi encerrado localmente.';

  @override
  String get deleteAccountTitle => 'Excluir conta';

  @override
  String get deleteAccountMessage =>
      'Tem certeza de que deseja excluir sua conta? Isso também apagará todo o seu histórico de bate-papo e notificações.';

  @override
  String get deleteAccountSuccess =>
      'Sua conta e todos os seus dados foram removidos.';

  @override
  String get deleteAccountError => 'Erro ao excluir a conta';

  @override
  String get logoutTitle => 'Sair';

  @override
  String get logoutMessage => 'Tem certeza de que deseja sair?';

  @override
  String get termsPrivacyTitle => 'Termos e Política de Privacidade';

  @override
  String get privacyPolicyTitle => 'política de Privacidade';

  @override
  String get termsConditionsTitle => 'Termos e Condições';

  @override
  String get dataControlTitle => 'Controle de dados';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get confirmButton => 'Confirmar';

  @override
  String get clearQuestionsSuccess =>
      'Todas as perguntas foram excluídas com sucesso.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Senhor';

  @override
  String get startLabel => 'Começar';

  @override
  String get recoverAccount => 'Recuperar conta';

  @override
  String get endLabel => 'Fim';

  @override
  String get startDateLabel => 'Data de início';

  @override
  String get endDateLabel => 'Data de término';

  @override
  String get notAvailable => 'Não disponível';

  @override
  String get noData => 'Sem dados';

  @override
  String get unknownError => 'Erro desconhecido';

  @override
  String get retryButton => 'Tentar novamente';

  @override
  String get kundaliGeneratorTitle => 'Gerador de Kundali';

  @override
  String get natalChartTitle => 'Mapa Astral';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Grau Ascendente';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get clearHoroscope => 'Horóscopo Claro';

  @override
  String get clearNotifications => 'Limpar notificações';

  @override
  String get clearChatHistory => 'Limpar histórico de bate-papo';

  @override
  String get logout => 'Sair';

  @override
  String get deleteAccount => 'Excluir conta';

  @override
  String get allFieldsRequired => 'Todos os campos são obrigatórios.';

  @override
  String get accountRecoveredSuccess => 'Conta recuperada com sucesso.';

  @override
  String get recoveryFailed =>
      'A recuperação falhou. Verifique suas informações.';

  @override
  String get recoverySecretLabel => 'Segredo da recuperação:';

  @override
  String get aboutUsTitle => 'Sobre nós';

  @override
  String get aboutOurCompany => 'Sobre a nossa empresa';

  @override
  String get aboutCompanyDescription =>
      'Estamos empenhados em oferecer a melhor experiência de astrologia aos nossos usuários.';

  @override
  String get ourMission => 'Nossa missão';

  @override
  String get missionDescription =>
      'Fornecer informações astrológicas precisas e personalizadas para ajudar os usuários a tomar decisões informadas em suas vidas.';

  @override
  String get ourVision => 'Nossa visão';

  @override
  String get visionDescription =>
      'Tornar-se a plataforma de astrologia mais confiável, combinando tecnologia e sabedoria ancestral.';

  @override
  String get ourValues => 'Nossos valores';

  @override
  String get valuesDescription =>
      'Integridade, precisão, design centrado no usuário e inovação contínua.';

  @override
  String get contactUs => 'Contate-nos';

  @override
  String get contactEmail => 'E-mail: support@yourcompany.com';

  @override
  String get contactWebsite => 'Site: www.yourcompany.com';

  @override
  String get customerSupport => 'Suporte ao Cliente';

  @override
  String get supportHeroTitle => 'Estamos aqui para ajudar.';

  @override
  String get supportHeroDescription =>
      'Preencha o formulário abaixo e nossa equipe de suporte entrará em contato com você o mais breve possível.';

  @override
  String get yourName => 'Seu nome';

  @override
  String get yourEmail => 'Seu e-mail';

  @override
  String get message => 'Mensagem';

  @override
  String get enterEmail => 'Insira seu e-mail';

  @override
  String get enterValidEmail => 'Insira um endereço de e-mail válido.';

  @override
  String enterField(Object fieldName) {
    return 'Digite $fieldName';
  }

  @override
  String get send => 'Enviar';

  @override
  String get sending => 'Enviando...';

  @override
  String get emailSentSuccess => '✅ E-mail enviado com sucesso!';

  @override
  String get emailSendFailed => '❌ Falha ao enviar e-mail';

  @override
  String get astroDictionaryTitle => 'Dicionário de Astrologia';

  @override
  String get searchTermsHint => 'Termos de pesquisa...';

  @override
  String get noTermsFound => 'Nenhum termo encontrado';

  @override
  String get buyQuestionsTitle => 'Perguntas sobre compras';

  @override
  String get userNotAuthenticated => 'Usuário não autenticado';

  @override
  String get loadStoreDataFailed => 'Falha ao carregar os dados da loja';

  @override
  String get missingAuthToken => 'Token de autenticação ausente';

  @override
  String get merchantDisplayName => 'Aplicativo Astro Chat';

  @override
  String get paymentSuccessful =>
      '✅ Pagamento efetuado com sucesso! Pergunta enviada';

  @override
  String paymentFailed(Object error) {
    return '❌ Pagamento falhou: $error';
  }

  @override
  String get yourBalance => 'Seu saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Perguntas';
  }

  @override
  String get availableOffers => 'Ofertas disponíveis';

  @override
  String questionsCount(Object count) {
    return '$count Pergunta';
  }

  @override
  String get buyButton => 'Comprar';

  @override
  String get dailyHoroscopeTitle => '🌟 Horóscopo Diário';

  @override
  String get userIdMissing => 'O ID do usuário está faltando.';

  @override
  String get fetchHoroscopesFailed => 'Não foi possível obter os horóscopos.';

  @override
  String get noHoroscopeFound => 'Nenhum horóscopo encontrado.';

  @override
  String get signLabel => 'Sinal';

  @override
  String get todayLabel => 'Hoje';

  @override
  String get yesterdayLabel => 'Ontem';

  @override
  String get thisWeekLabel => 'Essa semana';

  @override
  String get lastMonthLabel => 'Mês passado';

  @override
  String get chatTitle => 'Bater papo';

  @override
  String get typeYourQuestionHint => 'Digite sua pergunta...';

  @override
  String get paymentRequired => 'Pagamento necessário';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Você já utilizou suas perguntas gratuitas. Pague ₹50 para continuar.';
  }

  @override
  String get payNowButton => 'Pagar agora';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count perguntas gratuitas restantes';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count perguntas pagas restantes';
  }

  @override
  String get thankYouFeedback => 'Obrigado pelo seu feedback!';

  @override
  String get ratingSubmitted => 'Avaliação enviada!';

  @override
  String get setUserIdFirst =>
      'Por favor, defina primeiro o seu ID de usuário.';

  @override
  String get failedToFetchPrevious =>
      'Não foi possível recuperar as perguntas e respostas anteriores.';

  @override
  String errorOccurred(Object error) {
    return 'Erro: $error';
  }

  @override
  String get drawerAstroProfile => 'Perfil Astrológico';

  @override
  String get drawerDailyHoroscope => 'Horóscopo diário';

  @override
  String get drawerBuyQuestions => 'Perguntas sobre compras';

  @override
  String get drawerAstroDictionary => 'Dicionário de Astrologia';

  @override
  String get drawerSettings => 'Configurações';

  @override
  String get drawerCustomerSupport => 'Suporte ao Cliente';

  @override
  String get drawerAbout => 'Sobre';

  @override
  String get drawerProfileSettings => 'Configurações de perfil';

  @override
  String get demoNotificationTitle => '🔔 Notificação de demonstração';

  @override
  String get demoNotificationBody =>
      'Esta é uma notificação de teste do seu aplicativo!';

  @override
  String get notificationsTitle => 'Notificações';

  @override
  String get noNotifications => 'Nenhuma notificação';

  @override
  String get allTab => 'Todos';

  @override
  String get markAllAsRead => 'Marcar tudo como lido';

  @override
  String get notificationMarkedRead => 'Notificação marcada como lida';

  @override
  String get failedToLoadNotifications => 'Falha ao carregar as notificações';

  @override
  String get failedToMarkRead => 'Não foi possível marcar como lida.';

  @override
  String get failedToMarkAllRead => 'Não foi possível marcar tudo como lido.';

  @override
  String get socketConnected => 'Tomada conectada';

  @override
  String get socketDisconnected => 'Tomada desconectada';

  @override
  String get newNotificationReceived => 'Nova notificação recebida';

  @override
  String get generalCategory => 'Em geral';

  @override
  String get horoscopeCategory => 'Horóscopo';

  @override
  String get chatCategory => 'Bater papo';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Atualizações';

  @override
  String get howToAskTitle => 'Como perguntar';

  @override
  String get noQuestionsAvailable => 'Nenhuma pergunta disponível';

  @override
  String get failedToLoadQuestions => 'Falha ao carregar as perguntas';

  @override
  String get pullToRefresh => 'Puxe para atualizar';

  @override
  String get careerCategory => 'Carreira';

  @override
  String get loveCategory => 'Amor e Relacionamentos';

  @override
  String get healthCategory => 'Saúde';

  @override
  String get financeCategory => 'Financiar';

  @override
  String get familyCategory => 'Família';

  @override
  String get educationCategory => 'Educação';

  @override
  String get travelCategory => 'Viagem';

  @override
  String get spiritualCategory => 'Espiritual';

  @override
  String get profileLoaded => 'Perfil carregado com sucesso';

  @override
  String get imageUploaded => 'Imagem carregada com sucesso';

  @override
  String get savedInformationConfirmation => 'Salvei esta informação';

  @override
  String get noHistoryAvailable => 'Não há histórico disponível.';

  @override
  String get missingUserIdError => 'É necessário o ID de usuário.';

  @override
  String get networkError => 'Erro de rede. Tente novamente.';

  @override
  String get timeoutError => 'A solicitação expirou.';

  @override
  String get genericError => 'Algo deu errado';

  @override
  String get reactionUpdateError => 'Falha ao atualizar a reação';

  @override
  String get noSearchResults => 'Nenhum resultado encontrado';

  @override
  String get clearSearch => 'Limpar pesquisa';

  @override
  String get resultsFound => 'Resultados encontrados';

  @override
  String get recoverySecretHint =>
      'Pode ser que copiar e colar não funcione, digite manualmente.';

  @override
  String get recoverAccountDescription =>
      'Siga estes passos para recuperar sua conta.';

  @override
  String get processingLabel => 'Processamento...';

  @override
  String get clearChatSuccess => 'Chat encerrado com sucesso';

  @override
  String get notificationsEnabled => 'Notificações ativadas';

  @override
  String get notificationsDisabled => 'Notificações desativadas';

  @override
  String get securityNotice =>
      'Seus dados são criptografados e armazenados com segurança.';

  @override
  String get loading => 'Carregando...';

  @override
  String get selectLanguage => 'Selecione o idioma';

  @override
  String get onboardingGetStartedDesc => 'Comece escolhendo seu idioma.';

  @override
  String get accountRecoveryTitle => '🔐 Detalhes da recuperação de conta';

  @override
  String get recoveryInstructions =>
      'Por favor, guarde essas informações em local seguro. Você precisará delas para recuperar sua conta.';

  @override
  String get importantNotice => '⚠️ Importante:';

  @override
  String get astrologerProfileTitle => 'Perfil do astrólogo';

  @override
  String get personalAstrologer => 'Astrólogo Pessoal';

  @override
  String get makePersonalAstrologer => 'Consulte um astrólogo pessoal.';

  @override
  String get favoriteDescription =>
      'Suas perguntas serão priorizadas para este astrólogo. Caso ele não esteja disponível, outro astrólogo qualificado o atenderá.';

  @override
  String get educationQualifications => 'Formação acadêmica e qualificações';

  @override
  String get aboutSection => 'Sobre';

  @override
  String get shareProfile => 'Compartilhar perfil';

  @override
  String get loadingAstrologer => 'Carregando detalhes do astrólogo...';

  @override
  String get failedToLoadAstrologer =>
      'Não foi possível carregar os detalhes do astrólogo.';

  @override
  String get authenticationRequired => 'É necessário autenticar. Faça login.';

  @override
  String securityCheckFailed(Object error) {
    return 'Falha na verificação de segurança: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name agora é seu Astrólogo Pessoal';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Removeu $name dos favoritos';
  }

  @override
  String get toggleFavoriteError => 'Falha ao atualizar o status de favorito';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Formação acadêmica: $education\n📜 Qualificação: $qualification\n⏳ Experiência: $experience';
  }

  @override
  String get notProvided => 'Não fornecido';

  @override
  String reviews(Object count) {
    return '($count avaliações)';
  }

  @override
  String get specialties => 'Especialidades';

  @override
  String get experience => 'Experiência';

  @override
  String get qualification => 'Qualificação';

  @override
  String get education => 'Educação';

  @override
  String get recoveryTips =>
      '• Faça uma captura de tela desta informação\n• Guarde-a em um local seguro\n• Não compartilhe com ninguém\n• Isso só será exibido uma vez';

  @override
  String get themeSettingsTitle => 'Configurações do tema';

  @override
  String get lightThemeLabel => 'Luz';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Escuro';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Sistema';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
