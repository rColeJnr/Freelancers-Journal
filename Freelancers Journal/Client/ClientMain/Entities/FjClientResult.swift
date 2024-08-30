//
//  FjClientResult.swift
//  Freelancers Journal
//
//  Created by rColeJnr on 31/08/24.
//

import Foundation

enum FjClientResult {
    case success([Client])
    case failure(FjError)
}
