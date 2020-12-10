//
//  ViewController.swift
//  DarynCinema
//
//  Created by nagato on 10/16/20.
//  Copyright © 2020 nagato. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import RealmSwift

var userList: Results<User>!
var moviesList: Results<Movies>!
var realm = try! Realm()

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var movies = [Result]()
    var movieId: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getPopularMovies()
        table.register(MoviesListTableViewCell.nib(), forCellReuseIdentifier: MoviesListTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.layoutMargins = UIEdgeInsets.zero
        table.separatorInset = UIEdgeInsets.zero
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if(!isUserLoggedIn){
        self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }
    
    func getPopularMovies(){
        Alamofire.request("https://api.themoviedb.org/3/movie/popular?api_key=ee0e53c4b9306988da02a013ee946d31", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject {(response:
            DataResponse<UsersResponse1>) in
            if let result = response.result.value{
                self.movies = result.results ?? []
                DispatchQueue.main.async {
                                self.table.reloadData()
                            }
            }
        }
    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesListTableViewCell.identifier, for: indexPath) as! MoviesListTableViewCell
        cell.movieTitle.text = movies[indexPath.row].originalTitle
        cell.movieYear.text = movies[indexPath.row].releaseDate
        cell.movieRate.text = String(movies[indexPath.row].voteAverage!)
        let url = "https://image.tmdb.org/t/p/w300" + movies[indexPath.row].posterPath!
        if let data = try? Data(contentsOf: URL(string: url)!){
                    cell.moviePosterImage.image = UIImage(data: data)
        }
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Show movie details
        
        movieId = movies[indexPath.row].id
        performSegue(withIdentifier: "detailsView", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? Details1ViewController{
            
            dest.movieID = movieId
        }
        
    }
}

