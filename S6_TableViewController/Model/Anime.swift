//
//  Anime.swift
//  S6_TableViewController
//
//  Created by MAC06 on 2/11/21.
//

import Foundation

// Clase padre
class Animes: Codable {
    let request_hash: String
    let results: [Results]
}

// Items child
class Results: Codable {
    let image_url: String
    let title: String
    let synopsis: String
}
