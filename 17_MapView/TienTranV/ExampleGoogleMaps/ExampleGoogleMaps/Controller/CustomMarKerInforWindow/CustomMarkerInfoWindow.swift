//
//  CustomMarkerInfoWindow.swift
//  ExampleGoogleMaps
//
//  Created by PCI0002 on 12/25/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol CustomMarkerInfoWindowDelegate: class {
    func customView(customView: CustomMarkerInfoWindow, needPerform action: CustomMarkerInfoWindow.Action)
}

final class CustomMarkerInfoWindow: UIView {

    enum Action {
        case pushToDetail
    }

    typealias GetDataInfor = () -> (titleText: String, snippetText: String)

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var snippetLabel: UILabel!

    weak var delegate: CustomMarkerInfoWindowDelegate?
    
    func configUI(getDataInfor: GetDataInfor) {
        let data = getDataInfor()
        titleLabel.text = data.titleText
        snippetLabel.text = data.snippetText
    }

    @IBAction private func detailButtonTouchUpInSide(_ sender: Any) {
        print("detailButtonTouchUpInSide")
        delegate?.customView(customView: self, needPerform: .pushToDetail)
    }
}
