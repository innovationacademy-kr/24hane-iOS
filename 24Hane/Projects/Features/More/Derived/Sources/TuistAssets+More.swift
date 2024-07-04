// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum MoreAsset {
  public static let accentColor = MoreColors(name: "AccentColor")
  public static let background = MoreImages(name: "Background")
  public static let backgroundDefault = MoreColors(name: "BackgroundDefault")
  public static let backgroundCalendar = MoreColors(name: "backgroundCalendar")
  public static let dateBackgroundLevel1 = MoreColors(name: "dateBackgroundLevel1")
  public static let dateBackgroundLevel2 = MoreColors(name: "dateBackgroundLevel2")
  public static let dateBackgroundLevel3 = MoreColors(name: "dateBackgroundLevel3")
  public static let dateBackgroundLevel4 = MoreColors(name: "dateBackgroundLevel4")
  public static let dateSelected = MoreColors(name: "dateSelected")
  public static let dateToday = MoreColors(name: "dateToday")
  public static let fontDefault = MoreColors(name: "fontDefault")
  public static let fontDisabled = MoreColors(name: "fontDisabled")
  public static let fontGray = MoreColors(name: "fontGray")
  public static let fontWhite = MoreColors(name: "fontWhite")
  public static let launchScreenColor = MoreColors(name: "launchScreenColor")
  public static let launchLogo = MoreImages(name: "LaunchLogo")
  public static let launchScreen = MoreImages(name: "LaunchScreen")
  public static let logo = MoreImages(name: "Logo")
  public static let book = MoreImages(name: "book")
  public static let cabi = MoreImages(name: "cabi")
  public static let calendar = MoreImages(name: "calendar")
  public static let card = MoreImages(name: "card")
  public static let chat = MoreImages(name: "chat")
  public static let hamburger = MoreImages(name: "hamburger")
  public static let home = MoreImages(name: "home")
  public static let info = MoreImages(name: "info")
  public static let logout = MoreImages(name: "logout")
  public static let notification = MoreImages(name: "notification")
  public static let selectedBurger = MoreImages(name: "selectedBurger")
  public static let selectedCalendar = MoreImages(name: "selectedCalendar")
  public static let selectedHome = MoreImages(name: "selectedHome")
  public static let union = MoreImages(name: "union")
  public static let user = MoreImages(name: "user")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class MoreColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  private var _swiftUIColor: Any? = nil
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public private(set) var swiftUIColor: SwiftUI.Color {
    get {
      if self._swiftUIColor == nil {
        self._swiftUIColor = SwiftUI.Color(asset: self)
      }

      return self._swiftUIColor as! SwiftUI.Color
    }
    set {
      self._swiftUIColor = newValue
    }
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension MoreColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: MoreColors) {
    let bundle = MoreResources.bundle
    #if os(iOS) || os(tvOS) || os(visionOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Color {
  init(asset: MoreColors) {
    let bundle = MoreResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct MoreImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = MoreResources.bundle
    #if os(iOS) || os(tvOS) || os(visionOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Image {
  init(asset: MoreImages) {
    let bundle = MoreResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: MoreImages, label: Text) {
    let bundle = MoreResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: MoreImages) {
    let bundle = MoreResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
