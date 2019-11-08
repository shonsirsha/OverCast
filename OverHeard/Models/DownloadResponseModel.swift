//
//  DownloadResponseModel.swift
//  OverHeard
//
//  Created by Sean Saoirse on 07/11/19.
//  Copyright © 2019 Sean Saoirse. All rights reserved.
//

import Foundation

struct DownloadResponseModel:Decodable{
    var status: String
    var video_id: String
    var title: String
   // var downloadedVideoTitle: String
    var uploader: String
    var duration: Int
}
