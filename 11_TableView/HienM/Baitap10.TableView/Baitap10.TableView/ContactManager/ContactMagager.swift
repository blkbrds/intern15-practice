import Foundation
import ContactsUI

class PhoneContacts {

	open var contacts: [Contact] = []

	static func share () -> PhoneContacts {
		return phoneContacts
	}

	static let phoneContacts: PhoneContacts = {
		let phoneContacts = PhoneContacts()
		return phoneContacts }()

	private init() {
		getContacts()
	}

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
