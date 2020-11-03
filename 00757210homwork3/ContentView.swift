//
//  ContentView.swift
//  00757210homwork3
//
//  Created by User23 on 2020/11/4.
//

import SwiftUI

struct ContentView: View {
    @State private var showSecondPage = false
    @State public var bdate = Date()
    @State private var red = Double()
    @State private var green = Double()
    @State private var blue = Double()
    @State private var bgColor = Color.white
    @State private var gender = 0
    @State private var present = 0
    @State private var name: String = ""
    var sex = ["男","女"]
    var gift = ["蛋糕","藍芽耳機","手作圍巾","抱枕","平板","手錶"]
    var body: some View {
        
        VStack {
            Text("生日慶祝資料")
                .labelStyle(DefaultLabelStyle())
                .multilineTextAlignment(.leading)
                .font(.title).foregroundColor(Color(red: red, green: green, blue: blue))
            Image("生日")
                .resizable()
                .scaledToFit()
            DisclosureGroup(
                content:{
                    DatePicker("生日", selection: $bdate, displayedComponents: .date)
                        .foregroundColor(Color(red: red, green: green, blue: blue))
                },
                label:{
                    Label("生日:", systemImage: "clock")
                        .foregroundColor(Color(red: red, green: green,blue:blue))
                    Text(bdate,style: .date)
                        .foregroundColor(Color(red: red, green: green, blue: blue))
                }
            )
            VStack{
                Picker(selection: $gender, label: Text("性別")) {
                    Text(sex[0]).tag(0)
                    Text(sex[1]).tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                Picker(selection: $present, label: Text("生日禮物")) {
                    ForEach(gift.indices) { (index) in
                        Text(gift[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Text("你指定禮物:\(gift[present])")
                TextField("請輸入名字",text: $name)
                Form{
                    Text("你喜歡的字體顏色")
                        .foregroundColor(Color(red: red, green: green, blue: blue))
                    HStack{
                    HStack{
                        Text("Red  ")
                            .foregroundColor(.red)
                        Slider(value: $red, in: 0...1)
                            .accentColor(.red)
                    }
                    HStack{
                        Text("Green")
                            .foregroundColor(.green)
                        Slider(value: $green, in: 0...1)
                            .accentColor(.green)
                    }
                    HStack{
                        Text("Blue ")
                            .foregroundColor(.blue)
                        Slider(value: $blue, in: 0...1)
                            .accentColor(.blue)
                    }
                    }
                }
                ColorPicker("背景顏色",selection: $bgColor)
                Spacer()
                Button("傳送") {showSecondPage = true}
                    .sheet(isPresented: $showSecondPage) {
                        secondview(showSecondPage:self.$showSecondPage,bdate:self.$bdate,red:self.$red,green:self.$green, blue: self.$blue, name: self.$name, present:$present)
                    }
            }
            .background(bgColor)
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
