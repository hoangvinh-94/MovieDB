//
//  Movie.swift
//  MovieDB
//
//  Created by Cntt08 on 5/17/17.
//  Copyright © 2017 Cntt08. All rights reserved.
//

import Foundation
import UIKit

class Movie{
    private var id: Int
    private var title: String
    private var poster: String
    private var overview: String
    private var releaseDate: String
    
    init(id: Int, title: String, poster: String, overview: String, releaseDate: String) {
        self.id = id
        self.title = title
        self.poster = poster
        self.overview = overview
        self.releaseDate = releaseDate
    }
    func getTitle() -> String{
        return title;
    }
    func getPoster() -> String{
        return poster;
    }
    func getOverview() -> String{
        return overview;
    }
    func getReleaseDate() -> String{
        return releaseDate;
    }
    
}
