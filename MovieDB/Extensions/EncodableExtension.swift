//
//  EncodableExtension.swift
//  MovieDB
//
//  Created by William on 27/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

extension Encodable {
  func toDictionary() throws -> [String : Any]? {
    let encoded = try JSONEncoder().encode(self)
    let data = try JSONSerialization.jsonObject(with: encoded)
    return data as? [String : Any]
  }
}
