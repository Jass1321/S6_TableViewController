//
//  AnimeViewModel.swift
//  S6_TableViewController
//
//  Created by MAC06 on 2/11/21.
//

import Foundation

class AnimeViewModel {

    let urlAPI: String = "https://api.jikan.moe/v3/search/anime?q=naruto"

    var refeshData = {
        () -> () in
    }

    var dataArrayAnimes: [Results] = [] {
        didSet {
            refeshData()
        }
    }

    func getAnime() {
        guard let url = URL(string: urlAPI) else { return }

        URLSession.shared.dataTask(with: url) {
            (data, response, error) in

            guard let dataJSON = data else { return }

            do {
                let decoder = JSONDecoder()

                let animes = try decoder.decode(Animes.self, from: dataJSON)

                self.dataArrayAnimes = animes.results

            } catch let error as NSError {
                print(error.localizedDescription)
            }

        }.resume()
    }

}
