//
//  HomeViewController.swift
//  BaiTap04
//
//  Created by An Nguyễn on 1/3/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var resultTextView: UITextView!
  let defaultSearch = """
                    Hòa Bình
                    Sơn La
                    Điện Biên
                    Lai Châu
                    Lào Cai
                    Yên Bái
                    Phú Thọ
                    Hà Giang
                    Tuyên Quang
                    Cao Bằng
                    Bắc Cạn
                    Thái Nguyên
                    Lạng Sơn
                    Bắc Giang
                    Quảng Ninh
                    Hà Nội
                    Bắc Ninh
                    Hà Nam
                    Hải Dương
                    Hải Phòng
                    Hưng Yên
                    Nam Định
                    Thái Bình
                    Vĩnh Phúc
                    Ninh Bình
                    Thanh Hóa
                    """
  var arrayResult: [String] = []
  var arrayData: [String] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    getData()
  }

  @IBAction func searchTextField(_ sender: Any) {
    searchText(text: searchTextField.text ?? "")
  }

  private func getData() {
    arrayData = defaultSearch.split(separator: "\n").map({ String($0) })
    print(arrayData)
  }

  private func searchText(text: String) {
    arrayResult = text == "" ? arrayData: arrayData.filter({ $0.lowercased().hasPrefix(text.lowercased()) })
    showResult()
  }
  
  @IBAction func cancelButton(_ sender: Any) {
    arrayResult = arrayData
    showResult()
  }
  
  private func showResult(){
    let resultString = arrayResult.joined(separator: "\n")
    resultTextView.text = resultString
    searchTextField.text = ""
  }
}
