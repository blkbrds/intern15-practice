//
//  ListPokemonTableViewCell.swift
//  Baitapbosung
//
//  Created by ADMIN on 8/1/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

protocol ListPokemonTableViewCellDelegate: class {
    func tapButton(tableViewCell: ListPokemonTableViewCell)
}

class ListPokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var namePokemonLabel: UILabel!
    weak var delegate: ListPokemonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func moveButtonTouchUpInside(_ sender: Any) {
        delegate?.tapButton(tableViewCell: self)
    }
    
}
