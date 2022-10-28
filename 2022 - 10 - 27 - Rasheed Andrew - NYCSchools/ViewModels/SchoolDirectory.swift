//
//  SchoolDirectory.swift
//  2022 - 10 - 27 - Rasheed Andrew - NYCSchools
//
//  Created by rasheed andrew on 10/27/22.
//

import Foundation
import SwiftUI


struct NYCSchool : Identifiable, Codable {
    let id = UUID()
    let dbn : String
    let school_name : String
    let campus_name : String
    let location : String
    let phone_number : String
    let fax_number : String
    let school_email : String
    let website : String
    let city : String
    let zip : String
    
}



struct SATScore : Identifiable, Codable {
    let id = UUID()
    let school_name : String
    let num_of_sat_test_takers : String
    let sat_critical_reading_avg_score : String
    let sat_math_avg_score : String
    let sat_writing_avg_score : String
    
}



struct Constants {
    // the url works when it's filtered by a specific dbn
    static let highSchoolsURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?dbn=02M438"
    
    // for some reason this url doesnt seem to work
    static let highSchoolsURL2 = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
   
     // both URL for the sat scores work as expected
    static let schoolWithSATScoreURL = "https://data.cityofnewyork.us/resource/734v-jeq5.json"
    static let schoolWithSATScoreURL2 = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=02M438"
}

class SchoolDirectory : ObservableObject {
    @Published var nycschools : [NYCSchool] = []
    @Published var satscores : [SATScore] = []
    
    init() {
//       fetchData()
//       fetchScoresData()
        fetch()
        fetchScores()
    }
    
    
    
    func fetch() {
        guard let url = URL(string: Constants.highSchoolsURL) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            // convert to JSON
            do {
                let nycschools = try JSONDecoder().decode([NYCSchool].self, from: data)
                DispatchQueue.main.async {
                   self?.nycschools = nycschools
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()

    }
    
    func fetchScores() {
        guard let url = URL(string: Constants.schoolWithSATScoreURL2) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            // convert to JSON
            do {
                let satscores = try JSONDecoder().decode([SATScore].self, from: data)
                DispatchQueue.main.async {
                    self?.satscores = satscores
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()

    }
    
    
//    func fetchData() {
//        guard let url = URL(string: Constants.highSchoolsURL) else { return }
//        downloadData(fromURL: url) { (returnedData) in
//            if let data = returnedData {
//                guard let newScoreDatas = try? JSONDecoder().decode([NYCSchool].self, from: data) else { return }
//                 DispatchQueue.main.async { [weak self] in
//                     self?.nycschools = newScoreDatas
//                 }
//            } else {
//                print("no data returned")
//            }
//        }
//    }
//
//
//
//    func fetchScoresData() {
//        guard let url = URL(string: Constants.schoolWithSATScoreURL) else { return }
//        downloadData(fromURL: url) { (returnedData) in
//            if let data = returnedData {
//                guard let newScoreDatas = try? JSONDecoder().decode([SATScore].self, from: data) else { return }
//                 DispatchQueue.main.async { [weak self] in
//                     self?.satscores = newScoreDatas
//                 }
//            } else {
//                print("no data returned")
//            }
//        }
//    }
//
//
//
//
//    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data : Data?) -> ()) {
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data,
//            error == nil,
//            let response = response as? HTTPURLResponse,
//            response.statusCode >= 200 && response.statusCode < 300
//            else {
//                print("ERROR downloading data.")
//                completionHandler(nil)
//                return
//            }
//            completionHandler(data)
//
//
//
//        }.resume()
//
//    }
    
}




































//    let primary_address_line_1 : String
//    let borough : String
//    let building_code : String
//    let boro : String
//    let overview_paragraph : String
//    let school_10th_seats : Int
//    let academicopportunities1 : String
//    let academicopportunities2 : String
//    let academicopportunities3 : String
//    let academicopportunities4 : String
//    let academicopportunities5 : String
//    let ell_programs : String
//    let language_classes : String
//    let diplomaendorsements : String
//    let neighborhood : String
//    let shared_space : String
//    let subway : String
//    let bus : String
//    let grades2018 : String
//    let finalgrades : String
//    let total_students: Int
//    let start_time : String
//    let end_time : String
//    let addtl_info1 : String
//    let extracurricular_activities : String
//    let psal_sports_boys : String
//    let psal_sports_girls : String
//    let school_sports : String
//    let graduation_rate : Int
//    let attendance_rate : Int
//    let pct_stu_enough_variety : Int
//    let college_career_rate : Int
//    let pct_stu_safe : Int
//    let pbat : Int
//    let international : Int
//    let school_accessibility_description : Int
//    let program1 : String
//    let code1 : String
//    let interest1: String
//    let method1 : String
//    let seats9ge1 : String
//    let grade9gefilledflag1 : String
//    let grade9geapplicants1 : String
//    let seats9swd1 : String
//    let grade9swdfilledflag1 : String
//    let grade9swdapplicants1 : String
//    let seats101 : String
//    let eligibility1 : String
//    let grade9geapplicantsperseat1 : String
//    let grade9swdapplicantsperseat1 : String
//    let state_code : String
//    let latitude : Int
//    let longitude : Int
//    let community_board : Int
//    let council_district : Int
//    let census_tract : Int
//    let bin : Int
//    let bbl : Int
//    let nta : String
