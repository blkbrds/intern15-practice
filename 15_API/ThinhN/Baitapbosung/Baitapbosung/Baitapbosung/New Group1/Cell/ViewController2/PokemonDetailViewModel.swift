//
//  PokemonDetailViewModel.swift
//  Baitapbosung
//
//  Created by ADMIN on 8/1/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import Foundation
import UIKit


enum Section {
    case abilities
    case moves
}
enum URLSection {
    case urlAbilities
    case urlMoves
}
class PokemonDetailViewModel {
    var url: String
    var abilities: [String] = []
    var moves: [String] = []
    var section: [Section] = [.abilities, .moves]
    var urlAbilities: [String] = []
    var urlMoves: [String] = []
    var urlSection: [URLSection] = [.urlAbilities, .urlMoves]
    
    init(url: String ) {
        self.url = url
    }
    func loadAPI(completion: @escaping Completion) {
        let urlString = url
        let url1 = URL(string: urlString)
        var request = URLRequest(url: url1!)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) {(data, response, error ) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        guard let abilities = json["abilities"] as? [JSON], let moves = json["moves"] as? [JSON] else { return }
                        for item in abilities {
                            guard let ability = item["ability"] as? JSON, let name = ability["name"] as? String, let url = ability["url"] as? String else {return}
                            self.abilities.append(name)
                            self.urlAbilities.append(url)
                        }
                        for item in moves {
                            guard let move = item["move"] as? JSON, let name = move["name"] as? String, let url = move["url"] as? String else { return }
                            self.moves.append(name)
                            self.urlMoves.append(url)
                        }
                        completion(true, "")
                    } else {
                        completion(false, "Data...")
                    }
                }
            }
        }
        task.resume()
        print("done")
    }
    func didSelectRowAt(indexPath: IndexPath) -> AbilityDetailViewModel {
        let item = urlAbilities[indexPath.row]
        let viewModel = AbilityDetailViewModel(url: item)
        return viewModel
    }
    func didSelectRowAt1(indexPath: IndexPath) -> MoveDetailViewModel {
        let item = url
        let viewModel = MoveDetailViewModel(url: item)
        return viewModel
    }
}
