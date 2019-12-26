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
        case updateMarker(title: String, snippet: String)
    }

    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var snippetTextField: UITextField!
    weak var delegate: DetailMarkerViewControllerDelegate?
    var snippetLabel: String?
    var titleLable: String?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configUI()
    }

    override func setupUI() {
        super.setupUI()
        configNavigation()
    }

    func configUI() {
        guard let snippetLabel = snippetLabel, let titleLable = titleLable else { return }
        titleTextField.text = titleLable
        snippetTextField.text = snippetLabel
    }

    private func configNavigation() {
        let backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backToViewController))
        navigationItem.backBarButtonItem = backBarButtonItem
    }

    @objc private func backToViewController() {
        print("aaaa")
        guard let titleTex = titleTextField.text, let snippetText = snippetTextField.text else { return }
        delegate?.viewController(viewController: self, needPerfrom: .updateMarker(title: titleTex, snippet: snippetText))
        popViewController()
    }
}
