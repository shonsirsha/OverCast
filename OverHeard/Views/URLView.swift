//
//  URLView.swift
//  OverHeard
//
//  Created by Sean Saoirse on 04/11/19.
//  Copyright © 2019 Sean Saoirse. All rights reserved.
//

import SwiftUI



struct URLView: View {
    @ObservedObject var DownloadVM = DownloadViewModel()
    
    @State var youtubeURL: String
    
    @State var presentingListenModal = false
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Paste your YouTube video URL below")
                .font(.custom("Poppins-SemiBold", size: 24))
                    .foregroundColor(Color.init(hex: "F35176"))
                .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 32)
                
               
                
                
                TextField("Video's URL", text: $youtubeURL)
                Rectangle().frame(height:1).foregroundColor(Color.init(hex: "F35176")).padding(.bottom,16)
                
                HStack{
                    Text("\(self.DownloadVM.vidTitle)")
                  .font(.custom("Poppins-SemiBold", size: 16))
                    .foregroundColor(Color.init(hex: "F35176"))
                    .fixedSize(horizontal: false, vertical: true)

                }.padding(.bottom,2)
                
                
                HStack{
                               
                       
                       Text("Uploaded By:")
                       .font(.custom("Poppins-Regular", size: 16))
                                  .foregroundColor(Color.init(hex: colorScheme == .light ? "2D2D2D" : "ffffff"))
                       
                       Text("\(self.DownloadVM.uploader)")
                                     .font(.custom("Poppins-SemiBold", size: 16))
                                                .foregroundColor(Color.init(hex: "F35176"))
                   }.padding(.bottom,2)
                
                HStack{
                    Text("Duration:")
                    .font(.custom("Poppins-Regular", size: 16))
                               .foregroundColor(Color.init(hex: colorScheme == .light ? "2D2D2D" : "ffffff"))
                    
                    Text("\(self.DownloadVM.vidDuration)")
                                  .font(.custom("Poppins-SemiBold", size: 16))
                                             .foregroundColor(Color.init(hex: "F35176"))
                    }.padding(.bottom,12)
                
                
                Button(action:{
                    self.DownloadVM.vidURL = self.youtubeURL
                    self.DownloadVM.downloadURL()
                    //self.presentingListenModal.toggle()
                },label:{
                    Text("Start Listening  🎧").foregroundColor(Color.init(hex: "ffffff")).frame(maxWidth: .infinity).padding(.top,12).padding(.bottom,12)
                    }).background(Color.init(hex: "F35176"))
                
                Spacer()
                
                    .sheet(isPresented: $presentingListenModal, content: {
                        PlayerView(isPresented: self.$presentingListenModal)
                    })
                
            }.padding(.leading,32).padding(.trailing,32)
        }

    }
}

/*struct URLView_Previews: PreviewProvider {
    static var previews: some View {
        URLView(youtubeURL: "youtube.com?watch?v=213asdasd")
    }
}
*/


