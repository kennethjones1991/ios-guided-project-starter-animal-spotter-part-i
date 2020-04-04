//
//  APIController.swift
//  AnimalSpotter
//
//  Created by Scott Gardner on 4/4/20.
//  Copyright © 2020 Scott Gardner. All rights reserved.
//

import Foundation
import UIKit

final class APIController {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    private let baseURL = URL(string: "https://lambdaanimalspotter.vapor.cloud")!
    private lazy var peopleURL = URL(string: "/api", relativeTo: baseURL)!
}
