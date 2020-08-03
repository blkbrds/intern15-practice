//
//  PokemonDetailViewController.swift
//  Baitapbosung
//
//  Created by ADMIN on 8/1/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit


class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: PokemonDetailViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    func configTableView() {
        let nib = UINib(nibName: "PokemonDetailTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "tableView")
        tableView.dataSource = self
        loadAPI()
    }
    
    func loadAPI() {
           print("load API")
        viewModel?.loadAPI { (done, msg) in
               if done {
                   self.tableView.reloadData()
               } else {
                   print("API Error: \(msg)")
               }
           }
       }
       private func updateUI() {
           tableView.reloadData()
       }
}
extension PokemonDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel?.section[section] {
        case .abilities:
            return viewModel?.abilities.count ?? 0
        case .moves:
            return viewModel?.moves.count ?? 0
        case .none:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableView", for: indexPath) as? PokemonDetailTableViewCell else { return UITableViewCell() }
        switch viewModel?.section[indexPath.section] {
        case .abilities:
            cell.nameLabel.text = viewModel?.abilities[indexPath.row]
        case .moves:
            cell.nameLabel.text = viewModel?.moves[indexPath.row]
        case .none:
            return cell
        }
        
        return cell 
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch viewModel?.section[section] {
        case .abilities:
            return "abilities"
        case .moves:
            return "moves"
        case .none:
            return ""
        }
    }
    
}
