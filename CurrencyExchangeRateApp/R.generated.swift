//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 4 storyboards.
  struct storyboard {
    /// Storyboard `BaseNavigationViewController`.
    static let baseNavigationViewController = _R.storyboard.baseNavigationViewController()
    /// Storyboard `CurrencyDetail`.
    static let currencyDetail = _R.storyboard.currencyDetail()
    /// Storyboard `CurrencyList`.
    static let currencyList = _R.storyboard.currencyList()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "BaseNavigationViewController", bundle: ...)`
    static func baseNavigationViewController(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.baseNavigationViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "CurrencyDetail", bundle: ...)`
    static func currencyDetail(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.currencyDetail)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "CurrencyList", bundle: ...)`
    static func currencyList(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.currencyList)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.file` struct is generated, and contains static references to 2 files.
  struct file {
    /// Resource file `.swiftlint.yml`.
    static let swiftlintYml = Rswift.FileResource(bundle: R.hostingBundle, name: ".swiftlint", pathExtension: "yml")
    /// Resource file `currencyListSample.json`.
    static let currencyListSampleJson = Rswift.FileResource(bundle: R.hostingBundle, name: "currencyListSample", pathExtension: "json")

    /// `bundle.url(forResource: ".swiftlint", withExtension: "yml")`
    static func swiftlintYml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.swiftlintYml
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "currencyListSample", withExtension: "json")`
    static func currencyListSampleJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.currencyListSampleJson
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 2 images.
  struct image {
    /// Image `european-union`.
    static let europeanUnion = Rswift.ImageResource(bundle: R.hostingBundle, name: "european-union")
    /// Image `icons8-forward-button-50`.
    static let icons8ForwardButton50 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icons8-forward-button-50")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "european-union", bundle: ..., traitCollection: ...)`
    static func europeanUnion(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.europeanUnion, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "icons8-forward-button-50", bundle: ..., traitCollection: ...)`
    static func icons8ForwardButton50(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icons8ForwardButton50, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = true

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "CurrencyList"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 2 nibs.
  struct nib {
    /// Nib `CurrencyDetailTableViewCell`.
    static let currencyDetailTableViewCell = _R.nib._CurrencyDetailTableViewCell()
    /// Nib `CurrencyTableViewCell`.
    static let currencyTableViewCell = _R.nib._CurrencyTableViewCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "CurrencyDetailTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.currencyDetailTableViewCell) instead")
    static func currencyDetailTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.currencyDetailTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "CurrencyTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.currencyTableViewCell) instead")
    static func currencyTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.currencyTableViewCell)
    }
    #endif

    static func currencyDetailTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CurrencyDetailTableViewCell? {
      return R.nib.currencyDetailTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CurrencyDetailTableViewCell
    }

    static func currencyTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CurrencyTableViewCell? {
      return R.nib.currencyTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CurrencyTableViewCell
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 6 localization keys.
    struct localizable {
      /// Value: Error occured
      static let error_occured = Rswift.StringResource(key: "error_occured", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Exchange Rates
      static let app_title = Rswift.StringResource(key: "app_title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ok
      static let ok = Rswift.StringResource(key: "ok", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Server Error
      static let server_error = Rswift.StringResource(key: "server_error", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Some error occured
      static let unexpected_error = Rswift.StringResource(key: "unexpected_error", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: There is no internet connection
      static let no_internet_connection = Rswift.StringResource(key: "no_internet_connection", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Error occured
      static func error_occured(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error_occured", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "error_occured"
        }

        return NSLocalizedString("error_occured", bundle: bundle, comment: "")
      }

      /// Value: Exchange Rates
      static func app_title(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("app_title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "app_title"
        }

        return NSLocalizedString("app_title", bundle: bundle, comment: "")
      }

      /// Value: Ok
      static func ok(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("ok", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "ok"
        }

        return NSLocalizedString("ok", bundle: bundle, comment: "")
      }

      /// Value: Server Error
      static func server_error(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("server_error", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "server_error"
        }

        return NSLocalizedString("server_error", bundle: bundle, comment: "")
      }

      /// Value: Some error occured
      static func unexpected_error(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("unexpected_error", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "unexpected_error"
        }

        return NSLocalizedString("unexpected_error", bundle: bundle, comment: "")
      }

      /// Value: There is no internet connection
      static func no_internet_connection(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("no_internet_connection", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "no_internet_connection"
        }

        return NSLocalizedString("no_internet_connection", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try nib.validate()
    #endif
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _CurrencyTableViewCell.validate()
    }

    struct _CurrencyDetailTableViewCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "CurrencyDetailTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CurrencyDetailTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CurrencyDetailTableViewCell
      }

      fileprivate init() {}
    }

    struct _CurrencyTableViewCell: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "CurrencyTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CurrencyTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CurrencyTableViewCell
      }

      static func validate() throws {
        if UIKit.UIImage(named: "european-union", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'european-union' is used in nib 'CurrencyTableViewCell', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try baseNavigationViewController.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try currencyDetail.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try currencyList.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct baseNavigationViewController: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = BaseNavigationViewController

      let bundle = R.hostingBundle
      let name = "BaseNavigationViewController"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct currencyDetail: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = CurrencyDetailViewController

      let bundle = R.hostingBundle
      let name = "CurrencyDetail"

      static func validate() throws {
        if UIKit.UIImage(named: "icons8-forward-button-50", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icons8-forward-button-50' is used in storyboard 'CurrencyDetail', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct currencyList: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = CurrencyListViewController

      let bundle = R.hostingBundle
      let name = "CurrencyList"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
