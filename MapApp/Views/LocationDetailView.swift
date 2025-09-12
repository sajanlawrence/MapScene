//
//  LocationDetailView.swift
//  MapApp
//
//  Created by Sajan Lawrence on 11/09/25.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var location: Location
    var body: some View {
        ScrollView{
            VStack{
                imageSection
                VStack(alignment: .leading, spacing: 16){
                    titleSection
                    Divider()
                    descriptionSection
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

extension LocationDetailView{
    private var imageSection: some View{
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .ignoresSafeArea()
        .frame(height: 500)
        .tabViewStyle(.page)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
    
    private var titleSection: some View{
        VStack(alignment: .leading){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
        .padding(.top, 10)
    }
    
    private var descriptionSection: some View{
        VStack(alignment: .leading, spacing: 16.0){
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            if let url = URL(string: location.link){
                Link(destination: url) {
                    Text("Read more on Wikipedia")
                        .font(.headline)
                        .tint(.blue)
                }
                .padding(.leading, 20)
            }
        }
    }
    
    private var mapLayer: some View{
        Map(position: .constant(vm.createMapCameraPosition(for: location))){
            Annotation(location.name, coordinate: location.coordinates) {
                LocationMapAnnotationView(location: location)
                    .shadow(radius: 10)
                    
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .allowsHitTesting(false)
        .padding()
    }
    
    private var backButton: some View{
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .tint(.primary)
        }
        .padding()
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    LocationDetailView(location: .default)
        .environmentObject(LocationsViewModel())
}
