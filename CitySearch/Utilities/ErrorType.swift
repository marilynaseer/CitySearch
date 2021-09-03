//
//  ErrorType.swift
//  CitySearch
//
//  Created by marilyn A on 6/5/21.
//

import Foundation

enum ErrorType: String, Error {
    
    case invalidURL = "The URL entered is invalid. Please check it out and try again."
    case unableToComplete = "Unable to complete your request. PLease check your internet connection."
    case invalidResponse = "The response received from the server is invalid. Please try again."
    case invalidData = "The data received from the server is invalid. Please try again."
}
