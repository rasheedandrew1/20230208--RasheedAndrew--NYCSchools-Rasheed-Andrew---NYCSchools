//
//  SchoolDirectory.swift
//  2022 - 10 - 27 - Rasheed Andrew - NYCSchools
//
//  Created by rasheed andrew on 10/27/22.
//

import Foundation
import SwiftUI


class SchoolDirectory : ObservableObject {
    @Published var schoolData : [NYCSchool] = []
    @Published var satscores : [SATScore] = []
   
    
    init() {
       getData()
       fetchScores()
    }
    
    
    
    /// This function fetches SchoolData
    func getData() {
        guard let highSchoolsURL = URL(string: Constants.highSchoolsURLFields) else {return}
         downLoadData(fromURL: highSchoolsURL) { (returnedData) in
            if let data = returnedData {
                guard let newSchoolData = try? JSONDecoder().decode([NYCSchool].self, from: data) else {return}
                DispatchQueue.main.async { [weak self] in
                    self?.schoolData = newSchoolData
                }
            } else {
                print("no data returned")
            }
        }
      
    }
    
    
    
    
    /// This function fetches SatScores
    func fetchScores() {
        guard let url = URL(string: Constants.schoolWithSATScoreURLFields) else {return}
         downLoadData(fromURL: url) { (returnedData) in
            if let data = returnedData {
                guard let newSatScore = try? JSONDecoder().decode([SATScore].self, from: data) else {return}
                DispatchQueue.main.async { [weak self] in
                    self?.satscores = newSatScore
                }
            } else {
                print("no data returned")
            }
        }
      
    }
    
    
    
    /// This function handles downloads from the any url
    func downLoadData(fromURL url: URL, handler: @escaping (_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
            error == nil,
            let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300  else {
                print("No data.")
                handler(nil)
                return
            }
            handler(data)
        }.resume()    }
    
  }
    
    





































