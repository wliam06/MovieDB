//
//  MovieCarouselCell.swift
//  MovieDB
//
//  Created by William on 24/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

protocol MovieCarouselCellDelegate: class {
  func movieCarouselDidTapped(withId id: Int)
}

class MovieCarouselCell: UICollectionViewCell {
  @IBOutlet weak var movieHeaderLabel: UILabel!
  @IBOutlet weak var collectionView: UICollectionView!

  weak var delegate: MovieCarouselCellDelegate?

  private var adapter: MovieCarouselAdapter?

  var dataSource: [Movie]? {
    didSet {
      self.didSetDataSource()
    }
  }

  static func reuseIdentifier() -> String {
    return String(describing: self)
  }

  override func awakeFromNib() {
    super.awakeFromNib()

    self.collectionView.decelerationRate = .fast
  }

  private func didSetDataSource() {
    guard let dataSource = dataSource else { return }

    self.adapter = MovieCarouselAdapter(collectionView: collectionView,
                                        dataSource: dataSource,
                                        delegate: self)
  }
}
extension MovieCarouselCell: MovieCarouselDelegate {
  func movieDidTapped(_ id: Int) {
    self.delegate?.movieCarouselDidTapped(withId: id)
  }
}
