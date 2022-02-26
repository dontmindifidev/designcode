//
//  ContentView.swift
//  Weather
//
//  Created by Adam Fisher on 26/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your coordinates are \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    ProgressView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(.blue)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
