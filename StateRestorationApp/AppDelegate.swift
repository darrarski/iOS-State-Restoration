import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
        ) -> Bool {
        let viewControllerA = ViewController()
        viewControllerA.title = "A"

        let navigationControllerA = UINavigationController(rootViewController: viewControllerA)
        navigationControllerA.restorationIdentifier = "Navigation"

        let viewControllerB = ViewController()
        viewControllerB.title = "B"

        let navigationControllerB = UINavigationController(rootViewController: viewControllerB)
        navigationControllerB.restorationIdentifier = "Navigation"

        let tabBarController = UITabBarController()
        tabBarController.restorationIdentifier = "MainTabBar"
        tabBarController.viewControllers = [navigationControllerA, navigationControllerB]

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.restorationIdentifier = "MainWindow"
        window?.rootViewController = tabBarController

        return true
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.makeKeyAndVisible()
        return true
    }

    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }

    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }

}
