//
//  ErrorResponse.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 20/11/24.
//

import Foundation

struct ErrorResponse: Decodable {
    let status: String
    let messages: String
}
