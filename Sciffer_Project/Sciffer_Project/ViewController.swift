//
//  ViewController.swift
//  Sciffer_Project
//
//  Created by Sagar Bhosale on 23/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    var movies: MoviesList?
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseJson()
    }
    
    //JSON Parsing
    func parseJson() {
        let str = "https://f052e9ed-54d8-4b98-b64f-808bd17df254.mock.pstmn.io/get?data=2"
        let url = URL(string: str)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            do{
                self.movies = try JSONDecoder().decode(MoviesList.self, from: data!)
                
                DispatchQueue.main.async {
                    self.moviesTableView.reloadData()
                }
                
                
            } catch let error {
                print("Error is here\(error)")
            }
        }.resume()
    }
    
    
    //SAVE JSON FILE
    func saveJSonFile() {
        let hostedJSONFile = "https://f052e9ed-54d8-4b98-b64f-808bd17df254.mock.pstmn.io/get?data=2"
        let jsonURL = URL(string: hostedJSONFile)
        let defaults = UserDefaults.standard
        let itemName = "myJSONFromWeb"
        do {
            let directory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let fileURL = directory.appendingPathComponent(itemName)
            let jsonData = try Data(contentsOf: jsonURL!)
            try jsonData.write(to: fileURL, options: .atomic)
            defaults.set(fileURL, forKey: "pathForJSON")
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
}


// TableView Delegate DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies?.movieList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MoviesTableViewCell
        
        
        // Method 1
      //  cell.titleLabel.text = "Title :  \(movies?.movieList[indexPath.row].title ?? "")"
        cell.yearLabel.text = "Year: \(movies?.movieList[indexPath.row].year ?? "")"
        cell.runtimeLabel.text = "Runtime: \( movies?.movieList[indexPath.row].runtime ?? "") minutes"
        cell.castLabel.text = "Cast: \(movies?.movieList[indexPath.row].cast ?? "")"
        
        
        // Method 2
        
        guard let title = movies?.movieList[indexPath.row].title else { return UITableViewCell() }
        cell.titleLabel.text = "Title : \(title)"
      return cell


// perfectly awesome!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
}
