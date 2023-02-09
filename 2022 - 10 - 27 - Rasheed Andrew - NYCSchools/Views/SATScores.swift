//
//  NYCSchool.swift
//  2022 - 10 - 27 - Rasheed Andrew - NYCSchools
//
//  Created by rasheed andrew on 2/8/23.
//

import Foundation

struct SATScore : Hashable, Decodable {
    let dbn, schoolName, numOfSatTestTakers, satCriticalReadingAvgScore: String
    let satMathAvgScore, satWritingAvgScore: String
    
    enum CodingKeys : String, CodingKey {
        case dbn = "dbn"
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dbn = try container.decode(String.self, forKey: .dbn)
        self.schoolName = try container.decode(String.self, forKey: .schoolName)
        self.numOfSatTestTakers = try container.decode(String.self, forKey: .numOfSatTestTakers)
        self.satCriticalReadingAvgScore = try container.decode(String.self, forKey: .satCriticalReadingAvgScore)
        self.satMathAvgScore = try container.decode(String.self, forKey: .satMathAvgScore)
        self.satWritingAvgScore = try container.decode(String.self, forKey: .satWritingAvgScore)
    }
}
