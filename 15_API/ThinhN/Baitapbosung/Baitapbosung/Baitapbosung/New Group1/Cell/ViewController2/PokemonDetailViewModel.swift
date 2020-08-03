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
class PokemonDetailViewModel {
    var url: String
    var abilities: [String] = []
    var moves: [String] = []
    var section: [Section] = [.abilities, .moves]
    var status = Section.abilities
    
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
                            guard let ability = item["ability"] as? JSON, let name = ability["name"] as? String else {return}
                            self.abilities.append(name)
                            print(self.abilities)
                        }
                        for item in moves {
                            guard let move = item["move"] as? JSON, let name = move["name"] as? String else { return }
                            self.moves.append(name)
                            print(self.moves)
                            
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
    func numberOfRowsInSection() -> Int {
        switch status {
        case .abilities:
            return abilities.count
        case .moves:
            return moves.count
        }
    }
   
}
