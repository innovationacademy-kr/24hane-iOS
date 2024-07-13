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
public enum HomeDemoAsset {
  public static let accentColor = HomeDemoColors(name: "AccentColor")
  public static let background = HomeDemoImages(name: "Background")
  public static let backgroundDefault = HomeDemoColors(name: "BackgroundDefault")
  public static let backgroundCalendar = HomeDemoColors(name: "backgroundCalendar")
  public static let dateBackgroundLevel1 = HomeDemoColors(name: "dateBackgroundLevel1")
  public static let dateBackgroundLevel2 = HomeDemoColors(name: "dateBackgroundLevel2")
  public static let dateBackgroundLevel3 = HomeDemoColors(name: "dateBackgroundLevel3")
  public static let dateBackgroundLevel4 = HomeDemoColors(name: "dateBackgroundLevel4")
  public static let dateSelected = HomeDemoColors(name: "dateSelected")
  public static let dateToday = HomeDemoColors(name: "dateToday")
  public static let fontDefault = HomeDemoColors(name: "fontDefault")
  public static let fontDisabled = HomeDemoColors(name: "fontDisabled")
  public static let fontGray = HomeDemoColors(name: "fontGray")
  public static let fontWhite = HomeDemoColors(name: "fontWhite")
  public static let launchScreenColor = HomeDemoColors(name: "launchScreenColor")
  public static let launchLogo = HomeDemoImages(name: "LaunchLogo")
  public static let launchScreen = HomeDemoImages(name: "LaunchScreen")
  public static let logo = HomeDemoImages(name: "Logo")
  public static let book = HomeDemoImages(name: "book")
  public static let cabi = HomeDemoImages(name: "cabi")
  public static let calendar = HomeDemoImages(name: "calendar")
  public static let card = HomeDemoImages(name: "card")
  public static let chat = HomeDemoImages(name: "chat")
  public static let hamburger = HomeDemoImages(name: "hamburger")
  public static let home = HomeDemoImages(name: "home")
  public static let info = HomeDemoImages(name: "info")
  public static let logout = HomeDemoImages(name: "logout")
  public static let notification = HomeDemoImages(name: "notification")
  public static let selectedBurger = HomeDemoImages(name: "selectedBurger")
  public static let selectedCalendar = HomeDemoImages(name: "selectedCalendar")
  public static let selectedHome = HomeDemoImages(name: "selectedHome")
  public static let union = HomeDemoImages(name: "union")
  public static let user = HomeDemoImages(name: "user")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class HomeDemoColors {
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

public extension HomeDemoColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: HomeDemoColors) {
    let bundle = HomeDemoResources.bundle
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
  init(asset: HomeDemoColors) {
    let bundle = HomeDemoResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct HomeDemoImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = HomeDemoResources.bundle
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
  init(asset: HomeDemoImages) {
    let bundle = HomeDemoResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: HomeDemoImages, label: Text) {
    let bundle = HomeDemoResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: HomeDemoImages) {
    let bundle = HomeDemoResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
