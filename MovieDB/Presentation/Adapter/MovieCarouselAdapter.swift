//
//  MovieCarouselAdapter.swift
//  MovieDB
//
//  Created by William on 24/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MovieCarouselAdapter: NSObject {
  private let collectionView: UICollectionView
  private var dataSource: [Movie]

  private var currentPage = 0

  init(collectionView: UICollectionView, dataSource: [Movie]) {
    self.collectionView = collectionView
    self.dataSource = dataSource

    super.init()

    collectionView.delegate = self
    collectionView.dataSource = self

    collectionView.register(UINib(nibName: MovieItemCell.reuseIdentifier(), bundle: nil),
                            forCellWithReuseIdentifier: MovieItemCell.reuseIdentifier())
  }
}

extension MovieCarouselAdapter: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieItemCell.reuseIdentifier(),
                                                  for: indexPath) as! MovieItemCell
    cell.imageURL = dataSource[indexPath.row].posterPath
    return cell
  }

  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    let pageWidth: CGFloat = (150 + 15) * 2

    let test = Int(floor((scrollView.contentOffset.x - CGFloat(pageWidth / 2)) / pageWidth)) + 1
    currentPage = test
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 150, height: 150)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 15
  }
}
