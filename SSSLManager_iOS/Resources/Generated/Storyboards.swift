// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length implicit_return

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum Authentication: StoryboardType {
    internal static let storyboardName = "Authentication"

    internal static let loginViewController = SceneType<SSSLManager_iOS.LoginViewController>(storyboard: Authentication.self, identifier: "LoginViewController")

    internal static let registerViewController = SceneType<SSSLManager_iOS.RegisterViewController>(storyboard: Authentication.self, identifier: "RegisterViewController")
  }
  internal enum Events: StoryboardType {
    internal static let storyboardName = "Events"

    internal static let allEventsViewController = SceneType<SSSLManager_iOS.AllEventsViewController>(storyboard: Events.self, identifier: "AllEventsViewController")

    internal static let eventApplicantsViewController = SceneType<SSSLManager_iOS.EventApplicantsViewController>(storyboard: Events.self, identifier: "EventApplicantsViewController")

    internal static let eventDetailsViewController = SceneType<SSSLManager_iOS.EventDetailsViewController>(storyboard: Events.self, identifier: "EventDetailsViewController")

    internal static let newEventViewController = SceneType<SSSLManager_iOS.NewEventViewController>(storyboard: Events.self, identifier: "NewEventViewController")

    internal static let subEventsViewController = SceneType<SSSLManager_iOS.SubEventsViewController>(storyboard: Events.self, identifier: "SubEventsViewController")
  }
  internal enum MainScreen: StoryboardType {
    internal static let storyboardName = "MainScreen"

    internal static let mainScreenViewController = SceneType<SSSLManager_iOS.MainScreenViewController>(storyboard: MainScreen.self, identifier: "MainScreenViewController")
  }
  internal enum Profile: StoryboardType {
    internal static let storyboardName = "Profile"

    internal static let editProfileViewController = SceneType<SSSLManager_iOS.EditProfileViewController>(storyboard: Profile.self, identifier: "EditProfileViewController")

    internal static let userProfileViewController = SceneType<SSSLManager_iOS.UserProfileViewController>(storyboard: Profile.self, identifier: "UserProfileViewController")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: BundleToken.bundle)
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    return storyboard.storyboard.instantiateViewController(identifier: identifier, creator: block)
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController(creator: block) else {
      fatalError("Storyboard \(storyboard.storyboardName) does not have an initial scene.")
    }
    return controller
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
