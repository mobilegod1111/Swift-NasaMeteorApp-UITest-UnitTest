//
//  MeteorMapView.swift
//  Amazing meteor
//
//  Created by venus on 9/20/21.
//

import MapKit
import SwiftUI

struct MeteorMapView: View {
    let meteor: MeteorModel
    
    @ObservedObject var meteorMgr = StoreDataMgr()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let span = MKCoordinateSpan(latitudeDelta: 0.0075, longitudeDelta: 0.0075)
    
    @State private var isFavorite = false
    
    var favBtnName: String {
        return self.isFavorite ? "favoritesfill" : "favorites"
    }
    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: meteor.getLocation().coordinate, span: span)),
            annotationItems:meteor.getLocationArr()) { place in
            MapAnnotation(coordinate: place.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                Image("mapmarker")
            }
        }
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        .onAppear{
            isFavorite = meteorMgr.isSavedMeteor(meteor: meteor)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(meteor.name!), displayMode: .inline )
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(
                action: {
                    self.presentationMode.wrappedValue.dismiss()
                },
                label: { VStack{
                    Image(systemName: "arrow.backward")
                    }
                    .foregroundColor(.white)
                }).accessibility(identifier: "MapBackBtn")
            ,
            trailing: Button(action: ManageMeteor){
                Image(favBtnName)
            }.accessibility(identifier: "FavoritesBtn")
        )
    }
    
    private func ManageMeteor() {
        if(self.isFavorite == false) {
            self.meteorMgr.save(meteor: meteor)
        } else {
            self.meteorMgr.delete(meteor: meteor)
        }
        isFavorite = !isFavorite
    }
}
