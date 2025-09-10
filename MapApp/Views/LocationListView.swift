//
//  LocationListView.swift
//  MapApp
//
//  Created by Sajan Lawrence on 10/09/25.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        List(vm.locations) { location in
            Button {
                vm.showNextLocation(location: location)
            } label: {
                listRowView(location: location)
            }
            .padding(.vertical, 4)
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
    }
}

extension LocationListView{
    private func listRowView(location: Location) -> some View{
        HStack{
            if let imgName = location.imageNames.first{
                Image(imgName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(.buttonBorder)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationsViewModel())
}
