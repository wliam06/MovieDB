//
//  CollectionViewAdapter.swift
//  MovieDB
//
//  Created by William on 21/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

protocol CollectionAdapterDelegate: class {
  func movieDidTapped(withId movieId: Int)
}

class CollectionViewAdapter: NSObject {
  private let collectionView: UICollectionView
  private var data: [Movie]
  weak var delegate: CollectionAdapterDelegate?

  var itemSection = 1

  init(collectionView: UICollectionView, delegate: CollectionAdapterDelegate?, data: [Movie]) {
    self.collectionView = collectionView
    self.delegate = delegate
    self.data = data

    super.init()

    collectionView.delegate = self
    collectionView.dataSource = self

    collectionView.register(UINib(nibName: MovieCarouselCell.reuseIdentifier(), bundle: nil),
                            forCellWithReuseIdentifier: MovieCarouselCell.reuseIdentifier())
  }

  /// Update movie data
  func update(with data: [Movie]) {
    self.data = data
    self.collectionView.reloadData()
  }

  /// Append existing data
  func append(with data: Movie) {
    self.data.append(data)

    self.collectionView.reloadData()
  }
}

extension CollectionViewAdapter: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return itemSection
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCarouselCell.reuseIdentifier(),
                                                  for: indexPath) as! MovieCarouselCell
    if itemSection == 1 {
      cell.movieHeaderLabel.text = "Now Playing"
    } else if itemSection == 2 {
      cell.movieHeaderLabel.text = "Upcoming"
    } else {
      cell.movieHeaderLabel.text = "Top Rated"
    }

    cell.dataSource = data
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: 210)
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let id = data[indexPath.row].id

    self.delegate?.movieDidTapped(withId: id)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
  }
}
