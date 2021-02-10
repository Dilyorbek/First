//
//  ContentView.swift
//  First
//
//  Created by Dilyorbek on 10.02.21.
//

import SwiftUI

struct ContentView: View {
    @State var nameText = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Please enter name...", text: $nameText)
                Button(action: {
                    openSecondApp()
                }) {
                    HStack {
                        Spacer()
                        Text("Hit me :)")
                        Spacer()
                    }
                }.disabled(nameText.count == 0)
            }
            .navigationBarTitle("FirstApp", displayMode: .inline)
        }
    }
    
    func openSecondApp() {
        guard let url = URL(string: "SecondApp://?name=\(nameText)") else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: { (result) in
                
            })
        } else {
            print("App scheme not found")
            //Download the app
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

