//
//  UIImageViewExtensions.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 4/5/2567 BE.
//

import Foundation
import Kingfisher

extension UIImageView {
  
  func setImage(url: String?, placeholder: UIImage? = nil, completionHandler: ((UIImage) -> Void)? = nil) {
    if let imageURL = URL(string: url ?? "") {
      setImage(imageURL: imageURL, placeholder: placeholder, completionHandler: completionHandler)
    }
  }
  
  func setImage(imageURL: URL, placeholder: UIImage? = nil, completionHandler: ((UIImage) -> Void)? = nil) {
    kf.setImage(with: imageURL, placeholder: placeholder) { result in
      switch result {
      case .success(let imageResult):
        completionHandler?(imageResult.image)
      case .failure:
        break
      }
    }
  }
  
}
