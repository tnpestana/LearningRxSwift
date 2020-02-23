//
//  Coordinator.swift
//  MVVM-C
//
//  Created by Tiago Pestana on 22/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import Foundation
import UIKit

class Coordinator: NSObject {
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.childCoordinators = []
        self.navigationController = navigationController
    }
    
    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }

    func finish() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChild(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(of: coordinator) {
            childCoordinators.remove(at: index)
        } else {
            print("Couldn't remove coordinator: \(coordinator) it's not a child coordinator.")
        }
    }

    func removeAllChildWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }

    func removeAllChild() {
        childCoordinators.removeAll()
    }
}

////MARK: Navigation Controller Delegate
//extension Coordinator: UINavigationControllerDelegate {
//    // Handle system back button taps within our coordinator
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
//            return
//        }
//        
//        if navigationController.viewControllers.contains(fromViewController) {
//            return
//        }
//        
//        if fromViewController.responds(to: Selector(("coordinator"))) {
//            if let coordinator = fromViewController.coordinator {
//                removeChild(coordinator)
//            }
//        }
//    }
//}
