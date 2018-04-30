//
//  ViewController.swift
//  MyFavoriteMovies
//
//  Created by Salwa on 4/12/18.
//  Copyright © 2018 Developers2Be. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var TableViewList: UITableView!
    
    var Sections = [1]
    var Movies = Array<Movie> ()
    var index = 0
    var segueIdentifier = "cellSegue"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Movies.append(Movie(Name : "Just Friends" ,
                            Desc :"During Christmas, a man comes face-to-face with his old high school crush" ,
                            Image : "movie1"))
        
        Movies.append(Movie(Name : "Disaster Movie" ,
                            Desc :"an unsuspecting group of twenty-somethings were bombarded by a series of natural disasters and catastrophic events" , Image : "movie2"))
        
        Movies.append(Movie(Name : "Meet the Spartans" ,
                            Desc :"The heroic Spartan king Leonidas, armed with nothing but leather underwear and a cape" ,
                            Image : "movie3"))
        
        
        Movies.append(Movie(Name : "Littleman" ,
                            Desc : "A wannabe dad mistakes a vertically challenged criminal on the lam as his newly adopted son." ,
                            Image : "movie4"))
        
        Movies.append(Movie(Name : "Hotel for Dogs" ,
                            Desc : "Two kids secretly take in stray dogs at a vacant hotel." ,
                            Image : "movie5"))
      
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  segue.identifier == segueIdentifier,
            let destination = segue.destination as? MovieDetailsVC,
            let Index = tableView.indexPathForSelectedRow?.row
        {
            destination.movieNameText = Movies[Index].Name!
            
            destination.movieDescText = Movies[Index].Desc!
            
            destination.movieImg = UIImage(named:Movies[Index].Image!)!
        
        }
    
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:MovieCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        
        
                 cell.MovieName.text = Movies[indexPath.row].Name!
                 cell.MovieDesc.text = Movies[indexPath.row].Desc!
                 cell.MovieImage.image = UIImage(named:Movies[indexPath.row].Image!)
        
               return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // index = indexPath.row
        performSegue(withIdentifier: segueIdentifier, sender: self)
    
    }
    
}

