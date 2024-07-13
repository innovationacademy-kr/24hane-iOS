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
public enum LoginDemoAsset {
  public static let accentColor = LoginDemoColors(name: "AccentColor")
  public static let background = LoginDemoImages(name: "Background")
  public static let backgroundDefault = LoginDemoColors(name: "BackgroundDefault")
  public static let backgroundCalendar = LoginDemoColors(name: "backgroundCalendar")
  public static let dateBackgroundLevel1 = LoginDemoColors(name: "dateBackgroundLevel1")
  public static let dateBackgroundLevel2 = LoginDemoColors(name: "dateBackgroundLevel2")
  public static let dateBackgroundLevel3 = LoginDemoColors(name: "dateBackgroundLevel3")
  public static let dateBackgroundLevel4 = LoginDemoColors(name: "dateBackgroundLevel4")
  public static let dateSelected = LoginDemoColors(name: "dateSelected")
  public static let dateToday = LoginDemoColors(name: "dateToday")
  public static let fontDefault = LoginDemoColors(name: "fontDefault")
  public static let fontDisabled = LoginDemoColors(name: "fontDisabled")
  public static let fontGray = LoginDemoColors(name: "fontGray")
  public static let fontWhite = LoginDemoColors(name: "fontWhite")
  public static let launchScreenColor = LoginDemoColors(name: "launchScreenColor")
  public static let launchLogo = LoginDemoImages(name: "LaunchLogo")
  public static let launchScreen = LoginDemoImages(name: "LaunchScreen")
  public static let logo = LoginDemoImages(name: "Logo")
  public static let book = LoginDemoImages(name: "book")
  public static let cabi = LoginDemoImages(name: "cabi")
  public static let calendar = LoginDemoImages(name: "calendar")
  public static let card = LoginDemoImages(name: "card")
  public static let chat = LoginDemoImages(name: "chat")
  public static let hamburger = LoginDemoImages(name: "hamburger")
  public static let home = LoginDemoImages(name: "home")
  public static let info = LoginDemoImages(name: "info")
  public static let logout = LoginDemoImages(name: "logout")
  public static let notification = LoginDemoImages(name: "notification")
  public static let selectedBurger = LoginDemoImages(name: "selectedBurger")
  public static let selectedCalendar = LoginDemoImages(name: "selectedCalendar")
  public static let selectedHome = LoginDemoImages(name: "selectedHome")
  public static let union = LoginDemoImages(name: "union")
  public static let user = LoginDemoImages(name: "user")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class LoginDemoColors {
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

public extension LoginDemoColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: LoginDemoColors) {
    let bundle = LoginDemoResources.bundle
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
  init(asset: LoginDemoColors) {
    let bundle = LoginDemoResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct LoginDemoImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = LoginDemoResources.bundle
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
  init(asset: LoginDemoImages) {
    let bundle = LoginDemoResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: LoginDemoImages, label: Text) {
    let bundle = LoginDemoResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: LoginDemoImages) {
    let bundle = LoginDemoResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
