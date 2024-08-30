//
//  FjResult.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 30/08/24.
//

import Foundation

enum FjResult {
    case success([Project])
    case failure(_ error: Error)
}
