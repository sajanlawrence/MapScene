//
//  LocationMapAnnotationView.swift
//  MapApp
//
//  Created by Sajan Lawrence on 11/09/25.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let location: Location
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .padding(6)
                .foregroundStyle(Color.accentColor)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .foregroundStyle(Color.accentColor)
                .offset(y: -9)
                .padding(.bottom, 35)
        }
    }
}

#Preview {
    LocationMapAnnotationView(location: .default)
}
