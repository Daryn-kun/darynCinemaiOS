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
    @IBOutlet weak var addDeleteButton: UIBarButtonItem!
    
    var movieID: Int?
    var posterUrl: String?
    var movieIdInRealm: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovieDetail()
        print("Id \(type(of: movieID))")
        if movieIdInRealm != nil{
            addDeleteButton.title = "Delete from List"
        } else{
            addDeleteButton.tintColor = .systemGreen
        }
        
    }
    
    
    
    func getMovieDetail(){
        Alamofire.request("https://api.themoviedb.org/3/movie/\(movieID!)?api_key=ee0e53c4b9306988da02a013ee946d31", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject {(response:
            DataResponse<UsersResponse2>) in
            if let result = response.result.value{
                self.movieYearLbl.text = result.releaseDate
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
                self.posterUrl = result.posterPath
                let url = "https://image.tmdb.org/t/p/w500" + result.backdropPath!
                if let data = try? Data(contentsOf: URL(string: url)!){
                    self.posterImageView.image = UIImage(data: data)}
            }
        }
    }
    
    @IBAction func addToListTapped(_ sender: Any) {
        if movieIdInRealm != nil{
            let specificMovie = realm.object(ofType: Movies.self, forPrimaryKey: movieIdInRealm)
            try! realm.write {
                realm.delete(specificMovie!)
            }
        } else{
            let movieToList = Movies()
            movieToList.movieTitle = self.title
            movieToList.imgUrl = self.posterUrl
            movieToList.imdbId = self.movieID!
            movieToList.id = self.incrementID()
            try! realm.write{
                realm.add(movieToList)
            }
        }
        
        
        navigationController?.popViewController(animated: true)
        
    }
    func incrementID() -> Int {
        return (realm.objects(Movies.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}
