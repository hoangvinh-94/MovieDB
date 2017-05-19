//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by healer on 5/19/17.
//  Copyright © 2017 Cntt08. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    
    var image: UIImage?
    var titleF: String?
    var id: Int?
    
    @IBOutlet var titleFilm: UILabel!
    
    @IBOutlet var genreFilm: UILabel!
    @IBOutlet var overviewFilm: UILabel!
    
    @IBOutlet var poster: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleFilm.text = titleF
        poster.image = image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
