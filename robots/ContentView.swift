//
//  ContentView.swift
//  robots
//
//  Created by Allison McEntire on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var robotName: String?
    
    var body: some View {
        
        let binding = Binding<String>(get: {
            self.robotName ?? ""
        }, set: {
            self.robotName = $0
        })
        
        VStack {
            Text("Hello Robot")
            Text(robotName ?? "")
            TextField("Enter your robot name:", text: binding)
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
