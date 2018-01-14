//
//  MasterViewController.swift
//  Beews
//
//  Created by MUHAMMED COMEN on 12/26/17.
//  Copyright © 2017 MUHAMMED COMEN. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    // MARK: - Outlets
    var detailViewController: DetailViewController? = nil
    var news = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // It does not need to show empty cells
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        // News
        let reuters = News(source: "reuters", sourceRealName: "REUTERS", logo: "Reuters", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let cnbc = News(source: "cnbc", sourceRealName: "CNBC", logo: "CNBC", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let cbcNews = News(source: "cbc-news", sourceRealName: "CBC News", logo: "CBC", category:NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.Canada.rawValue)
        let independent = News(source: "independent", sourceRealName: "Independent", logo: "Independent", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let dailyMail = News(source: "daily-mail", sourceRealName: "Daily Mail", logo: "DailyMail", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let buzzFeed = News(source: "buzzfeed", sourceRealName: "Buzz Feed", logo: "buzzfeed", category: NewsCategory.Entertainment.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let huffPost = News(source: "the-huffington-post", sourceRealName: "The Huffington Post", logo: "huffpost", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let engadget = News(source: "engadget", sourceRealName: "Engadget", logo: "Engadget", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let associatedPress = News(source: "associated-press", sourceRealName: "Associated Press", logo: "AssociatedPress", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let bloomberg = News(source: "bloomberg", sourceRealName: "Bloomberg", logo: "Bloomberg", category: NewsCategory.Business.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let bbcNews = News(source: "bbc-news", sourceRealName: "BBC News", logo: "bbc", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.UK.rawValue)
        let espn = News(source: "espn", sourceRealName: "ESPN", logo: "espn", category: NewsCategory.Sport.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let theNewYorkTimes = News(source: "NYT", sourceRealName: "The New York Times", logo: "NYT", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let wired = News(source: "wired", sourceRealName: "Wired", logo: "Wired", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let viceNews = News(source: "vice-news", sourceRealName: "Vice News", logo: "Vice", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let usaToday = News(source: "usa-today", sourceRealName: "USA TODAY", logo: "UsaToday", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let theNextWeb = News(source: "the-next-web", sourceRealName: "The Next Web", logo: "TNW", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let techRadar = News(source: "techradar", sourceRealName: "Tech Radar", logo: "TechRadar", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let time = News(source: "time", sourceRealName: "Time", logo: "Time", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let theWashingtonPost = News(source: "the-washington-post", sourceRealName: "The Washington Post", logo: "wp", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let theWallStreetJournal = News(source: "the-wall-street-journal", sourceRealName: "The Wall Street Journal", logo: "WSJ", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let theEconomist = News(source: "the-economist", sourceRealName: "The Economist", logo: "TheEconomist", category: NewsCategory.Business.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let fox = News(source: "fox-news", sourceRealName: "Fox News", logo: "fox", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let theVerge = News(source: "the-verge", sourceRealName: "The Verge", logo: "TheVerge", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let guardian = News(source: "the-guardian-uk", sourceRealName: "The Guardian", logo: "TheGuardian", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.UK.rawValue)
        let alJazeera = News(source: "al-jazeera-english", sourceRealName: "Al Jazeera", logo: "al-jazeera-english", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let businesInsider = News(source: "business-insider", sourceRealName: "Business Insider", logo: "businessInsider", category: NewsCategory.Business.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let crypto = News(source: "crypto-coins-news", sourceRealName: "Crypto Coins News", logo: "Crypto Coins News", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let leMonde = News(source: "le-monde", sourceRealName: "Le Monde", logo: "Le Monde", category: NewsCategory.General.rawValue, language: Languages.French.rawValue, country: Country.France.rawValue)
        let mtv = News(source: "mtv-news", sourceRealName: "MTV News", logo: "MTV News", category: NewsCategory.Music.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let theTelegraph = News(source: "the-telegraph", sourceRealName: "The Telegraph", logo: "The Telegraph", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.UK.rawValue)
        let spiegelOnline = News(source: "spiegel-online", sourceRealName: "Spiegel Online", logo: "Spiegel Online", category: NewsCategory.General.rawValue, language: Languages.German.rawValue, country: Country.Germany.rawValue)
        let nextBigFuture = News(source: "next-big-future", sourceRealName: "Next Big Future", logo: "Next Big Future", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let fortune = News(source: "fortune", sourceRealName: "Fortune", logo: "Fortune", category: NewsCategory.Business.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let nationalGeographic = News(source: "national-geographic", sourceRealName: "National Geographic", logo: "National Geographic", category: NewsCategory.Science.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let mirror = News(source: "mirror", sourceRealName: "Mirrod", logo: "Mirror", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.UK.rawValue)
        let recode = News(source: "recode", sourceRealName: "Recode", logo: "Recode", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country:Country.USA.rawValue)
        let polygon = News(source: "polygon", sourceRealName: "Polygon", logo: "Polygon", category: NewsCategory.Gaming.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let ign = News(source: "ign", sourceRealName: "IGN Gaming", logo: "IGN", category: NewsCategory.Gaming.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let techcrunch = News(source: "techcrunch", sourceRealName: "Tech Crunch", logo: "TechCrunch", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let cbsNews = News(source: "cbs-news", sourceRealName: "CBS News", logo: "CBS News", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let aftenposten = News(source: "aftenposten", sourceRealName: "Aftenposten", logo: "Aftenposten", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.Norway.rawValue)
        let argaam = News(source: "argaam", sourceRealName: "Argaam", logo: "agraam", category: NewsCategory.Business.rawValue, language: Languages.Arabic.rawValue, country: Country.Arabia.rawValue)
        let ansa = News(source: "ansa", sourceRealName: "Ansa", logo: "ansa", category: NewsCategory.General.rawValue, language: Languages.Italian.rawValue, country: Country.Italy.rawValue)
        let arsTechnica = News(source: "ars-technica", sourceRealName: "Ars Technica", logo: "ars-technica", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country:Country.USA.rawValue)
        let aryNews = News(source: "ary-news", sourceRealName: "Ary News", logo: "ary-news", category: NewsCategory.General.rawValue, language: Languages.Urdu.rawValue, country: Country.Pakistan.rawValue)
        let australianfinancialReview = News(source: "Australian Financial Review", sourceRealName: "australian-financial-review", logo: "australian-financial-review", category: NewsCategory.Business.rawValue, language: Languages.English.rawValue, country: Country.Australia.rawValue)
        let axios = News(source: "axios", sourceRealName: "axios", logo: "axios", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let bbcSport = News(source: "bbc-sport", sourceRealName: "BBC Sport", logo: "bbc-sport", category: NewsCategory.Sport.rawValue, language: Languages.English.rawValue, country: Country.UK.rawValue)
        let bild = News(source: "bild", sourceRealName: "Bild", logo: "bild", category: NewsCategory.General.rawValue, language: Languages.German.rawValue, country: Country.Germany.rawValue)
        let blastingNewsBr = News(source: "blasting-news-br", sourceRealName: "Blasting News", logo: "blasting-news-br", category: NewsCategory.General.rawValue, language: Languages.Portuguese.rawValue, country: Country.Brazil.rawValue)
        let breitbartNews = News(source: "breitbart-news", sourceRealName: "Breitbart News", logo: "breitbart-news", category: NewsCategory.Politics.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let derTagesspiegel = News(source: "der-tagesspiegel", sourceRealName: "Der Tagesspiegel", logo: "der-tagesspiegel", category: NewsCategory.General.rawValue, language: Languages.German.rawValue, country: Country.Germany.rawValue)
        let dieZeit = News(source: "die-zeit", sourceRealName: "Die Zeit", logo: "die-zeit", category: NewsCategory.Business.rawValue, language: Languages.German.rawValue, country: Country.Germany.rawValue)
        let elMundo = News(source: "el-mundo", sourceRealName: "El Mundo", logo: "el-mundo", category: NewsCategory.General.rawValue, language: Languages.Spanish.rawValue, country: Country.Spain.rawValue)
        let entertainmentWeekly = News(source: "entertainment-weekly", sourceRealName: "Entertainment Weekly", logo: "entertainment-weekly", category: NewsCategory.Entertainment.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let financialTimes = News(source: "financial-times", sourceRealName: "Financial Times", logo: "financial-times", category: NewsCategory.Business.rawValue, language: Languages.English.rawValue, country: Country.UK.rawValue)
        let bleacherReport = News(source: "bleacher-report", sourceRealName: "Bleacher Report", logo: "bleacher-report", category: NewsCategory.Sport.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let goteborgsPosten = News(source: "goteborgs-posten", sourceRealName: "Goteborgs-Posten", logo: "Göteborgs-Posten", category: NewsCategory.General.rawValue, language: Languages.Swedish.rawValue, country: Country.Sweden.rawValue)
        let hackerNews = News(source: "hacker-news", sourceRealName: "Hacker News", logo: "hacker-news", category: NewsCategory.Technology.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let infoMoney = News(source: "info-money", sourceRealName: "Info Money", logo: "info-money", category: NewsCategory.Business.rawValue, language: Languages.Portuguese.rawValue, country: Country.Brazil.rawValue)
        let laGaceta = News(source: "la-gaceta", sourceRealName: "La Gaceta", logo: "la-gaceta", category: NewsCategory.General.rawValue, language: Languages.Spanish.rawValue, country: Country.Argentina.rawValue)
        let lequipe = News(source: "lequipe", sourceRealName: "L`equipe", logo: "lequipe", category: NewsCategory.Sport.rawValue, language: Languages.French.rawValue, country: Country.France.rawValue)
        let liberation = News(source: "liberation", sourceRealName: "Liberation", logo: "liberation", category: NewsCategory.General.rawValue, language: Languages.French.rawValue, country: Country.France.rawValue)
        let msnbc = News(source: "msnbc", sourceRealName: "MSNBC", logo: "msnbc", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let nhlNews = News(source: "nhl-news", sourceRealName: "NHL News", logo: "nhl-news", category: NewsCategory.Sport.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let nrk = News(source: "nrk", sourceRealName: "NRK News", logo: "nrk", category: NewsCategory.General.rawValue, language: Languages.Norwegian.rawValue, country: Country.Norway.rawValue)
        let politico = News(source: "politico", sourceRealName: "Politico", logo: "politico", category: NewsCategory.Politics.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let reddit = News(source: "reddit-r-all", sourceRealName: "Reddit", logo: "reddit-r-all", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let talksport = News(source: "talksport", sourceRealName: "Talk Sport", logo: "talksport", category: NewsCategory.Sport.rawValue, language: Languages.English.rawValue, country: Country.USA.rawValue)
        let wirtschaftsWoche = News(source: "wirtschafts-woche", sourceRealName: "Wirtschafts Woche" , logo: "wirtschafts-woche", category: NewsCategory.Business.rawValue, language: Languages.German.rawValue, country: Country.Germany.rawValue)
        let t3n = News(source: "t3n", sourceRealName: "T3n", logo: "t3n", category: NewsCategory.Technology.rawValue, language: Languages.German.rawValue, country: Country.Germany.rawValue)
        let metro = News(source: "metro", sourceRealName: "Metro", logo: "metro", category: NewsCategory.General.rawValue, language: Languages.English.rawValue, country: Country.UK.rawValue)
        
        // Append
        news.append(reuters)
        news.append(cnbc)
        news.append(cbcNews)
        news.append(independent)
        news.append(dailyMail)
        news.append(buzzFeed)
        news.append(huffPost)
        news.append(engadget)
        news.append(associatedPress)
        news.append(bloomberg)
        news.append(bbcNews)
        news.append(espn)
        news.append(theNewYorkTimes)
        news.append(wired)
        news.append(viceNews)
        news.append(usaToday)
        news.append(theNextWeb)
        news.append(techRadar)
        news.append(time)
        news.append(theWashingtonPost)
        news.append(theWallStreetJournal)
        news.append(theEconomist)
        news.append(fox)
        news.append(theVerge)
        news.append(guardian)
        news.append(alJazeera)
        news.append(businesInsider)
        news.append(crypto)
        news.append(leMonde)
        news.append(mtv)
        news.append(theTelegraph)
        news.append(spiegelOnline)
        news.append(nextBigFuture)
        news.append(fortune)
        news.append(nationalGeographic)
        news.append(mirror)
        news.append(recode)
        news.append(polygon)
        news.append(ign)
        news.append(techcrunch)
        news.append(cbsNews)
        news.append(aftenposten)
        news.append(argaam)
        news.append(ansa)
        news.append(arsTechnica)
        news.append(aryNews)
        news.append(australianfinancialReview)
        news.append(axios)
        news.append(bbcSport)
        news.append(bild)
        news.append(blastingNewsBr)
        news.append(breitbartNews)
        news.append(derTagesspiegel)
        news.append(dieZeit)
        news.append(elMundo)
        news.append(entertainmentWeekly)
        news.append(financialTimes)
        news.append(bleacherReport)
        news.append(goteborgsPosten)
        news.append(hackerNews)
        news.append(infoMoney)
        news.append(laGaceta)
        news.append(lequipe)
        news.append(liberation)
        news.append(msnbc)
        news.append(nhlNews)
        news.append(nrk)
        news.append(politico)
        news.append(reddit)
        news.append(talksport)
        news.append(wirtschaftsWoche)
        news.append(t3n)
        news.append(metro)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View
    // Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Rows at the sections
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MasterTableViewCell
        // Configure the cell
        cell.logoImageView.image = UIImage(named: news[indexPath.row].logo)
        cell.logoImageView.layer.cornerRadius = 12.0
        cell.logoImageView.layer.masksToBounds = true
        cell.newSourceNameInCell.text = news[indexPath.row].sourceRealName.uppercased()
        cell.categoryLabel.text = news[indexPath.row].category
        cell.countryLabel.text = news[indexPath.row].country
        cell.languageLabel.text = news[indexPath.row].language.uppercased()
        // Return the cell
        return cell
    }
    
    // Deselect
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let detailViewController = segue.destination  as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            let wholeURL = "https://newsapi.org/v2/everything?sources=\(news[(indexPath?.row)!].source!)&apiKey=a868cac4080b490da1f8011d6c6ee3bc"
            detailViewController.navigationItem.title = news[(indexPath?.row)!].sourceRealName
            detailViewController.news = [wholeURL]
            detailViewController.title = news[(indexPath?.row)!].sourceRealName
            detailViewController.sourceName = [wholeURL]
            detailViewController.souceURL = wholeURL
            detailViewController.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            detailViewController.navigationItem.leftItemsSupplementBackButton = true
        }
    }
}
