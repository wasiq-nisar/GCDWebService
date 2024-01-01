//
//  AppDelegate.swift
//  LocalTransfer
//
//  Created by Muhammad Wasiq  on 29/12/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var webServer: GCDWebServer!
    var window: UIWindow?
    var webUploader: GCDWebUploader?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Obtaining the Location of the Documents Directory
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        print(documentsPath)
        webUploader = GCDWebUploader(uploadDirectory: documentsPath)
//        webUploader?.allowedFileExtensions = [".png", ".jpg", "jpeg", ".gif", ".jfif", ".pjpeg", ".pjp", ".svg"]
        webUploader?.start()
        if let serverURL = webUploader?.serverURL {
            print("Visit \(serverURL) in your web browser")
        } else {
            print("Web uploader server URL is nil.")
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

