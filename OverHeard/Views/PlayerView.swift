//
//  PlayerView.swift
//  OverHeard
//
//  Created by Sean Saoirse on 03/11/19.
//  Copyright © 2019 Sean Saoirse. All rights reserved.
//

import SwiftUI

struct HeaderPlayerView: View{
    @Binding var isPresented: Bool

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View{
        HStack{
            Button(action:{
                self.isPresented = false
            },label:{
                Image("icons8-chevron-down")
            }).foregroundColor(Color.init(hex: colorScheme == .light ? "00000" : "ffffff"))
            Spacer()
                /*
            VStack{
                Text("NOW PLAYING FROM")
                .font(.custom("Poppins-SemiBold", size: 16))
                    .foregroundColor(Color.init(hex: colorScheme == .light ? "2D2D2D" : "ffffff"))
                .padding(.bottom, 0)
                
                
                Text("PLAYLIST: FOODS")
                    .font(.custom("Poppins-Bold", size: 16))
                    .foregroundColor(Color.init(hex: "F35176"))
            }.layoutPriority(1)*/
            
            
            Spacer()
            Button(action:{
                
            },label:{
                
                Image("icons8-ellipsis")
            }).foregroundColor(Color.init(hex: colorScheme == .light ? "00000" : "ffffff"))
            
        }.padding(.bottom, 64).padding(.top, 16)
    }
    
}

struct MyImage: View{
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View{
        HStack{
                          Image("placeholder2")
                                      .resizable()
                                          .aspectRatio(contentMode: .fit)
                                          
                       }.cornerRadius(16)
                       
                       
        
    
    }
}

struct MySlider:View{
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var celsius: Double = 0
    var body: some View{
        VStack{
                                 Slider(value: $celsius, in: -100...100, step: 0.1)
                                 .accentColor(Color.init(hex: "F35176"))
                                 
                                 HStack{
                                     Text("13:03")
                                     .font(.custom("Poppins-Regular", size: 16))
                                     Spacer()
                                     Text("7:23")
                                     .font(.custom("Poppins-Regular", size: 16))

                                 }.padding(.top, -10)
                                 

                               }.padding(.top,32)
    }
}

struct TextInfo:View{
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View{
           
    VStack(alignment: .leading){
           Text("Eating At The BEST Reviewed Doughnut Shop In My State | SO DELICIOUS")
           .font(.custom("Poppins-SemiBold", size: 24))
               .foregroundColor(Color.init(hex: colorScheme == .light ? "2D2D2D" : "ffffff"))
           .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
            .padding(.bottom, 8)
        
           Text("Uploaded by Daym Drops")
               .font(.custom("Poppins-SemiBold", size: 16))
            .foregroundColor(Color.init(hex: "F35176"))
            
        }.layoutPriority(1).padding(.top,48)
    }

}

struct PlayerControl:View{
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
    HStack{
          Button(action:{
                           
                       },label:{
                           
           Image("left")
            .foregroundColor(Color.init(hex: colorScheme == .light ? "00000" : "ffffff"))
          }).padding(.leading, 36)
          
          Spacer()
          
          Button(action:{
                           
               },label:{
                   
                   Image("play")
          })
          
          Spacer()
          
          
          Button(action:{
                           
          },label:{
           
           Image("right")
           .foregroundColor(Color.init(hex: colorScheme == .light ? "00000" : "ffffff"))
          }).padding(.trailing, 36)
          
    }.padding(.top,64)
    }
    
}

struct BottomButtons:View{
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View{
    
    
    HStack{
        Button(action:{
                         
             },label:{
                 
                 Image("love")
        })
        
        Spacer()
        
        Button(action:{
                         
             },label:{
                 
                 Image("time")
        })
        
        Spacer()
        
        Button(action:{
                         
             },label:{
                 
                 Image("download")
        })
    }.padding(.top, 81)
        
        
    }
}


struct PlayerView: View {
    @Binding var isPresented: Bool

    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                
                HeaderPlayerView(isPresented: $isPresented)
                
                MyImage()
                
                MySlider()

                TextInfo()
                
                PlayerControl()
                
                BottomButtons()
                
                   }.padding(0)
        }.padding(.leading, 32).padding(.trailing, 32)
       
    }
}
/*
struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(isPresented: <#T##Binding<Bool>#>)
    }
}*/
