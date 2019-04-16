//
//  Trailer.swift
//  Student500775964
//
//  Created by Wouter Kloos on 13/04/2019.
//  Copyright © 2019 HvA. All rights reserved.
//

import Foundation

struct Trailer: Codable {
    
    let id: Int
    let title: String
    let posterImage: String
    let description: String
    let stillImage: String
    let url: String
    let genre: [String]
}
