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
public enum HANE24Asset {
  public static let accentColor = HANE24Colors(name: "AccentColor")
  public static let background = HANE24Images(name: "Background")
  public static let backgroundDefault = HANE24Colors(name: "BackgroundDefault")
  public static let backgroundCalendar = HANE24Colors(name: "backgroundCalendar")
  public static let dateBackgroundLevel1 = HANE24Colors(name: "dateBackgroundLevel1")
  public static let dateBackgroundLevel2 = HANE24Colors(name: "dateBackgroundLevel2")
  public static let dateBackgroundLevel3 = HANE24Colors(name: "dateBackgroundLevel3")
  public static let dateBackgroundLevel4 = HANE24Colors(name: "dateBackgroundLevel4")
  public static let dateSelected = HANE24Colors(name: "dateSelected")
  public static let dateToday = HANE24Colors(name: "dateToday")
  public static let fontDefault = HANE24Colors(name: "fontDefault")
  public static let fontDisabled = HANE24Colors(name: "fontDisabled")
  public static let fontGray = HANE24Colors(name: "fontGray")
  public static let fontWhite = HANE24Colors(name: "fontWhite")
  public static let launchScreenColor = HANE24Colors(name: "launchScreenColor")
  public static let launchLogo = HANE24Images(name: "LaunchLogo")
  public static let launchScreen = HANE24Images(name: "LaunchScreen")
  public static let logo = HANE24Images(name: "Logo")
  public static let book = HANE24Images(name: "book")
  public static let cabi = HANE24Images(name: "cabi")
  public static let calendar = HANE24Images(name: "calendar")
  public static let card = HANE24Images(name: "card")
  public static let chat = HANE24Images(name: "chat")
  public static let hamburger = HANE24Images(name: "hamburger")
  public static let home = HANE24Images(name: "home")
  public static let info = HANE24Images(name: "info")
  public static let logout = HANE24Images(name: "logout")
  public static let notification = HANE24Images(name: "notification")
  public static let selectedBurger = HANE24Images(name: "selectedBurger")
  public static let selectedCalendar = HANE24Images(name: "selectedCalendar")
  public static let selectedHome = HANE24Images(name: "selectedHome")
  public static let union = HANE24Images(name: "union")
  public static let user = HANE24Images(name: "user")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class HANE24Colors {
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

public extension HANE24Colors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: HANE24Colors) {
    let bundle = HANE24Resources.bundle
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
  init(asset: HANE24Colors) {
    let bundle = HANE24Resources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct HANE24Images {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = HANE24Resources.bundle
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
  init(asset: HANE24Images) {
    let bundle = HANE24Resources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: HANE24Images, label: Text) {
    let bundle = HANE24Resources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: HANE24Images) {
    let bundle = HANE24Resources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
