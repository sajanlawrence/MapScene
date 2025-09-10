//
//  MapAppApp.swift
//  MapApp
//
//  Created by Sajan Lawrence on 09/09/25.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
