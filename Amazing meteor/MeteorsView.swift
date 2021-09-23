//
//  ContentView.swift
//  Amazing meteor
//
//  Created by venus on 9/20/21.
//

import SwiftUI
import Alamofire

struct MeteorsView: View {
    
    @Binding var meteors: [MeteorModel]
    @State private var selectIndex = 0
    
    var body: some View {
        ZStack {
            VStack {
                Picker("Sorts", selection: $selectIndex) {
                    Text("By Date")
                        .accessibility(identifier: "By Date")
                        .tag(0)
                    Text("By Size")
                        .accessibility(identifier: "By Size")
                        .tag(1)
                }
                .pickerStyle( SegmentedPickerStyle())
                .onChange(of: selectIndex, perform: { value in
                    sortMeteor(isSorted: value)
                })
                .accessibility(identifier: "picker")
                .padding()
                Divider()
                List {
                    ForEach(meteors, id: \.name) { meteor in
                        NavigationLink(destination: MeteorMapView(meteor: meteor)){
                            CardView(meteor: meteor)
                        }
                        .listRowBackground(Color.ViewBkClr)
                    }
                }
                .id(UUID())
                .accessibility(identifier: "MeteorList")
            }
            .background(Color.ViewBkClr)
        }
    }
    
    private func sortMeteor(isSorted: Int) {
        if isSorted == 0 { //Sort By Date
            meteors.sort {
                $0.getDate() < $1.getDate()
            }
        }
        else { //Sort By mass
            meteors.sort {
                $0.getMass() > $1.getMass()
            }
        }
    }
}


