//
//  Contact.swift
//  Contacts
//
//  Created by Michael Overman on 9/20/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import Foundation

@objcMembers class Contact: NSObject {
    let name: String
    init(contactName: String) {
        self.name = contactName
        super.init()
    }
}
