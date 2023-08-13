import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  private var testbedMacOS: TestbedMacOS!

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    UserDefaults.standard.set(false, forKey: "NSQuitAlwaysKeepsWindows")

    let bundleFileName = "TestbedMacOS.bundle"
    guard let bundleURL = Bundle.main.builtInPlugInsURL?.appendingPathComponent(bundleFileName),
          let bundle = Bundle(url: bundleURL),
          let bundleClass = bundle.principalClass as? TestbedMacOS.Type
    else { fatalError("could not find testbed mac bundle") }

    testbedMacOS = bundleClass.init()

    return true
  }

  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    return UISceneConfiguration(
      name: "Default",
      sessionRole: connectingSceneSession.role
    )
  }

  override func buildMenu(with builder: UIMenuBuilder) {
    super.buildMenu(with: builder)

    builder.remove(menu: .file)
    builder.remove(menu: .edit)
    builder.remove(menu: .help)
    builder.remove(menu: .format)
  }
}

