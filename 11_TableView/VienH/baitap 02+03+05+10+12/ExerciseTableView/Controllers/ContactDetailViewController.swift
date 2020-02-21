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
    @IBOutlet private weak var contactsDetailLabel: UILabel!

    // MARK: - Properties
    var contactsDetail: String?

    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let contactDetail = contactsDetail else { return }
        contactsDetailLabel.text = contactDetail
    }
}
