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
    let pageWidth: CGFloat = (120 + 8) * 2
    let test = Int(floor((scrollView.contentOffset.x - CGFloat(pageWidth / 2)) / pageWidth)) + 1

    currentPage = test
  }

  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let pageWidth: CGFloat = (120 + 8) * 2
    let maxPage = Int(ceil(scrollView.contentSize.width / pageWidth)) - 1
    var newPage = currentPage

    if velocity.x == 0.0 {
      newPage = Int(floor((targetContentOffset.pointee.x - pageWidth / 2) / pageWidth)) + 1
    } else {
      newPage = velocity.x > 0.0 ? currentPage + 1 : currentPage - 1

      if newPage < 0 {
        newPage = 0
      }

      if newPage > Int(ceil(scrollView.contentSize.width / pageWidth)) {
        newPage = Int(ceil((pageWidth + 8) / pageWidth)) - 1
      }

      if newPage == maxPage {
        targetContentOffset.pointee.x = scrollView.contentSize.width - UIScreen.main.bounds.size.width
      } else {
        targetContentOffset.pointee.x = CGFloat(newPage) * pageWidth
      }
    }
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 120, height: 170)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 8
  }
}
