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
public enum HomeAsset {
  public static let accentColor = HomeColors(name: "AccentColor")
  public static let background = HomeImages(name: "Background")
  public static let backgroundDefault = HomeColors(name: "BackgroundDefault")
  public static let backgroundCalendar = HomeColors(name: "backgroundCalendar")
  public static let dateBackgroundLevel1 = HomeColors(name: "dateBackgroundLevel1")
  public static let dateBackgroundLevel2 = HomeColors(name: "dateBackgroundLevel2")
  public static let dateBackgroundLevel3 = HomeColors(name: "dateBackgroundLevel3")
  public static let dateBackgroundLevel4 = HomeColors(name: "dateBackgroundLevel4")
  public static let dateSelected = HomeColors(name: "dateSelected")
  public static let dateToday = HomeColors(name: "dateToday")
  public static let fontDefault = HomeColors(name: "fontDefault")
  public static let fontDisabled = HomeColors(name: "fontDisabled")
  public static let fontGray = HomeColors(name: "fontGray")
  public static let fontWhite = HomeColors(name: "fontWhite")
  public static let launchScreenColor = HomeColors(name: "launchScreenColor")
  public static let launchLogo = HomeImages(name: "LaunchLogo")
  public static let launchScreen = HomeImages(name: "LaunchScreen")
  public static let logo = HomeImages(name: "Logo")
  public static let book = HomeImages(name: "book")
  public static let cabi = HomeImages(name: "cabi")
  public static let calendar = HomeImages(name: "calendar")
  public static let card = HomeImages(name: "card")
  public static let chat = HomeImages(name: "chat")
  public static let hamburger = HomeImages(name: "hamburger")
  public static let home = HomeImages(name: "home")
  public static let info = HomeImages(name: "info")
  public static let logout = HomeImages(name: "logout")
  public static let notification = HomeImages(name: "notification")
  public static let selectedBurger = HomeImages(name: "selectedBurger")
  public static let selectedCalendar = HomeImages(name: "selectedCalendar")
  public static let selectedHome = HomeImages(name: "selectedHome")
  public static let union = HomeImages(name: "union")
  public static let user = HomeImages(name: "user")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class HomeColors {
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

public extension HomeColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: HomeColors) {
    let bundle = HomeResources.bundle
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
  init(asset: HomeColors) {
    let bundle = HomeResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct HomeImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = HomeResources.bundle
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
  init(asset: HomeImages) {
    let bundle = HomeResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: HomeImages, label: Text) {
    let bundle = HomeResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: HomeImages) {
    let bundle = HomeResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
