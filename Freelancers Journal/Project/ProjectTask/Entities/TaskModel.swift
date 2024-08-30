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
    let price: Float?
    
    init(title: String?, name: String?, price: Float?) {
        self.title = title
        self.name = name
        self.price = price
    }
    
}
