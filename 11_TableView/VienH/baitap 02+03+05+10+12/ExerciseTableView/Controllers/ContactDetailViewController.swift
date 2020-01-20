//
//  ContactDetailViewController.swift
//  baitap 02+03+05+10+12
//
//  Created by user on 12/18/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class ContactDetailViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var contactDetailLabel: UILabel!

    // MARK: - Properties
    var contactDetail: String?

    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let contactDetail = contactDetail else { return }
        contactDetailLabel.text = contactDetail
    }
}
