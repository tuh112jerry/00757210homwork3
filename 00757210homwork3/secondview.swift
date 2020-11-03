//
//  secondview.swift
//  00757210homwork3
//
//  Created by User23 on 2020/11/4.
//

import Foundation
import SwiftUI

struct secondview: View{
    @Binding var showSecondPage: Bool
    @Binding var bdate:Date
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    @Binding var name: String
    @Binding var present: Int
    @State private var showAlert = false
    var number = Int.random(in:0...3)
    var gift = ["蛋糕","藍芽耳機","手作圍巾","抱枕","平板","手錶"]
    var body: some View{
        VStack{
            Text(self.bdate,style: .date)
            let num = number
            Text("\(name)")
            if(num == 0){
                Text("Another year older, another year wiser!")
                    .foregroundColor(Color(red: red, green: green, blue: blue))
            }
            else if(num == 1){
                Text("長歲數、長智慧！")
                    .foregroundColor(Color(red: red, green: green, blue: blue))
            }
            else{
                Text("Another year older, another year wiser!\n長歲數、長智慧！")
                    .foregroundColor(Color(red: red, green: green, blue: blue))
            }
            Button("會得到什麼禮物？", action:{
                showAlert = true
                showSecondPage = false
            })
            .alert(isPresented: $showAlert) { () -> Alert in
                let answer = ["得到指定禮物" + gift[present], "得到手作卡片"].randomElement()!
                return Alert(title: Text(answer))
            }
        }
    }
    
}

struct secondview_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
