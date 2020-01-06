//
//  HomeViewController.swift
//  BaiTap11
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var myTableView: UITableView!
  
  let texts = [
    "US drone strike against top Iranian commander threatens spiral of violence in Middle East",
    "The Pentagon announced the US had carried out the attack near Baghdad airport, describing it as \"decisive defensive action to protect US personnel abroad.\" In a statement late Thursday, the Pentagon asserted that \"General Soleimani was actively developing plans to attack American diplomats and service members in Iraq and throughout the region.\" It said Soleimani \"had orchestrated attacks on coalition bases in Iraq over the last several months.\"",
    "The code below shows four examples of these special characters. The wiseWords constant contains two escaped double quotation marks. The dollarSign, blackHeart, and sparklingHeart constants demonstrate the Unicode scalar format:",
    "The code below shows four examples of these special characters. The wiseWords constant contains two escaped double quotation marks."
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI(){
    let nib = UINib(nibName: "MyTableViewCell", bundle: .main)
    myTableView.register(nib, forCellReuseIdentifier: "myCell")
  }
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return texts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyTableViewCell
    cell.texttLabel.text = texts[indexPath.row]
    return cell
  }
}
