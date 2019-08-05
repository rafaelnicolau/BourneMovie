enum GAAction:String {
    
    case viewInvoice = "{PLANO}-Ultimo-Boleto" ok
    
    case myTicket = "{PLANO}-Meus-Boletos" ok
    
    case seePdfTicket = "{PLANO}-Ver-Boleto-PDF" ok
    
    case additionalContractors = "{PLANO}-Adicionais-Contratados-{Nome-do-Adicional}" ok
  
    case Storie = "{PLANO}-{Nome-da-Storie}-{Nome-do-Step}" Dynamic nas duas plataformas
    
    case PayNowBank = "{PLANO}-Selecionar-Banco-{BANCO-SELECIONADO}" Android "SelecionarBanco-"
  
    case DynamicOnlineAccountChangePaymentMethod = "{PLANO}-Conta-Online" ok
    case automaticTokenAuthentication = "Autenticacao-Automatica-Token" ok
    case DynamicReconnectsInConfidence = "{PLANO}-Religa-Em-Confianca" - Android "Religa-em-Confianca"
  
    case DynamicChangeMyPlan = "{PLANO}-Quero-Mudar-Meu-Plano" nao tem no Android
  
    case validateYourEmail = "{PLANO}-Valide-seu-email-cadastrado" ok
  
    case contractSpecialCredit = "{PLANO}-Credito-Especial"  ok
  
    case buttonPlan = "{PLANO}-{Botao}"

    case ChangeCard = "{PLANO}-Alterar-Cartao" nao tem no Android
    
    case changeCreditCard = "{PLANO}-Forma-de-Pagamento" - Android "Forma-De-Pagamento" // somente aqui

    case stimulatingAccountOnlineChangeAccountType = "{PLANO}-Alterar-Tipo-de-Conta" ok
    
    case OffersForYouLateralMenu = "{PLANO}-Principais-Ofertas" ok
  
    case OffersForYou = "{PLANO}-Ofertas-Para-Voce" ok
    
    case CostQuery = "{PLANO}-Consulta-de-Gastos" ok
  
    case ClosePopupChallengeBeta = "{PLANO}-Desafio-Beta" nao tem no Android
    case ChallengeBeta = "{PLANO}-TIM-Beta" ok
  
    case RechargeNow = "{PLANO}-Saldo-Expirado" ok
  
    case CloseReconectInConfidence = "{PLANO}-Linha-Bloqueada" nao tem no Android
  
    case StimulusAccountOnlineWelcome = "{PLANO}-Welcome" ok
  
    case SLInno = "Tim-Inovou" nao tem no Android
    
    case balancePRE = "PRE-Saldo" Android - "Saldos"
    case balanceCON = "CON-Saldo" Android - "Saldos"
    case balanceEXP = "EXP-Saldo" Android - "Saldos"
    
    case BenefitsRedeemSeeMoreCON = "CON-Quero-Ver-Mais" nao tem no android
    case BenefitsRedeemSeeMoreEXP = "EXP-Quero-Ver-Mais" nao tem no android
    case BenefitsRedeemSeeMorePOS = "POS-Quero-Ver-Mais" nao tem no android
    
    case AppRatingPRE = "PRE-" 
    case AppRatingCON = "CON-" 
    case AppRatingEXP = "EXP-" 
    case AppRatingPOS = "POS-" 
    
    case EvaluationAppPRE = "PRE-Avaliar-AppStore" ok
    case EvaluationAppPOS = "POS-Avaliar-AppStore" ok
    case EvaluationAppEXP = "EXP-Avaliar-AppStore" ok
    case EvaluationAppCON = "CON-Avaliar-AppStore" ok
    
    case ChangeMyInterests = "Alterar-Meus-Interesses" ok
    
    case Enter = "Entrar" ok
    case ForgotMyPassword = "Esqueci-Minha-Senha" ok
    case PREPlan = "PRE-Plano" ok
    case POSPlan = "POS-Plano" ok
    case EXPPlan = "EXP-Plano" ok
    case CONPlan = "CON-Plano" ok
    case PRERefill = "PRE-Fazer-Recarga" ok
    case EXPRefill = "EXP-Fazer-Recarga" ok
    case CONRefill = "CON-Fazer-Recarga" ok
    case PREOfferHire = "PRE-Ofertas-Contratar" ok
    case POSOfferHire = "POS-Ofertas-Contratar" ok
    case EXPOfferHire = "EXP-Ofertas-Contratar" ok
    case CONOfferHire = "CON-Ofertas-Contratar" ok
    case PREAdditionalPackage = "PRE-Pacote-Adicional-Contratar" ok
    case POSAdditionalPackage = "POS-Pacote-Adicional-Contratar" ok
    case EXPAdditionalPackage = "EXP-Pacote-Adicional-Contratar" ok
    case CONAdditionalPackage = "CON-Pacote-Adicional-Contratar" ok
    case POSReconnectsInConfidence = "POS-Religa-Em-Confianca" Android "Religa-em-Confianca"
    case CONReconnectsInConfidence = "CON-Religa-Em-Confianca" Android "Religa-em-Confianca"
    case POSConfirmChangeAccountType = "POS-Alterar-Tipo-De-Conta-Confirmar" ok
    case CONConfirmChangeAccountType = "CON-Alterar-Tipo-De-Conta-Confirmar" ok
    case POSAccessChangePaymentMethod = "POS-Forma-De-Pagamento" ok
    case CONAccessChangePaymentMethod = "CON-Forma-De-Pagamento" ok
    case POSSaveChangePaymentMethod = "POS-Salvar-Alteracoes" ok
    case CONSaveChangePaymentMethod = "CON-Salvar-Alteracoes" ok
    case POSOnlineAccountChangePaymentMethod = "POS-Conta-Online" ok
    case CONOnlineAccountChangePaymentMethod = "CON-Conta-Online" ok
    case POSChangePaymentActionMethod = "POS-Alteracao-Da-Forma-De-Pagamento" ok 
    case CONChangePaymentActionMethod = "CON-Alteracao-Da-Forma-De-Pagamento" ok
    case PREChangeMyPlan = "PRE-Quero-Mudar-Meu-Plano" nao tem no android
    case POSChangeMyPlan = "POS-Quero-Mudar-Meu-Plano" nao tem no android
    case CONChangeMyPlan = "CON-Quero-Mudar-Meu-Plano" nao tem no android
    case EXPChangeMyPlan = "EXP-Quero-Mudar-Meu-Plano" nao tem no android
    case OfferToYou = "Ofertas-Para-Voce" ok
    case Offer = "Ofertas" ok
    case LastInvoices = "Ultima-Conta" ok
    case PlanLastInvoice = "{PLANO}-Ultima-Conta" ok
    case PurchaseAditionalPackage = "Contratar-Adicional" ok
    case AccountType = "Tipo-De-Conta" ok
    case DownloadNow = "Baixar-Agora" ok
    case Close = "Fechar" ok
    case TermsOfResponsibility = "Termos-De-Responsabilidade" ok
    case SaveChanges = "Salvar-Alteracoes" ok
    case Exit = "Sair" ok
    case Cancel = "Cancelar" ok 
    case PREInternet = "PRE-Internet" ok
    case PREAccumulatedInternet = "PRE-Internet-Acumulada" ok
    case ItemMenuChat = "Chat" ok
    case ItemMenuDeviceGuides = "Guia-De-Aparelhos" ok
    case ItemMenuTerms = "Termos-De-Uso" ok
    case ItemMenuFAQ = "Duvidas" ok
    case ItemMenuNotifications = "Notificacoes" ok
    case ItemMenuContribuaComMeuTIM = "Contribua-Com-O-Meu-TIM" ok
    case ItemMenuLogout = "Desconectar" ok
    case ItemMenuHome = "Home" ok
    case ItemMenuConsumoDetalhado = "Consumo-Detalhado" ok
    case ItemMenuMinhasContas = "Minhas-Contas" ok
    case ItemMenuMeuPerfil = "Meu-Perfil"  - nao tem no Android
    case ItemMenuMeuPlano = "Meu-Plano" ok
    case ItemMenuAlterarDados = "Alterar-Dados" ok
    case ItemMenuOutrasOpcoes = "Outras-Opcoes" ok
    case ChangeStatusNotification = "Alterar-Status" ok
    case ShowInvoicePDF = "Ver-Conta-PDF" ok
    case DoubtsSelectedGeneral = "Geral" nao tem no android
    case DoubtsSelectedBalance = "Saldo" - Android "Saldos"
    case DoubtsSelectedInvoices = "Contas" - nao tem no Android
    case DoubtsSelectedInternet = "Internet" ok
    case DoubtsSelectedVoice = "Minutos" nao tem no android
    case MyProfileServices = "Servicos" nao tem no Android
    case AssociatedLines = "Linhas-Associadas" ok
    case BenefitsRedeem = "TIM-Pra-Mim" - android "Tim-pra-MIM"
    case BenefitsRedeemSeeMore = "Quero-Ver-Mais" nao tem no android
    case ButtonLogoutHome = "{PLANO}-Desconectar" ok
    case ButtonBarCodeLastInvoices = "{PLANO}-Minhas-Contas" ok
    case UnderstandMoreFAQ = "{PLANO}-Entenda-Mais" ok
    case NegotiateWithUs = "{PLANO}-Negocie-com-a-Gente" ok
    case RechargePaymentMethod = "{PLANO}-Recarga" ok
    case RechargeChosenBank = "{PLANO}-Selecionar-Banco" nao tem no Android
    case CallTimPraMim = "{PLANO}-TIM-pra-MIM" - android "Tim-pra-MIM"
    case AdditionalInternetCard = "{PLANO}-Internet" ok
    
    enum ChangeMyPlan: String {
        case plan = "{PLANO}"
        case nomeDoPasso = "{Nome-do-Passo}"
        case cepNaoEncontrado = "CEP-Nao-encontrado"
        case cpfNaoReconhecido = "CPF-Nao-Reconhecido" - Android "CPF-Nao-reconhecido"
        case myplan = "Meu-Plano"
    }
}