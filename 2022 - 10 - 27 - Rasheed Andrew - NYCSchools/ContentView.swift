//
//  ContentView.swift
//  2022 - 10 - 27 - Rasheed Andrew - NYCSchools
//
//  Created by rasheed andrew on 10/27/22.
//

import SwiftUI




struct ContentView: View {
    
    @StateObject var schoolDirectory = SchoolDirectory()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(schoolDirectory.nycschools) {  NYCSchool in
                    NavigationLink(destination: detailedView())
                    {
                        VStack {
                            Text("\(NYCSchool.school_name)")
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                            Text("\(NYCSchool.campus_name)")
                                .font(.system(size: 10))
                                .fontWeight(.regular)
                            Text("\(NYCSchool.location)")
                                .font(.system(size: 10))
                                .fontWeight(.regular)
                            Text("\(NYCSchool.city)")
                                .font(.system(size: 10))
                                .fontWeight(.regular)
                            Text("\(NYCSchool.zip)")
                                .font(.system(size: 10))
                                .fontWeight(.regular)
                            
                            HStack {
                                Text("\(NYCSchool.phone_number)")
                                    .font(.system(size: 10))
                                    .fontWeight(.regular)
                                
                                Text("\(NYCSchool.fax_number)")
                                    .font(.system(size: 10))
                                    .fontWeight(.regular)
                                
                                Text("\(NYCSchool.school_email)")
                                    .font(.system(size: 10))
                                    .fontWeight(.regular)
                            }
                            Text("\(NYCSchool.website)")
                                .font(.system(size: 10))
                                .fontWeight(.regular)
                        }
                    }
                }
            }
            .navigationTitle("School directory")
            .onAppear() {
                schoolDirectory.fetch()
            }
        }
       
    }
}

struct detailedView: View {

    @StateObject var schoolDirectory = SchoolDirectory()

    var body: some View {
            List{
                ForEach(schoolDirectory.satscores) {  SATScore in
                    VStack (alignment: .leading, spacing: 20){
                        Text("\(SATScore.school_name)")
                            .font(.system(size: 12))
                            .fontWeight(.bold)


                        Text("PARTICIPANTS: \(SATScore.num_of_sat_test_takers)")
                            .font(.system(size: 10))
                            .fontWeight(.regular)

                   
                            Text("MATH AVG: \(SATScore.sat_math_avg_score)")
                                .font(.system(size: 10))
                                .fontWeight(.regular)

                            Text("WRITING AVG: \(SATScore.sat_writing_avg_score)")
                                .font(.system(size: 10))
                                .fontWeight(.regular)
                            
                            Text("CRITICAL READING AVG: \(SATScore.sat_critical_reading_avg_score)")
                                .font(.system(size: 10))
                                .fontWeight(.regular)
                     
                }
            }
            .navigationTitle("SAT SCORES")
            .navigationBarHidden(false)
            .onAppear() {
                schoolDirectory.fetchScores()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
     ContentView()
   //   detailedView()
    }
}
