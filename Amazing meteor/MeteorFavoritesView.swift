//
//  MeteorFavoritesView.swift
//  Amazing meteor
//
//  Created by venus on 9/22/21.
//

import SwiftUI

struct MeteorFavoritesView: View {
    @Binding var meteors: [MeteorModel]
    var body: some View {
        List {
            ForEach(meteors, id: \.name) { meteor in
                NavigationLink(destination: MeteorMapView(meteor: meteor)){
                    CardView(meteor: meteor)
                }
                .listRowBackground(Color.ViewBkClr)
            }
        }
        .accessibility(identifier: "FavoritesList")
    }
}

