//
//  MovieListItemCell.swift
//  MovieDB
//
//  Created by William on 21/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MovieListItemCell: UICollectionViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  
  static func reuseIdentifier() -> String {
    return String(describing: self)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
}
