enum GACategory:String {
    
    case myTickets = "AppMeuTIM-{PLANO}-Meus-Boletos" ok
  
    case Storie = "AppMeuTIM-{PLANO}-Stories" ok
    
    case PayNow = "AppMeuTIM-{PLANO}-Pagar-Agora" ok
  
    case ChangeCardURA = "AppMeuTIM-{PLANO}-Forma-De-Pagamento" - Android nao tem
 
    case rechargeNow = "AppMeuTIM-{PLANO}-Promocoes" ok
  
    case DynamicMyProfile = "AppMeuTIM-{PLANO}-Meu-Perfil" ok
    
    case ChangeMyPlan = "AppMeuTIM"
    
    enum ChangeMyPlanCategory: String {
        case plano = "{PLANO}"
        case meuPerfil = "Meu-Perfil" ok
        case migracaoPlano = "Migracao-Plano" ok
        case nomeDoPasso = "{Nome-do-Passo}" 
    }
  
    case stimulusAccountOnlineMyAccounts = "AppMeuTIM-{PLANO}-Minhas-Contas" ok
  
    case DynamicOffer = "AppMeuTIM-{PLANO}-Ofertas" ok
  
    case PlanHome = "AppMeuTIM-{PLANO}-Home" ok
    
    case Extract = "AppMeuTIM-{PLANO}-Extrato" ok

    case Login = "AppMeuTIM-Login" ok
    case PREHome = "AppMeuTIM-PRE-Home" Android Dynamic
    case POSHome = "AppMeuTIM-POS-Home" Android Dynamic
    case EXPHome = "AppMeuTIM-EXP-Home" Android Dynamic
    case CONHome = "AppMeuTIM-CON-Home" Android Dynamic
    case PREMyProfile = "AppMeuTIM-PRE-Meu-Perfil" Android Dynamic
    case POSMyProfile = "AppMeuTIM-POS-Meu-Perfil" Android Dynamic
    case CONMyProfile = "AppMeuTIM-CON-Meu-Perfil" Android Dynamic
    case EXPMyProfile = "AppMeuTIM-EXP-Meu-Perfil" Android Dynamic
    case PREOffer = "AppMeuTIM-PRE-Ofertas" Android Dynamic
    case POSOffer = "AppMeuTIM-POS-Ofertas" Android Dynamic
    case EXPOffer = "AppMeuTIM-EXP-Ofertas" Android Dynamic
    case CONOffer = "AppMeuTIM-CON-Ofertas" Android Dynamic
    case POSMyAccounts = "AppMeuTIM-POS-Minhas-Contas" Android Dynamic
    case CONMyAccounts = "AppMeuTIM-CON-Minhas-Contas" Android Dynamic
    case POSChangePaymentMethod = "AppMeuTIM-POS-Alterar-Forma-De-Pagamento" Android Dynamic
    case CONChangePaymentMethod = "AppMeuTIM-CON-Alterar-Forma-De-Pagamento" Android Dynamic
    case POSReconnectsInterception = "AppMeuTIM-POS-Religa-Interceptacao" Android Dynamic
    case CONReconnectsInterception = "AppMeuTIM-CON-Religa-Interceptacao" Android Dynamic
    case EXPNewVersion = "AppMeuTIM-EXP-Nova-Versao" Android Dynamic
    case CONNewVersion = "AppMeuTIM-CON-Nova-Versao" Android Dynamic
    case POSNewVersion = "AppMeuTIM-POS-Nova-Versao" Android Dynamic
    case PRENewVersion = "AppMeuTIM-PRE-Nova-Versao" Android Dynamic
    case CONChangeMyData = "AppMeuTIM-CON-Alterar-Meus-Dados" Android Dynamic
    case POSChangeMyData = "AppMeuTIM-POS-Alterar-Meus-Dados" Android Dynamic
    case PREAccumulatedInternet = "AppMeuTIM-PRE-Extrato-Internet-Acumulada" não tem no Android
    
    case PREOtherOptions = "AppMeuTIM-PRE-Outras-Opcoes" Android Dynamic
    case POSOtherOptions = "AppMeuTIM-POS-Outras-Opcoes" Android Dynamic
    case CONOtherOptions = "AppMeuTIM-CON-Outras-Opcoes" Android Dynamic
    case EXPOtherOptions = "AppMeuTIM-EXP-Outras-Opcoes" Android Dynamic
    
    case PREMenu = "AppMeuTIM-PRE-Menu" Android Dynamic
    case POSMenu = "AppMeuTIM-POS-Menu" Android Dynamic
    case CONMenu = "AppMeuTIM-CON-Menu" Android Dynamic
    case EXPMenu = "AppMeuTIM-EXP-Menu" Android Dynamic
    
    case PRENotificationsEdit = "AppMeuTIM-PRE-Notificacoes" Android Dynamic
    case POSNotificationsEdit = "AppMeuTIM-POS-Notificacoes" Android Dynamic
    case CONNotificationsEdit = "AppMeuTIM-CON-Notificacoes" Android Dynamic
    case EXPNotificationsEdit = "AppMeuTIM-EXP-Notificacoes" Android Dynamic
    
    case PREDoubtsSelected = "AppMeuTIM-PRE-Duvidas" Android Dynamic
    case POSDoubtsSelected = "AppMeuTIM-POS-Duvidas" Android Dynamic
    case CONDoubtsSelected = "AppMeuTIM-CON-Duvidas" Android Dynamic
    case EXPDoubtsSelected = "AppMeuTIM-EXP-Duvidas" Android Dynamic
    
    case POSServices = "AppMeuTIM-POS-Servicos" android esta com "Servico"
    case CONServices = "AppMeuTIM-CON-Servicos" android esta com "Servico"
    case Services = "AppMeuTIM-{PLANO}-Servico" android esta com "Servico"
    
    case PREAssociatedProfile = "AppMeuTIM-PRE-Linhas-Associadas" Android Dynamic
    case POSAssociatedProfile = "AppMeuTIM-POS-Linhas-Associadas" Android Dynamic
    case CONAssociatedProfile = "AppMeuTIM-CON-Linhas-Associadas" Android Dynamic
    case EXPAssociatedProfile = "AppMeuTIM-EXP-Linhas-Associadas" Android Dynamic
    
    case PREBenefitsRedeem = "AppMeuTIM-PRE-Tim-Pra-Mim" Android Dynamic
    case POSBenefitsRedeem = "AppMeuTIM-POS-Tim-Pra-Mim" Android Dynamic
    case CONBenefitsRedeem = "AppMeuTIM-CON-Tim-Pra-Mim" Android Dynamic
    case EXPBenefitsRedeem = "AppMeuTIM-EXP-Tim-Pra-Mim" Android Dynamic
    
    case PREAppRating = "AppMeuTIM-PRE-Avaliacao" Android Dynamic
    case POSAppRating = "AppMeuTIM-POS-Avaliacao" Android Dynamic
    case CONAppRating = "AppMeuTIM-CON-Avaliacao" Android Dynamic
    case EXPAppRating = "AppMeuTIM-EXP-Avaliacao" Android Dynamic
    
    case processing = "AppMeuTIM-Processamento" Android Dynamic
    
    case ChangeMyData = "AppMeuTIM-{PLANO}-Alterar-Meus-Dados" Android Dynamic
    
    case TabMenu = "AppMeuTIM-{PLANO}-Menu" Android Dynamic