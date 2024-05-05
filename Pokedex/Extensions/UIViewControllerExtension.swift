//
//  UIViewControllerExtension.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 4/5/2567 BE.
//

import UIKit

extension UIViewController {
  
  func pushOrPresentVC(vc: UIViewController, animated: Bool = true) {
    if navigationController == nil {
      presentVC(vc: vc, animated: animated)
    } else {
      pushVC(vc: vc, animated: animated)
    }
  }
  
  func pushVC(vc: UIViewController, animated: Bool = true) {
    if let navigation = navigationController {
      navigation.pushViewController(vc, animated: animated)
    } else if let navigation = self as? UINavigationController {
      navigation.pushViewController(vc, animated: animated)
    }
  }
  
  func presentVC(vc: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
    DispatchQueue.main.async {
      if let presentedVC = self.presentedViewController, !presentedVC.isKind(of: UIAlertController.self) {
        presentedVC.presentVC(vc: vc, animated: animated, completion: completion)
      } else {
        self.present(vc, animated: animated, completion: completion)
      }
    }
  }
  
  func dismissOrPop(animation: Bool = true, dismissHandler: (() -> Void)? = nil) {
    if let navigation = navigationController, self != navigation.viewControllers.first {
      navigation.popViewController(animated: animation)
      
      dismissHandler?()
    } else {
      dismiss(animated: animation) {
        dismissHandler?()
      }
    }
  }
  
}
