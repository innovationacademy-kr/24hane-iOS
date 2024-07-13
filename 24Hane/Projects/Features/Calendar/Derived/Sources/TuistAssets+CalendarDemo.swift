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
public enum CalendarDemoAsset {
  public static let accentColor = CalendarDemoColors(name: "AccentColor")
  public static let background = CalendarDemoImages(name: "Background")
  public static let backgroundDefault = CalendarDemoColors(name: "BackgroundDefault")
  public static let backgroundCalendar = CalendarDemoColors(name: "backgroundCalendar")
  public static let dateBackgroundLevel1 = CalendarDemoColors(name: "dateBackgroundLevel1")
  public static let dateBackgroundLevel2 = CalendarDemoColors(name: "dateBackgroundLevel2")
  public static let dateBackgroundLevel3 = CalendarDemoColors(name: "dateBackgroundLevel3")
  public static let dateBackgroundLevel4 = CalendarDemoColors(name: "dateBackgroundLevel4")
  public static let dateSelected = CalendarDemoColors(name: "dateSelected")
  public static let dateToday = CalendarDemoColors(name: "dateToday")
  public static let fontDefault = CalendarDemoColors(name: "fontDefault")
  public static let fontDisabled = CalendarDemoColors(name: "fontDisabled")
  public static let fontGray = CalendarDemoColors(name: "fontGray")
  public static let fontWhite = CalendarDemoColors(name: "fontWhite")
  public static let launchScreenColor = CalendarDemoColors(name: "launchScreenColor")
  public static let launchLogo = CalendarDemoImages(name: "LaunchLogo")
  public static let launchScreen = CalendarDemoImages(name: "LaunchScreen")
  public static let logo = CalendarDemoImages(name: "Logo")
  public static let book = CalendarDemoImages(name: "book")
  public static let cabi = CalendarDemoImages(name: "cabi")
  public static let calendar = CalendarDemoImages(name: "calendar")
  public static let card = CalendarDemoImages(name: "card")
  public static let chat = CalendarDemoImages(name: "chat")
  public static let hamburger = CalendarDemoImages(name: "hamburger")
  public static let home = CalendarDemoImages(name: "home")
  public static let info = CalendarDemoImages(name: "info")
  public static let logout = CalendarDemoImages(name: "logout")
  public static let notification = CalendarDemoImages(name: "notification")
  public static let selectedBurger = CalendarDemoImages(name: "selectedBurger")
  public static let selectedCalendar = CalendarDemoImages(name: "selectedCalendar")
  public static let selectedHome = CalendarDemoImages(name: "selectedHome")
  public static let union = CalendarDemoImages(name: "union")
  public static let user = CalendarDemoImages(name: "user")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class CalendarDemoColors {
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

public extension CalendarDemoColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: CalendarDemoColors) {
    let bundle = CalendarDemoResources.bundle
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
  init(asset: CalendarDemoColors) {
    let bundle = CalendarDemoResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct CalendarDemoImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = CalendarDemoResources.bundle
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
  init(asset: CalendarDemoImages) {
    let bundle = CalendarDemoResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: CalendarDemoImages, label: Text) {
    let bundle = CalendarDemoResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: CalendarDemoImages) {
    let bundle = CalendarDemoResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
