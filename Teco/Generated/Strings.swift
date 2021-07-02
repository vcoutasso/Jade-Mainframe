// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  /// Sobre este produto
  internal static let aboutProduct = Strings.tr("Localizable", "aboutProduct")
  /// Sobre nós
  internal static let aboutUs = Strings.tr("Localizable", "aboutUs")
  /// Conta
  internal static let account = Strings.tr("Localizable", "account")
  /// Adicionar produtos desejados
  internal static let addProducts = Strings.tr("Localizable", "addProducts")
  /// Produtos anunciados
  internal static let announcedProducts = Strings.tr("Localizable", "announcedProducts")
  /// Compra e Venda
  internal static let buyAndSell = Strings.tr("Localizable", "buyAndSell")
  /// Cansado de procurar? \nA gente fica de olho e te avisa \nquando achar.
  internal static let callToTheWatchList = Strings.tr("Localizable", "callToTheWatchList")
  /// Confirmar características
  internal static let confirmFeatures = Strings.tr("Localizable", "confirmFeatures")
  /// R$
  internal static let currencySymbol = Strings.tr("Localizable", "currencySymbol")
  /// Descrição
  internal static let description = Strings.tr("Localizable", "description")
  /// Favoritos
  internal static let favoritesTabName = Strings.tr("Localizable", "favoritesTabName")
  /// Voltar
  internal static let goBack = Strings.tr("Localizable", "goBack")
  /// Central de ajuda
  internal static let helpCenter = Strings.tr("Localizable", "helpCenter")
  /// Home
  internal static let homeTabName = Strings.tr("Localizable", "homeTabName")
  /// Institucional
  internal static let institutional = Strings.tr("Localizable", "institutional")
  /// Preço Inválido
  internal static let invalidPriceWarning = Strings.tr("Localizable", "invalidPriceWarning")
  /// pt_BR
  internal static let locale = Strings.tr("Localizable", "locale")
  /// + categorias
  internal static let moreCategories = Strings.tr("Localizable", "moreCategories")
  /// Formas de pagamento
  internal static let paymentMethods = Strings.tr("Localizable", "paymentMethods")
  /// Perfil
  internal static let profileTabName = Strings.tr("Localizable", "profileTabName")
  /// Saiba mais
  internal static let readMore = Strings.tr("Localizable", "readMore")
  /// *
  internal static let requiredFieldSymbol = Strings.tr("Localizable", "requiredFieldSymbol")
  /// Pesquisar no Teco
  internal static let searchBarPlaceholderText = Strings.tr("Localizable", "searchBarPlaceholderText")
  /// Ver mais características
  internal static let seeMore = Strings.tr("Localizable", "seeMore")
  /// Vender
  internal static let sellingTabName = Strings.tr("Localizable", "sellingTabName")
  /// Configurações
  internal static let settings = Strings.tr("Localizable", "settings")
  /// Ficha técnica
  internal static let technicalSheet = Strings.tr("Localizable", "technicalSheet")
  /// ficar de olho
  internal static let watchList = Strings.tr("Localizable", "watchList")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
