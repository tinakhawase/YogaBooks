//
//  Subject.swift
//  YogaBooks
//
//  Created by Deepashri Khawase on 18.11.18.
//  Copyright © 2018 Deep Yoga. All rights reserved.
//

import Foundation

class Subject : Codable {
    var subjectType: String
    var name : String
    var key : String
    var ebookCount : Int

    init(subjectType: String, name: String, key : String, ebookCount : Int) {
        self.subjectType = subjectType
        self.name = name
        self.key = key
        self.ebookCount = ebookCount
    }
    enum CodingKeys: String, CodingKey {
        case subjectType = "subject_type"
        case name = "name"
        case key = "key"
        case ebookCount = "ebook_count"        
    }
}
