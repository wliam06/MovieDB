//
//  MovieItemCell.swift
//  MovieDB
//
//  Created by William on 24/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MovieItemCell: UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!

  var imageURL: String? {
    didSet {
      guard let imageURL = imageURL else { return }
      let url = URL(string: imageURL)
      imageView.loadImageWithURL(url: url)
    }
  }

  static func reuseIdentifier() -> String {
    return String(describing: self)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
      // Initialization code
  }

}
