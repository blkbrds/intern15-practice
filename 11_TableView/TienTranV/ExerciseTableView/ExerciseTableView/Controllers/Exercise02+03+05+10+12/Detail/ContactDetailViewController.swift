//
//  ContactDetailViewController.swift
//  ExerciseTableView
//
//  Created by PCI0002 on 12/4/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ContactDetailViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var contactDetailLabel: UILabel!
    
    // MARK: - Properties
    var contactDetail: String?
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let contactDetail = contactDetail else { return }
        contactDetailLabel.text = contactDetail
    }
}
