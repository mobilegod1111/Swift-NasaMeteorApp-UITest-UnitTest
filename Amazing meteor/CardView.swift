//
//  CardView.swift
//  Amazing meteor
//
//  Created by venus on 9/20/21.
//

import SwiftUI

struct CardView: View {
    let meteor: MeteorModel
    var body: some View {
        VStack(alignment: .leading) {
            Text(meteor.name ?? "")
                .accessibility(identifier: meteor.name ?? "")
                .font(.CardTitleFont)
                .foregroundColor(.TitleClr)
            Spacer()
            Text("\(meteor.getDate().DateToStr(format: "MMM dd, yyyy")) · \(meteor.mass ?? "Unknown") kg")
                .font(.CardBodyFont)
                .foregroundColor(.BodyClr)
        }
        .padding(.top)
        .padding(.bottom)
    }
}
