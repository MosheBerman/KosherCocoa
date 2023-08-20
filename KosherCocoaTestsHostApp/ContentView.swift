//
//  ContentView.swift
//  KosherCocoaTestsHostApp
//
//  Created by Moshe Berman on 8/20/23.
//  Copyright © 2023 Moshe Berman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
