//
//  SceneDelegate.swift
//  RxSwiftPractice
//
//  Created by pineone on 2022/09/27.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        
        let mainNavigationController = UINavigationController(rootViewController: MainViewController())
        
        self.window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
    }
}

