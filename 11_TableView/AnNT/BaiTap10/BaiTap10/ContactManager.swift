//
//  ContactManager.swift
//  BaiTap10
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import Contacts

class ContactManager {
  open var contacts: [Contact] = []
  static let shared: ContactManager = ContactManager()

  private init() { }

  func getContacts() {
    let contactStore = CNContactStore()
    let keyToFetchs = [CNContactGivenNameKey, CNContactEmailAddressesKey, CNContactImageDataKey, CNContactPhoneNumbersKey, CNContactNamePrefixKey, CNContactNameSuffixKey, CNContactThumbnailImageDataKey]
    do {
      let allContainer = try contactStore.containers(matching: nil)
      allContainer.forEach({ container in
        do {
          let predicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
          let contacts = try contactStore.unifiedContacts(matching: predicate, keysToFetch: keyToFetchs as [CNKeyDescriptor])
          return contacts.forEach({
            let contact = Contact(contact: $0)
            self.contacts.append(contact)
          })
        } catch {
          print(error.localizedDescription)
        }
      })
    } catch {
      print(error.localizedDescription)
    }
  }
}
