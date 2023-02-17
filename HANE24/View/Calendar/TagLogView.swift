//
//  TagLogView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/16.
//

import SwiftUI

struct TagLogView: View {
    @State var selectedDate: Date = Date()
    @State var logList: [Log?] = []
    
    var body: some View {
        VStack(spacing: 4) {
            HStack{
                Text("\(selectedDate.monthToInt).\(selectedDate.dayToInt)")
                Spacer()
                Text("\(7)시간 \(48)분")
            }
            .font(.system(size: 15, weight: .medium, design: .default))
            .foregroundColor(Color.gray)
            
            
            Divider()
                .padding(.bottom, 2)
            
            HStack {
                Text("입실")
                    .frame(width: 65, height: 24)
                
                Spacer()
                
                Text("퇴실")
                    .frame(width: 65, height: 24)
                
                Spacer()
                
                Text("체류시간")
                    .frame(width: 65, height: 24)
            }
            .foregroundColor(Color(hex: "#333333"))
            .font(.system(size: 14, weight: .semibold))
            
            if logList.isEmpty {
                Text("기록이 없습니다.")
                    .foregroundColor(Color(hex: "#333333"))
                    .font(.system(size: 13, weight: .light))
            } else {
                ScrollView {
                    ForEach(logList, id: \.self) { log in
                        if let log = log {
                            tagLog(log)
                        } else {
                            
                        }
                    }
                }
            }
            
            
        }
        
    }
    
    @ViewBuilder
    func tagLog(_ log: Log) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(hex: "#EAEAEA"))
                .frame(height: 24)
                .isHidden((log.logTime ?? "-") != "누락")
            
            HStack {
                Text(log.inTime ?? "-")
                    .frame(width: 65, height: 24)
                
                Spacer()
                
                Text(log.outTime ?? "-")
                    .frame(width: 65, height: 24)
                
                Spacer()
                
                Text(log.logTime ?? "-")
                    .frame(width: 65, height: 24)
            }
            .foregroundColor(Color(hex: "#333333"))
            .font(.system(size: 14, weight: .semibold))
        }
    }
}

struct TagLogView_Previews: PreviewProvider {
    static var previews: some View {
        TagLogView(logList: [Log(inTime: "123", outTime: "456", logTime: "789"), Log(inTime: "123", outTime: "456", logTime: "789"), Log(inTime: "123", outTime: nil, logTime: "누락"), Log(inTime: "123", outTime: "456", logTime: "789"), Log(inTime: "123", outTime: nil, logTime: nil)])
    }
}
