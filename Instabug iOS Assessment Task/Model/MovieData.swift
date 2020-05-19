//
//  My Movie.swift
//  Instabug iOS Assessment Task
//
//  Created by MAK on 5/18/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation

struct MovieData: Codable {
    var poster_path: String? 
    var title: String
    var overview: String
    var release_date: String
}
