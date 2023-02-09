//
//  SchoolDirectoryView.swift
//  2022 - 10 - 27 - Rasheed Andrew - NYCSchools
//
//  Created by rasheed andrew on 2/8/23.
//

import SwiftUI

struct SchoolDirectoryView: View {

    @StateObject var schoolDirectory = SchoolDirectory()
    @State var showScores : Bool = false
    @State var selectedSchool : String = ""
        
        var body: some View {
            NavigationView {
                ZStack{
                    List{
                        ForEach(schoolDirectory.satscores, id: \.self) { data in
                            NavigationLink(destination: SchoolDirectoryDetailedView(test: data)) {
                                Text(data.schoolName)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                            }
                        }
                    }
                }
            }
           
        }
    }

struct SchoolDirectoryView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDirectoryView()
    }
}
