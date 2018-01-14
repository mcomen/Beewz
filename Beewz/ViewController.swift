//
//  ViewController.swift
//  Beewz
//
//  Created by MUHAMMED COMEN on 1/8/18.
//  Copyright © 2018 MUHAMMED COMEN. All rights reserved.
//

import UIKit
import SDWebImage
import SafariServices

// Blueprint
struct Articles: Decodable {
    var articles: [Article]
    let name: String!
}
struct Article: Decodable {
    let title: String!
    let author: String!
    let description: String!
    let urlToImage: URL!
    let publishedAt: String!
    let url: URL!
    let source: SourceInformation
}

struct SourceInformation: Decodable {
    let id: String!
    let name: String!
}

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    
    // MARK: - Outlets
    let urlForJSON = "https://newsapi.org/v2/top-headlines?sources=abc-news,associated-press,cbc-news,cbs-news,cnn,fox-news,independent,metro,nbc-news,newsweek,new-york-magazine,reuters,the-huffington-post,time,usa-today,vice-news,al-jazeera-english,the-telegraph,newsweek,axios,crypto-coins-news,wired&apiKey=a868cac4080b490da1f8011d6c6ee3bc"
    var articles = [Article]()
    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parseURL(theURL: urlForJSON)
        // Refresh
        refreshControl.tintColor = #colorLiteral(red: 0, green: 0.6889899373, blue: 0.4470640421, alpha: 1)
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshNews(_:)), for: .valueChanged)
    }
    
    // MARK: - Date
    func dateConvertToLocalTime(dateToConvert: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let convertedData = dateFormatter.date(from: dateToConvert) else {return ""}
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let localDate = dateFormatter.string(from: convertedData)
        return localDate
    }
    
    // Refresh Control
    @objc private func refreshNews(_ sender: Any) {
        DispatchQueue.main.async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                // Reload
                self.parseURL(theURL: self.urlForJSON)
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    // JSON
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
                    // Main Thread
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        // Configure the cell
        cell.title.text = articles[indexPath.row].title
        cell.categoryLabel.text = articles[indexPath.row].description
        cell.number.text = "\(indexPath.row + 1)"
        cell.newsImageView.sd_setImage(with: articles[indexPath.row].urlToImage!, placeholderImage: UIImage(named: "placeholder"), options: .highPriority, progress: nil, completed: nil)
        cell.newsImageView.sd_showActivityIndicatorView()
        cell.newsImageView.sd_setIndicatorStyle(.whiteLarge)
        cell.createdAt.text = dateConvertToLocalTime(dateToConvert: articles[indexPath.row].publishedAt!)
        
        // Image
        cell.newsImageView.layer.cornerRadius = 6.0
        cell.newsImageView.clipsToBounds = true
        cell.sourceName.text = articles[indexPath.row].source.name
        
        // Return the cell
        return cell
    }
    
    // didSelect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = articles[indexPath.row].url
        let safariView = SFSafariViewController(url: url!)
        safariView.delegate = self
        safariView.dismissButtonStyle = .done
        safariView.preferredBarTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        safariView.preferredControlTintColor = #colorLiteral(red: 0.1646569073, green: 0.1678445041, blue: 0.2113541365, alpha: 1)
        present(safariView, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
