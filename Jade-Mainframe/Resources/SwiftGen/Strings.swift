// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// R$
  internal static let currencySymbol = L10n.tr("Localizable", "currencySymbol")
  /// Favoritos
  internal static let favoritesTabName = L10n.tr("Localizable", "favoritesTabName")
  /// Home
  internal static let homeTabName = L10n.tr("Localizable", "homeTabName")
  /// Preço Inválido
  internal static let invalidPriceWarning = L10n.tr("Localizable", "invalidPriceWarning")
  /// pt_BR
  internal static let locale = L10n.tr("Localizable", "locale")
  /// Perfil
  internal static let profileTabName = L10n.tr("Localizable", "profileTabName")
  /// *
  internal static let requiredFieldSymbol = L10n.tr("Localizable", "requiredFieldSymbol")
  /// Buscar
  internal static let searchBarPlaceholderText = L10n.tr("Localizable", "searchBarPlaceholderText")
  /// Vender
  internal static let sellingTabName = L10n.tr("Localizable", "sellingTabName")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
