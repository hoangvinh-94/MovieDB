//
//  ViewController.swift
//  MovieDB
//
//  Created by Cntt08 on 5/17/17.
//  Copyright © 2017 Cntt08. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    var defaultSession: URLSession!
    var dataTask: URLSessionDataTask?
    
    @IBOutlet var collectionView: UICollectionView!
    
    var posters = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.dataSource = self as? UICollectionViewDataSource
        self.collectionView.delegate = self as? UICollectionViewDelegate
        defaultSession = URLSession(configuration: URLSessionConfiguration.default, delegate: self as URLSessionDelegate,     delegateQueue: nil)
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posters.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCollectionViewCell
        
        
        let url = URL(string: posters[indexPath.row])
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                cell.itemImageView.image = UIImage(data: data!)
            }
        }
        return cell

    }
    
    


}

extension ViewController: URLSessionDelegate, URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        do {
            
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
            //print(json["page"])
            let movieArray = json["results"] as! [Any]
            //            print(movieArray)
            for index in 0...15{
                let firstObject = movieArray[index] as! [String: Any]
                //print(firstObject["poster_path"])
                
                images.append("https://image.tmdb.org/t/p/w640/" + (firstObject["poster_path"] as! String))
            }
            print(images)
        } catch {
            
        }
    }
    
}

