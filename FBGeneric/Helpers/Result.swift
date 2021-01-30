//
//  Result.swift
//  FBGeneric
//
//  Created by Flamur Beqiri on 30.1.21.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
