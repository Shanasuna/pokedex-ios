//
//  BaseViewController.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import ProgressHUD
import MobileCoreServices
import AVFoundation

protocol BaseDisplayLogic: AnyObject {
  func displayLoadingHUD()
  func dismissLoadingHUD()
  func displayError(title: String?, message: String?, okHandler: (() -> Void)?)
  func displayError(error: Error, handler: (() -> Void)?)
}

class BaseViewController: UIViewController {
  
  // MARK: - Static Properties
  
  // MARK: - IBOutlet Properties
  
  // MARK: - Properties
  
  // MARK: - Lifecycle
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  // MARK: - Functions
  
  
  // MARK: - Actions
  @IBAction func dismissOrPopAction(_ sender: UIButton) {
    dismissOrPop()
  }
  
}

// MARK: - Display Logic
extension BaseViewController: BaseDisplayLogic {
  
  func displayLoadingHUD() {
    ProgressHUD.animate()
  }
  
  func dismissLoadingHUD() {
    ProgressHUD.remove()
  }
  
  func displayError(title: String?, message: String?, okHandler: (() -> Void)?) {
    dismissLoadingHUD()
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
      okHandler?()
    }))
    
    if let navigationController = self.navigationController {
      navigationController.present(alert, animated: true, completion: nil)
    } else {
      present(alert, animated: true, completion: nil)
    }
  }
  
  func displayError(error: Error, handler: (() -> Void)?) {
    displayError(title: nil, message: error.localizedDescription, okHandler: handler)
  }
  
}

extension BaseViewController: UINavigationControllerDelegate {
  
}
