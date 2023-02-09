//
//  SchoolDirectoryDetailedView.swift
//  2022 - 10 - 27 - Rasheed Andrew - NYCSchools
//
//  Created by rasheed andrew on 2/8/23.
//

import SwiftUI

struct SchoolDirectoryDetailedView: View {

        @ObservedObject var schoolDirectory = SchoolDirectory()
    
    let test : SATScore

        var body: some View {
              //  List{
            
            ScrollView(.vertical, showsIndicators: false){
                       
//            ForEach(schoolDirectory.satscores, id: \.self) {
//                SATScore in
                
                
               
                    VStack (alignment: .leading, spacing: 20){
                        Text("\(test.schoolName)")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                        
                        
                        Text("PARTICIPANTS: \(test.numOfSatTestTakers)")
                            .font(.system(size: 10))
                            .fontWeight(.regular)
                        
                        
                        Text("MATH AVG: \(test.satCriticalReadingAvgScore)")
                            .font(.system(size: 10))
                            .fontWeight(.regular)
                        
                        Text("WRITING AVG: \(test.satMathAvgScore)")
                            .font(.system(size: 10))
                            .fontWeight(.regular)
                        
                        Text("CRITICAL READING AVG: \(test.satWritingAvgScore)")
                            .font(.system(size: 10))
                            .fontWeight(.regular)
                        
                    }
              //  }


            }
              
            }

        }
  


//struct SchoolDirectoryDetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SchoolDirectoryDetailedView()
//    }
//}
