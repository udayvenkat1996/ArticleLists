//
//  ListModel.swift
//  TestExample45
//
//  Created by Uday Venkat on 13/06/24.
//

import Foundation

struct ListModel: Codable {
    let status: String
    let copyright: String
    var response: Docs
}

struct Docs: Codable {
    var docs: [Doc]
}
  
struct Doc: Codable {
    let multimedia: [Multimedia]
    let headline: Headline
    let abstract: String
    let pub_date: String
}
struct Multimedia: Codable {
    let url: String
}
struct Headline: Codable {
    let main: String
}
