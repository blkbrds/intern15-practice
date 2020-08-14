//
//  ListPokemonViewController.swift
//  API_Bo_sung
//
//  Created by ADMIN on 8/14/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class ListPokemonViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ListPokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadAPI()
        title = "List Pokemon"
    }
    
    func configTableView() {
        let nib = UINib(nibName: "ListPokemonTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "tableView")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadAPI() {
        viewModel.loadAPINamePokemon { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API Error: \(msg)")
            }
        }
    }
    func updateUI() {
        tableView.reloadData()
    }
    
}
extension ListPokemonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.namePokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableView", for: indexPath) as? ListPokemonTableViewCell else { return UITableViewCell()}
        cell.namePokemonLabel.text = viewModel.namePokemons[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PokemonDetailViewController()
        vc.title = viewModel.namePokemons[indexPath.row]
        vc.viewModel = viewModel.didSelectRowAt(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
