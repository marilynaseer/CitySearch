//
//  SearchResult.swift
//  CitySearch
//
//  Created by marilyn A on 6/5/21.
//

import Foundation

struct SearchResult: Codable, Hashable {
    var geonames: [City]
}
