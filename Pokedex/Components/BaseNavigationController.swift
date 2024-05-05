//
//  BaseNavigationController.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//

import UIKit
import SnapKit

class BaseNavigationController: UINavigationController {
  
  let lineView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    isNavigationBarHidden = false
    
    view.backgroundColor = R.color.bg.callAsFunction()
    navigationBar.backgroundColor = R.color.bg.callAsFunction()
    navigationBar.tintColor = R.color.text_black.callAsFunction()
    navigationBar.barTintColor = R.color.bg.callAsFunction()
    navigationBar.isTranslucent = true
    navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor: R.color.text_black.callAsFunction() ?? UIColor.black ]
    
    navigationBar.backItem?.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    
    lineView.backgroundColor = R.color.text_gray.callAsFunction()
    
    navigationBar.addSubview(lineView)
    
    lineView.snp.makeConstraints { make in
      make.height.equalTo(1)
      make.leading.trailing.bottom.equalToSuperview()
    }
  }
  
}
