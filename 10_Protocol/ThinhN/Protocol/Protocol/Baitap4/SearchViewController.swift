//
//  SearchViewController.swift
//  Protocol
//
//  Created by PCI0019 on 6/25/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var locationTextView: UITextView!
    @IBOutlet weak var searchView: UISearchBar!
    @IBOutlet weak var cancelButton: UIButton!
    
    var listLocation: [String] = ["Bắc Ninh","Hà Nam","Thành phố Hà Nội","Hải Dương","Thành phố Hải Phòng","Hưng Yên","Nam Định","Ninh Bình","Thái Bình", "Vĩnh Phúc","Hà Tĩnh","Nghệ An","Quảng Bình ","Quảng Trị","Thanh Hóa","Thừa Thiên Huế","Bình Định","Bình Thuận","Thành phố Đà Nẵng","Khánh Hòa","  Ninh Thuận","Phú Yên","Quảng Nam","Quảng Ngãi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationTextView.text = listLocation.joined(separator: "\n")
        searchView.delegate = self
        locationTextView.isEditable = false
    }
    
    @IBAction func cancelButtonTouchUpInside(_ sender: Any) {
        searchView.text = ""
        locationTextView.text = listLocation.joined(separator: "\n")
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var result: [String] = []
        for item in listLocation {
            if item.hasPrefix(searchText) {
                result.append(item)
            }
        }
        locationTextView.text = result.joined(separator: "\n")
    }
}
