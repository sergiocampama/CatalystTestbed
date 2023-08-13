import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let scene = (scene as? UIWindowScene) else { return }

    let window = UIWindow(windowScene: scene)
    self.window = window

    window.rootViewController = ViewController()

    scene.sizeRestrictions?.minimumSize = CGSize(width: 400, height: 300)
    scene.sizeRestrictions?.maximumSize = CGSize(width: 800, height: 600)
    scene.titlebar?.autoHidesToolbarInFullScreen = true
    scene.sizeRestrictions?.allowsFullScreen = false

    window.makeKeyAndVisible()
  }
}

