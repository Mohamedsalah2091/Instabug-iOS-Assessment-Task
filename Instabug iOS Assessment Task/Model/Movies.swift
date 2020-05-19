//
//  Movies.swift
//  Instabug iOS Assessment Task
//
//  Created by MAK on 5/18/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation

struct Movies: Codable  {
    var page : Int
    var results = [MovieData]()
    var total_pages : Int = 0
    var total_results : Int = 0
}
