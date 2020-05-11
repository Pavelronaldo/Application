//
//  CatsStats.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import Foundation

struct CatsStats:Decodable {
    let name: String
    let description: String
    let origin: String
    let life_span: String
    let temperament: String
}
