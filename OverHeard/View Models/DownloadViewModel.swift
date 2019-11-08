//
//  WebService.swift
//  OverHeard
//
//  Created by Sean Saoirse on 07/11/19.
//  Copyright © 2019 Sean Saoirse. All rights reserved.
//

import SwiftUI
import Foundation


class DownloadViewModel: ObservableObject{
    let baseURL = "https://e17ce70a.ngrok.io/download/"
    @Published var vidURL = ""
    @Published var vidTitle = ""
    @Published var vidDuration = 0
    @Published var uploader = ""
    func downloadURL(){
        
        guard let url = URL(string: baseURL) else {
            return }
        
        
        let body: [String: String] = ["link": self.vidURL]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){(data, response, error) in
            guard let data = data else {return}
            let finalData = try! JSONDecoder().decode(DownloadResponseModel.self, from: data)
            
           
            DispatchQueue.main.async{
                    if(finalData.status == "success"){
                        self.vidTitle = finalData.title
                        self.vidDuration = finalData.duration
                        self.uploader = finalData.uploader
                    }else{
                        print("shitd")
                    }
            }
        
            
        }.resume()

    }
  

}

