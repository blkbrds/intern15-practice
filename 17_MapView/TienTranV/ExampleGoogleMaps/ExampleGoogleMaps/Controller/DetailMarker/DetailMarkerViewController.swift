//
//  DetailMarkerViewController.swift
//  ExampleGoogleMaps
//
//  Created by PCI0002 on 12/25/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol DetailMarkerViewControllerDelegate: class {
    func viewController(viewController: DetailMarkerViewController, needPerfrom action: DetailMarkerViewController.Action)
}

final class DetailMarkerViewController: BaseViewController {

    enum Action {
        case updateMarker(title: String?, snippet: String?)
    }

    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var snippetTextField: UITextField!
    weak var delegate: DetailMarkerViewControllerDelegate?
    var snippetLabel: String?
    var titleLable: String?

    func configUI() {
        guard let snippetLabel = snippetLabel, let titleLable = titleLable else { return }
        titleTextField.text = titleLable
        snippetTextField.text = snippetLabel
    }

    override func popViewController() {
        super.popViewController()
        delegate?.viewController(viewController: self, needPerfrom: .updateMarker(title: titleTextField.text, snippet: snippetTextField.text))
    }
}
