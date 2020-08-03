//
//  ViewExtension.swift
//  MovieDB
//
//  Created by William on 03/08/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

extension UIView {
  @inline(__always) static func build<T>(applyAttributes: ((T) -> Void)? = nil) -> T where T: UIView {
    let uiComponent = T(frame: .zero)
    uiComponent.translatesAutoresizingMaskIntoConstraints = false
    applyAttributes?(uiComponent)
    return uiComponent
  }
}
