//
//  CollectionViewAdapter.swift
//  MovieDB
//
//  Created by William on 21/12/19.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class CollectionViewAdapter: NSObject {
  private let collectionView: UICollectionView
  private var data: [Movie]

  init(collectionView: UICollectionView, data: [Movie]) {
    self.data = data
    self.collectionView = collectionView

    super.init()

    collectionView.delegate = self
    collectionView.dataSource = self

    collectionView.register(UINib(nibName: MovieListItemCell.reuseIdentifier(), bundle: nil),
                            forCellWithReuseIdentifier: MovieListItemCell.reuseIdentifier())
  }

  func update(with data: [Movie]) {
    self.data = data
    self.collectionView.reloadData()
  }
}

extension CollectionViewAdapter: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListItemCell.reuseIdentifier(),
                                                  for: indexPath) as! MovieListItemCell
    cell.titleLabel.text = data[indexPath.row].title
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: 200)
  }
}
