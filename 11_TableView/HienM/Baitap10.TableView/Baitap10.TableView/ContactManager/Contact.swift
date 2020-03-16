import Contacts

final class Contact {

	var name: String?
    var avatarData: Data?
    var phoneNumber: String
    var email: String

init(contact: CNContact) {
    self.name = contact.namePrefix + contact.nameSuffix + contact.givenName
    self.email = (contact.emailAddresses.first?.value as String?) ?? ""
    self.phoneNumber = (contact.phoneNumbers.first?.value.stringValue) ?? ""
    self.avatarData = contact.imageData
  }
}
