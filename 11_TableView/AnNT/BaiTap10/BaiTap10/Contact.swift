//
//  Contact.swift
//  BaiTap10
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import Contacts

struct Contact {
  let name: String
  let phone: String
  let email: String
  let image: Data?

  init(contact: CNContact) {
    self.name = contact.namePrefix + contact.nameSuffix + contact.givenName
    self.email = (contact.emailAddresses.first?.value as String?) ?? "" 
    self.phone = (contact.phoneNumbers.first?.value.stringValue) ?? ""
    self.image = contact.imageData
  }
}
