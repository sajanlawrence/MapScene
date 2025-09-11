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
            mapLayer
            VStack(spacing: 0){
                header
                Spacer()
                locationPreviewStack
            }
        }
    }
}

extension LocationsView{
    private var mapLayer: some View{
        Map(position: $vm.cameraPosition){
            ForEach(vm.locations) { location in
                Annotation(location.name, coordinate: location.coordinates) {
                    LocationMapAnnotationView(location: location)
                        .scaleEffect(location == vm.mapLocation ? 1.5 : 1.0)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
                //Marker(location.name, coordinate: location.coordinates)
            }
        }
        //.mapStyle(.hybrid)
    }
    
    private var locationPreviewStack: some View{
        ZStack{
            ForEach(vm.locations) { location in
                if vm.mapLocation == location{
                    LocationPreviewView(location: location)
                        .padding()
                        .shadow(radius: 20)
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading))
                        )
                }
            }
        }
    }
    
    private var header: some View {
        VStack{
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
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
