//
//  Details2ViewController.swift
//  DarynCinema
//
//  Created by nagato on 10/17/20.
//  Copyright © 2020 nagato. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class Details2ViewController: UIViewController {
    

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieGenreLbl: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieRuntime: UILabel!
    @IBOutlet weak var movieCountry: UILabel!
    @IBOutlet weak var movieActors: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var movieOverviewTxtHC: NSLayoutConstraint!
    
    var movieID: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovieDetail()
    }
    
    func getMovieDetail(){
        Alamofire.request("http://www.omdbapi.com/?i=\(movieID!)&apikey=ed7002d6", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject {(response:
            DataResponse<UsersResponse3>) in
            if let result = response.result.value{
                self.movieReleaseDate.text = result.released!
                self.title = result.title!
                self.movieGenreLbl.text = result.genre!
                self.movieRuntime.text = result.runtime!
                self.movieCountry.text = result.country!
                self.movieActors.text = result.actors!
                self.movieRating.text = result.imdbRating!
                self.movieOverview.text = result.plot!
                               self.movieOverviewTxtHC.constant = self.movieOverview.contentSize.height
                let url = result.poster!
                if let data = try? Data(contentsOf: URL(string: url)!){
                    self.posterImage.image = UIImage(data: data)}
            }
        }
    }

}
