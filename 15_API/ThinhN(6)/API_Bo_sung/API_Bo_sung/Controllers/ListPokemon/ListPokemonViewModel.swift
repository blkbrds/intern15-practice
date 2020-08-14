//
//  ListPokemonViewModel.swift
//  API_Bo_sung
//
//  Created by ADMIN on 8/14/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit

typealias Completion = (Bool, String) ->Void

class ListPokemonViewModel {
    var namePokemons: [String] = []
    var urlnamePokemon: [String] = []
    
    func loadAPINamePokemon(completion: @escaping Completion) {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=100&offset=200"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error ) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        guard let results = json["results"] as? [JSON] else { return }
                        for item in results {
                            guard let name = item["name"] as? String, let url = item["url"] as? String else { return }
                            self.namePokemons.append(name)
                            self.urlnamePokemon.append(url)
                        }
                        completion(true, "")
                    } else {
                        completion(false, "Data format is error ")
                    }
                }
            }
        }
        task.resume()
        print("done")
    }
    
    func didSelectRowAt(indexPath: IndexPath) -> PokemonDetailViewModel {
        let item = urlnamePokemon[indexPath.row]
        let viewModel = PokemonDetailViewModel(url: item)
        return viewModel
    }
}
