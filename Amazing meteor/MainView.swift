//
//  MainView.swift
//  Amazing meteor
//
//  Created by venus on 9/22/21.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = String.Meteors
    @State var favlists = [MeteorModel]()
    
    @ObservedObject var meteorViewModel = MeteorViewModel()
    @ObservedObject var meteorStore = StoreDataMgr()
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                MeteorsView(meteors: $meteorViewModel.meteors)
                    .tabItem{
                        Image("meteors")
                            .renderingMode(.template)
                        Text(String.Meteors)
                            .font(.TabBarIconFont)
                        }
                    .tag(String.Meteors)
                    .onAppear {
                        meteorViewModel.meteorLandingsAPI()
                    }
                MeteorFavoritesView(meteors: $favlists)
                    .tabItem{
                        Image("favorites")
                            .renderingMode(.template)
                        Text(String.Favorites)
                            .font(.TabBarIconFont)
                    }
                    .tag(String.Favorites)
                    .onAppear {
                        self.favlists = meteorStore.load()
                    }
            }
            .accentColor(.TabSelectedClr)
        }
        .navigationBarTitle(Text(self.selectedTab), displayMode: .inline)
    }
}
