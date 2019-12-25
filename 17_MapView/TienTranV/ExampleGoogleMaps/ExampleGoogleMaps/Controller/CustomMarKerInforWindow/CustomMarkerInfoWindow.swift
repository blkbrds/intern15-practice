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

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var snippetLabel: UILabel!

    weak var delegate: CustomMarkerInfoWindowDelegate?

    override class func awakeFromNib() {
        super.awakeFromNib()
//        Bundle.main.loadNibNamed("CustomMarkerInfoWindow", owner: self, options: nil)
    }

    func configUI(title: String, snippet: String) {
        titleLabel.text = title
        snippetLabel.text = snippet
    }

    @IBAction func detailTouchUpInSide(_ sender: Any) {
        delegate?.customView(customView: self, needPerform: .pushToDetail)
    }
}
