//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by Sajan Lawrence on 10/09/25.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    @State var location: Location
    var body: some View {
        HStack(alignment: .bottom, spacing: 0.0) {
            VStack(alignment: .leading){
                imageSection
                titleSection
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8.0){
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

extension LocationPreviewView{
    private var imageSection: some View{
        ZStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
        }
        .padding(8)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
    
    private var titleSection: some View{
        VStack(alignment: .leading){
            Text(location.name)
                .font(.title2)
                .bold()
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
    private var learnMoreButton: some View{
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn more")
                .frame(width: 100, height: 30)
            
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View{
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .frame(width: 100, height: 30)
            
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    ZStack{
        Color.gray
            .ignoresSafeArea()
        LocationPreviewView(location: Location.default)
            .padding()
            .environmentObject(LocationsViewModel())
    }
    
}
