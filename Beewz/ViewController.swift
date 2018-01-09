//
//  ViewController.swift
//  Beewz
//
//  Created by MUHAMMED COMEN on 1/8/18.
//  Copyright © 2018 MUHAMMED COMEN. All rights reserved.
//

import UIKit

// Blueprint
struct Articles: Decodable {
    let articles: [Article]
    let name: String!
}
struct Article: Decodable {
    let title: String!
    let author: String!
    let description: String!
    let urlToImage: URL!
    let publishedAt: String!
    let url: URL!
}

class ViewController: UIViewController {
    
    // MARK: - Outlets
    let urlForJSON = "https://newsapi.org/v2/top-headlines?sources=associated-press,entertainment-weekly,bloomberg,buzzfeed,newsweek,usa-today,new-york-magazine&apiKey=a868cac4080b490da1f8011d6c6ee3bc"
    var news = [String]()
    var articles = [Article]()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parseURL(theURL: urlForJSON)
        
        // TableView
    }
    
    func parseURL(theURL: String) {
        let url = URL(string: theURL)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            // Error Handling
            if error != nil {
                print("It did not work: \(String(describing: error))")
            } else {
                // Parsing
                do {
                    let article = try JSONDecoder().decode(Articles.self, from: data!)
                    self.articles = article.articles
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Configure the cell
        cell.textLabel?.text = articles[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        // Return the cell
        return cell
    }
    
    // Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
