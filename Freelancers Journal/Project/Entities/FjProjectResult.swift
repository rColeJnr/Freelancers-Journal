//
//  FjProjectResult.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

enum FjProjectResult {
    case success([Project])
    case failure(FjError)
}
