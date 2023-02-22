//
//  ContentView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject var hane: Hane
    @State var signInChecked = false

    var body: some View {
        ZStack{
            if !signInChecked {
                LoadingView()
            } else {
                if hane.status == .afterSignIn {
                    MainView()
                } else if hane.status == .beforeSignIn {
                    SignInView(hane: hane)
                } else if hane.status == .loadWebView {
                    SignInWebView()
                } else {
                    LoadingView()
                }
            }
        }
        .task{
            do{
                try  hane.status = await hane.isLogin() ? .afterSignIn : .beforeSignIn
                self.signInChecked = true
            } catch {
                print("Invalid URL")
            }

        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
