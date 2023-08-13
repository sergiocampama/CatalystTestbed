import AppKit
import Combine
import Foundation

class TestbedMacOSImplementation: NSObject, TestbedMacOS {
  private var cancelBag = Set<AnyCancellable>()

  required override init() {
    super.init()

    NotificationCenter
      .default
      .publisher(for: .init("NSWindowDidBecomeKeyNotification"))
      .sink { [unowned self] _ in
        updateWindows()
      }
      .store(in: &cancelBag)
  }

  func updateWindows() {
    for window in NSApplication.shared.windows {
      guard window.toolbar?.identifier != "TestbedMacOS" else {
        continue
      }

      let toolbar = NSToolbar(identifier: "TestbedMacOS")
      toolbar.showsBaselineSeparator = false
      window.titlebarAppearsTransparent = true
      window.toolbarStyle = .unified
      window.titleVisibility = .hidden
      window.toolbar = toolbar
    }
  }
}
