// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Assets {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal enum Colors {
    internal enum TecoPalette {
      internal static let darkBlue = ColorAsset(name: "Colors/TecoPalette/darkBlue")
      internal static let darkGray = ColorAsset(name: "Colors/TecoPalette/darkGray")
      internal static let discountRed = ColorAsset(name: "Colors/TecoPalette/discountRed")
      internal static let lightBlue = ColorAsset(name: "Colors/TecoPalette/lightBlue")
      internal static let lightGray = ColorAsset(name: "Colors/TecoPalette/lightGray")
      internal static let mediumDarkGray = ColorAsset(name: "Colors/TecoPalette/mediumDarkGray")
      internal static let mediumGray = ColorAsset(name: "Colors/TecoPalette/mediumGray")
      internal static let mediumLightGray = ColorAsset(name: "Colors/TecoPalette/mediumLightGray")
      internal static let tecoPink = ColorAsset(name: "Colors/TecoPalette/tecoPink")
    }
    internal static let storyGradientBottom = ColorAsset(name: "Colors/storyGradientBottom")
    internal static let storyGradientTop = ColorAsset(name: "Colors/storyGradientTop")
  }
  internal enum Images {
    internal static let _12 = ImageAsset(name: "Images/12")
    internal enum Banners {
      internal static let bannerCansado = ImageAsset(name: "Images/Banners/bannerCansado")
    }
    internal enum Icons {
      internal static let binoculars = ImageAsset(name: "Images/Icons/binoculars")
      internal static let filledBinoculars = ImageAsset(name: "Images/Icons/filledBinoculars")
      internal static let filledHeart = ImageAsset(name: "Images/Icons/filledHeart")
      internal static let heart = ImageAsset(name: "Images/Icons/heart")
      internal static let iphoneScreen = ImageAsset(name: "Images/Icons/iphoneScreen")
    }
  }

  // swiftlint:disable trailing_comma
  internal static let allColors: [ColorAsset] = [
    accentColor,
    Colors.TecoPalette.darkBlue,
    Colors.TecoPalette.darkGray,
    Colors.TecoPalette.discountRed,
    Colors.TecoPalette.lightBlue,
    Colors.TecoPalette.lightGray,
    Colors.TecoPalette.mediumDarkGray,
    Colors.TecoPalette.mediumGray,
    Colors.TecoPalette.mediumLightGray,
    Colors.TecoPalette.tecoPink,
    Colors.storyGradientBottom,
    Colors.storyGradientTop,
  ]
  internal static let allImages: [ImageAsset] = [
    Images._12,
    Images.Banners.bannerCansado,
    Images.Icons.binoculars,
    Images.Icons.filledBinoculars,
    Images.Icons.filledHeart,
    Images.Icons.heart,
    Images.Icons.iphoneScreen,
  ]
  // swiftlint:enable trailing_comma
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
