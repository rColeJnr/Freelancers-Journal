//
//  ProjectModel.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

struct ProjectModel {
    let name: String
    let description: String
    let deadline: String
    let priority: Bool
    let diff: String
    var tasks: [TaskModel]
    
    init(name: String, description: String, deadline: String, priority: Bool, diff: String, tasks: [TaskModel] = []) {
        self.name = name
        self.description = description
        self.deadline = deadline
        self.priority = priority
        self.diff = diff
        self.tasks = tasks
    }
}
