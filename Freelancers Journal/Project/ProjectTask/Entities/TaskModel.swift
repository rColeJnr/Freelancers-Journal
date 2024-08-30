//
//  TaskModel.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

struct TaskModel {
    
    let title: String?
    let name: String?
    let price: String?
    
    init(title: String?, name: String?, price: String?) {
        self.title = title
        self.name = name
        self.price = price
    }
    
}
