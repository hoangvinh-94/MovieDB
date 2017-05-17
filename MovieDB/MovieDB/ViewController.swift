//
//  ViewController.swift
//  MovieDB
//
//  Created by Cntt08 on 5/17/17.
//  Copyright © 2017 Cntt08. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var defaultSession: URLSession!
    var dataTask: URLSessionDataTask?
    
    @IBOutlet var collectionView: UICollectionView!
    
    var images = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        defaultSession = URLSession(configuration: URLSessionConfiguration.default, delegate: self as! URLSessionDelegate,     delegateQueue: nil)
        
        requestData()

    }
    func requestData() {
        dataTask = defaultSession.dataTask(with: URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=24b1973f805d7f765ee59e3481812a29&language=en-US")!)
        
        dataTask?.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

