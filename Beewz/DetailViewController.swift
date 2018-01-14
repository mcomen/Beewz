//
//  DetailViewController.swift
//  Beews
//
//  Created by MUHAMMED COMEN on 12/26/17.
//  Copyright © 2017 MUHAMMED COMEN. All rights reserved.
//
//// Blueprint
struct ArticlesForBeews: Decodable {
    let articles: [ArticleInSplit]
    let name: String!
}
struct ArticleInSplit: Decodable {
    let title: String!
    let author: String!
    let description: String!
    let urlToImage: URL!
    let publishedAt: String!
    let url: URL!
}

import UIKit
import SDWebImage
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate {

    // MARK : - Outlets
    var newsSourceTitle: String!
    @IBOutlet weak var tableView: UITableView!
    var news = [String]()
    var articles = [ArticleInSplit]()
    var souceURL: String!
    var sourceName = [String]()
    var sourceOfURL = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        // Hide empty cells
        tableView.tableFooterView = UIView()
        // parseURL(theURL: urlFromAPI)
        if let url = souceURL {
            parseURL(theURL: url)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                    let article = try JSONDecoder().decode(ArticlesForBeews.self, from: data!)
                    self.articles = article.articles
                    // Reload TableView
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    // Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Rows at sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    // MARK: - Date
    func dateConvertToLocalTime(dateToConvert: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let convertedData = dateFormatter.date(from: dateToConvert)
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let localDate = dateFormatter.string(from: convertedData!)
        return localDate
    }
    
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        
        // Cell Date Label
        cell.createdAt.text = dateConvertToLocalTime(dateToConvert: articles[indexPath.row].publishedAt!)
        
        // Configure the cell
        cell.titleOfNews.text = articles[indexPath.row].title
        cell.moreDetailLabel.text = articles[indexPath.row].description
        
        // ImageView
        cell.newsImageView.layer.cornerRadius = 8.0
        cell.newsImageView.layer.masksToBounds = true
        cell.newsImageView.sd_setImage(with: articles[indexPath.row].urlToImage, placeholderImage: UIImage(named: "placeholder"), options: [.progressiveDownload], completed: nil)
        cell.newsImageView.sd_setShowActivityIndicatorView(true)
        cell.newsImageView.sd_setIndicatorStyle(.whiteLarge)
        // Return the cell
        return cell
    }
    
    // DidSelect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = articles[indexPath.row].url
        let safariView = SFSafariViewController(url: url!)
        safariView.delegate = self
        safariView.dismissButtonStyle = .done
        safariView.preferredBarTintColor = #colorLiteral(red: 0.1646569073, green: 0.1678445041, blue: 0.2113541365, alpha: 1)
        safariView.preferredControlTintColor = #colorLiteral(red: 0, green: 0.6889899373, blue: 0.4470640421, alpha: 1)
        present(safariView, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //  Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
