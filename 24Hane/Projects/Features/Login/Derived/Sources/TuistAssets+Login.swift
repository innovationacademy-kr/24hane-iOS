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
public enum LoginAsset {
  public static let accentColor = LoginColors(name: "AccentColor")
  public static let background = LoginImages(name: "Background")
  public static let backgroundDefault = LoginColors(name: "BackgroundDefault")
  public static let backgroundCalendar = LoginColors(name: "backgroundCalendar")
  public static let dateBackgroundLevel1 = LoginColors(name: "dateBackgroundLevel1")
  public static let dateBackgroundLevel2 = LoginColors(name: "dateBackgroundLevel2")
  public static let dateBackgroundLevel3 = LoginColors(name: "dateBackgroundLevel3")
  public static let dateBackgroundLevel4 = LoginColors(name: "dateBackgroundLevel4")
  public static let dateSelected = LoginColors(name: "dateSelected")
  public static let dateToday = LoginColors(name: "dateToday")
  public static let fontDefault = LoginColors(name: "fontDefault")
  public static let fontDisabled = LoginColors(name: "fontDisabled")
  public static let fontGray = LoginColors(name: "fontGray")
  public static let fontWhite = LoginColors(name: "fontWhite")
  public static let launchScreenColor = LoginColors(name: "launchScreenColor")
  public static let launchLogo = LoginImages(name: "LaunchLogo")
  public static let launchScreen = LoginImages(name: "LaunchScreen")
  public static let logo = LoginImages(name: "Logo")
  public static let book = LoginImages(name: "book")
  public static let cabi = LoginImages(name: "cabi")
  public static let calendar = LoginImages(name: "calendar")
  public static let card = LoginImages(name: "card")
  public static let chat = LoginImages(name: "chat")
  public static let hamburger = LoginImages(name: "hamburger")
  public static let home = LoginImages(name: "home")
  public static let info = LoginImages(name: "info")
  public static let logout = LoginImages(name: "logout")
  public static let notification = LoginImages(name: "notification")
  public static let selectedBurger = LoginImages(name: "selectedBurger")
  public static let selectedCalendar = LoginImages(name: "selectedCalendar")
  public static let selectedHome = LoginImages(name: "selectedHome")
  public static let union = LoginImages(name: "union")
  public static let user = LoginImages(name: "user")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class LoginColors {
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

public extension LoginColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: LoginColors) {
    let bundle = LoginResources.bundle
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
  init(asset: LoginColors) {
    let bundle = LoginResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct LoginImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = LoginResources.bundle
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
  init(asset: LoginImages) {
    let bundle = LoginResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: LoginImages, label: Text) {
    let bundle = LoginResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: LoginImages) {
    let bundle = LoginResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
