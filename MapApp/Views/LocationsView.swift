//
//  LocationsView.swift
//  MapApp
//
//  Created by Sajan Lawrence on 10/09/25.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack{
            Map(position: $vm.cameraPosition)
            
            VStack(spacing: 0){
                header
                Spacer()
            }
            
        }
    }
}

extension LocationsView{
    private var header: some View {
        VStack{
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.title3)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
                    .foregroundStyle(.black)
            }
            
            if vm.showLocationsList{
                LocationListView()
            }
        }
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(color: .white.opacity(0.3), radius: 20, x: 0, y: 15)
        .padding()
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
