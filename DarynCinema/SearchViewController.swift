//
//  SearchViewController.swift
//  DarynCinema
//
//  Created by nagato on 10/16/20.
//  Copyright © 2020 nagato. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SafariServices

class SearchViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!
    
    var movies = [Search]()
    var movieId: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        field.delegate = self
        table.layoutMargins = UIEdgeInsets.zero
        table.separatorInset = UIEdgeInsets.zero
 
    }
    //Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies()
        return true
    }
    
    func searchMovies(){
        field.resignFirstResponder()
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        let query = text.replacingOccurrences(of: " ", with: "%20")
        
        movies.removeAll()
        
        Alamofire.request("http://www.omdbapi.com/?apikey=ed7002d6&s=\(query)&type=movie", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject {(response:
            DataResponse<UsersResponse>) in
            if let result = response.result.value{
                self.movies = result.search ?? []
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
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.movieTitleLabel.text = movies[indexPath.row].title
        cell.movieYearLabel.text = movies[indexPath.row].year
        let url = movies[indexPath.row].poster!
        if let data = try? Data(contentsOf: URL(string: url)!){
                    cell.moviePosterImageView.image = UIImage(data: data)}
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Show movie details
        movieId = movies[indexPath.row].imdbID!
        performSegue(withIdentifier: "details2View", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? Details2ViewController{
            dest.movieID = movieId!
        }
        
    }

}
