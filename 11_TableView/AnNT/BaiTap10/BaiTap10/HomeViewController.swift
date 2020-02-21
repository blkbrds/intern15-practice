//
//  HomeViewController.swift
//  BaiTap10
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var contactsTableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupData()
  }
  
  private func setupData(){
    DispatchQueue.global().async {
      ContactManager.shared.getContacts()
      DispatchQueue.main.async {
        self.contactsTableView.reloadData()
      }
    }
  }

  private func setupUI() {
    title = "Contacts"
    loadNibCell()
  }

  private func loadNibCell() {
    let nib = UINib(nibName: "ContactCell", bundle: .main)
    contactsTableView.register(nib, forCellReuseIdentifier: "contactCell")
  }
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("\(indexPath.row)")
  }
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ContactManager.shared.contacts.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = contactsTableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
    let contact = ContactManager.shared.contacts[indexPath.row]
    cell.imageView?.image = UIImage(data: contact.image ?? Data())
    cell.nameLabel.text = contact.name
    cell.phoneLabel.text = contact.phone
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return ContactManager.shared.contacts.map({ $0.name.first?.uppercased() ?? "" })
  }
}
