//
//
// File: File.swift
// Project: 
//
// Created by Stephen Nutman on 09/02/2022
// Copyright © 2022 ACTYAR. All rights reserved.
//

	

import UIKit
import CoreMotion

public class LogTrigger {
    
    let window: UIWindow?
    let motionManager = CMMotionManager()
    
    public init(in window: UIWindow?) {
        
        self.window = window
        
        motionManager.startAccelerometerUpdates(to: .main) { [weak self] data, error in
            
            guard let data = data else { return }
            if data.acceleration.x < -5 {
                printLog("x accleration: \(data.acceleration.x)")
                self?.presentLog()
            }
        }
    }
    
    func presentLog() {
        
        let visible = visibleViewController(from: window?.rootViewController)
        let logViewController = LogViewController()
        visible?.present(logViewController, animated: true)
    }
    
    func visibleViewController(from viewController: UIViewController?) -> UIViewController? {
        
        if let navigationController = viewController as? UINavigationController {
            return visibleViewController(from: navigationController.topViewController)
        }
        
        if let tabBarController = viewController as? UITabBarController {
            return visibleViewController(from: tabBarController.selectedViewController)
        }
        
        if let presentedViewController = viewController?.presentedViewController {
            return visibleViewController(from: presentedViewController)
        }
        
        return viewController
    }
    
    
}
