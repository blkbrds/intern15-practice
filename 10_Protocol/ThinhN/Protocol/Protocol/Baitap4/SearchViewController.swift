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
    var listFiller: [String] = []
    
    var text: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configSearchBar()
        timer = Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(testFunc), userInfo: nil, repeats: true )
        searchView.delegate = self
    }
    
    var i = 0
    var str: String = ""
    var timer = Timer()
    
    @objc func testFunc() {
        
        str += " - \(listLocation[i])\n"
        locationTextView.text = str
        if i == listLocation.count - 1 {
            timer.invalidate()
        }
        i += 1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func configSearchBar() {
        searchView.delegate = self
    }
    func search(keyword: String) {
        listLocation = getContacts(keyword: keyword)
    }
    func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: "")) == ""{
            return listLocation
        } else {
            var data: [String] = []
            for contact in listLocation {
                if let _ = contact.range(of: keyword) {
                    data.append(contact)
                }
            }
            return data
        }
    }
    
    
}
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyWord = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyWord)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
    }
//    func searchBar(searchView: UISearchBar, textDidChange searchText: String) {
//        print("searchText \(searchText)")
//        for item in listLocation {
//            if searchView.text == item {
//                locationTextView.inputView = searchView
//                testFunc()
//            } else {
//                print("àbb")
//            }
//        }
        //   func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //       print("searchText \(searchBar.text)")
        //   }
        
    }

//extension SearchViewController: UISearchBarDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if listLocation.contains(string) {
//            text *= 10
//            text += Int(string)!
//        } else if string == "" {
//            text /= 10
//        }
//
//        guard text > 0 else {
//            textField.text = ""
//            return false
//        }
//        func showLocation() {
//            for item in listLocation {
//
//            }
//        }

//        let digitsAfterDecimal = formatter.maximumFractionDigits
//        var value = Double(text)
//        for _ in 0..<digitsAfterDecimal {
//            value /= 10
//        }
//        textField.text = formatter.string(from: NSNumber(value: value))! + suffix
//
//        return false
//    }
//}
//extension SearchViewController: UITextViewDelegate {
//    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
//        <#code#>
//    }
//}
