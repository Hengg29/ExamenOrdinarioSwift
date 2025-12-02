//
//  DemonSlayer.swift
//  OrdinarioExamen
//
//  Created by Alexander Hernandez Henggeler on 01/12/25.
//

import Foundation


struct Response: Codable {
    let pagination: pagination
    let content: [DemonSlayer]
}
struct pagination: Codable {
    let totalElements: Int
    let elementsOnPage: Int
    let currentPage: Int
    let totalPages: Int
    let previousPage: String?
    let nextPage: String?
}

struct DemonSlayer: Codable, Identifiable {
    let id : Int
    let name: String
    let age: Int?
    let race : String
    let description : String
    let gender: String
    let img: String
    let affiliation_id: Int
    let arc_id: Int
    let quote: String
}
