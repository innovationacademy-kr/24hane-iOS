//
//  notificationView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/14/23.
//

import SwiftUI

struct notificationView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            VStack() {
                ZStack(alignment: .topLeading) {
                    Theme.BackgoundColor(forScheme: colorScheme)
                        .ignoresSafeArea()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    
                    VStack{
                        HStack{
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Theme.ToolBarIconColor(forScheme: colorScheme))
                                    .imageScale(.large)
                                    .padding()
                            })
                            Spacer()
                            Text("알림")
                                .font(.system(size: 20, weight: .bold))
                            Spacer()
                            Image(systemName: "chevron.left")
                                .imageScale(.large)
                                .padding()
                                .isHidden(true)
                        }
                        Text("알림 내역이 비어있습니다. 💌")
                            .padding()
                        Divider()
                    }
                }
            }
        }

    }
}

struct notificationView_Previews: PreviewProvider {
    static var previews: some View {
        notificationView()
    }
}
