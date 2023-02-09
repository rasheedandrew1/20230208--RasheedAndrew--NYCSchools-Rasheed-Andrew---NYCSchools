//
//  NYCShool.swift
//  2022 - 10 - 27 - Rasheed Andrew - NYCSchools
//
//  Created by rasheed andrew on 2/8/23.
//

import Foundation


struct NYCSchool : Hashable,  Decodable {
    let dbn, schoolName, boro, overviewParagraph: String
    let campusName, location, phoneNumber  : String
    
    enum CodingKeys : String, CodingKey {
        case dbn = "dbn"
        case schoolName = "school_name"
        case boro = "boro"
        case overviewParagraph = "overview_paragraph"
        case campusName = "campus_name"
        case location = "location"
        case phoneNumber = "phone_number"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dbn = try container.decode(String.self, forKey: .dbn)
        self.schoolName = try container.decode(String.self, forKey: .schoolName)
        self.boro = try container.decode(String.self, forKey: .boro)
        self.overviewParagraph = try container.decode(String.self, forKey: .overviewParagraph)
        self.campusName = try container.decode(String.self, forKey: .campusName)
        self.location = try container.decode(String.self, forKey: .location)
        self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
    }
}



