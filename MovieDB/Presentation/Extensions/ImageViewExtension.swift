//
//  ImageViewExtension.swift
//  MovieDB
//
//  Created by William on 24/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

extension UIImageView {
  func loadImageWithURL(url: URL?) {
    guard let url = url else { return }

    URLSession.shared.dataTask(with: url) { (data, _, _) in
      guard let data = data else { return }

      let image = UIImage(data: data)

      DispatchQueue.main.async {
        self.image = image
      }
    }.resume()
  }
}
