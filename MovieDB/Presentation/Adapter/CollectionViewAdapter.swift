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

  func movieListEndOfStream(page: Int)
}

class CollectionViewAdapter: NSObject {
  private let collectionView: UICollectionView

  private var data: [Movie]
  private var totalPage: Int = 0
  private var endOfStream = false
  private var page: Int? = 1

  weak var delegate: CollectionAdapterDelegate?

  init(collectionView: UICollectionView, delegate: CollectionAdapterDelegate?, data: [Movie]) {
    self.collectionView = collectionView
    self.delegate = delegate
    self.data = data

    super.init()

    collectionView.delegate = self
    collectionView.dataSource = self

    collectionView.register(UINib(nibName: MovieItemCell.reuseIdentifier(), bundle: nil),
                            forCellWithReuseIdentifier: MovieItemCell.reuseIdentifier())
  }

  /// Update movie data
  func update(with data: [Movie], totalPage: Int) {
    self.data = data
    self.totalPage = totalPage

    self.endOfStream = data.isEmpty
    self.collectionView.reloadData()
  }

  /// Append existing data
  func append(with data: Movie, totalPage: Int) {
    self.data.append(data)
    self.totalPage = totalPage

    self.collectionView.reloadData()
  }
}

extension CollectionViewAdapter: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieItemCell.reuseIdentifier(),
                                                  for: indexPath) as! MovieItemCell
    cell.imageURL = data[indexPath.row].posterPath
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let id = data[indexPath.row].id
    self.delegate?.movieDidTapped(withId: id)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return MovieItemCell.cellSize(width: collectionView.frame.size.width)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard data.isEmpty == false else { return }

    let percentedScroll = (scrollView.contentOffset.y + UIScreen.main.bounds.height) / scrollView.contentSize.height

    if var cursor = self.page, cursor <= self.totalPage,
      endOfStream == false && percentedScroll > 0.8 {
      // Delegation request load more
      delegate?.movieListEndOfStream(page: cursor)
    }

  }
}
