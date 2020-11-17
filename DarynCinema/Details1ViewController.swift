//
//  Details1ViewController.swift
//  DarynCinema
//
//  Created by nagato on 10/16/20.
//  Copyright © 2020 nagato. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class Details1ViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieGenreLbl: UILabel!
    @IBOutlet weak var movieYearLbl: UILabel!
    @IBOutlet weak var movieRuntimeLbl: UILabel!
    @IBOutlet weak var movieTaglineLbl: UILabel!
    @IBOutlet weak var movieOverviewTxt: UITextView!
    @IBOutlet weak var movieOverviewTxtHC: NSLayoutConstraint!
    @IBOutlet weak var movieRateLbl: UILabel!
    
    var movieID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getMovieDetail()
        
    }
    
    

    func getMovieDetail(){
        Alamofire.request("https://api.themoviedb.org/3/movie/\(movieID!)?api_key=ee0e53c4b9306988da02a013ee946d31", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject {(response:
            DataResponse<UsersResponse2>) in
            if let result = response.result.value{
                self.movieYearLbl.text = result.releaseDate!
                var genres = ""
                for genre in result.genres!{
                    if genres.isEmpty {
                        genres = genre.name!
                    } else {
                        genres += " | \(genre.name!)"
                    }
                }
                self.title = result.originalTitle
                self.movieGenreLbl.text = genres
                self.movieRuntimeLbl.text = String(result.runtime!) + " min"
               
                if result.tagline!.count == 0{
                     self.movieTaglineLbl.text = "'The tagline is absent'"
                } else{
                     self.movieTaglineLbl.text = "'\(result.tagline!)'"
                }
                self.movieOverviewTxt.text = result.overview!
                self.movieOverviewTxtHC.constant = self.movieOverviewTxt.contentSize.height
                self.movieRateLbl.text = String(result.voteAverage!)
                let url = "https://image.tmdb.org/t/p/w500" + result.backdropPath!
                if let data = try? Data(contentsOf: URL(string: url)!){
                    self.posterImageView.image = UIImage(data: data)}
            }
        }
    }
}
