//
//  ClientModel.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

struct ClientModel {
    let name: String
    let description: String
    let number: String
    let email: String
    let regular: Bool
    
    init(name: String, description: String, number: String, email: String, regular: Bool) {
        self.name = name
        self.description = description
        self.number = number
        self.email = email
        self.regular = regular
    }
}
