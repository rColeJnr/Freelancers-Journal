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
    let completed: Bool
    let diff: String
    var tasks: [TaskModel]
    var client: ClientModel?
    
    init(name: String, description: String, deadline: String, priority: Bool, completed: Bool = false, diff: String, tasks: [TaskModel] = [], client: ClientModel?) {
        self.name = name
        self.description = description
        self.deadline = deadline
        self.priority = priority
        self.completed = completed
        self.diff = diff
        self.tasks = tasks
        self.client = client
    }
}
