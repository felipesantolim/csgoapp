//
//  GenericRequestError.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation
import UIKit

public enum GenericRequestError: String, Error {
    case invalidJSON = "Invalid JSON Data"
    case invalidBundle = "Invalid main Bundle"
    case invalidData = "Invalid JSON String to JSON Data"
    case invalidDict = "Invalid JSON Data to JSON dictionary"
}
