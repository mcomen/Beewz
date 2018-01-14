//
//  AboutViewController.swift
//  Beewz
//
//  Created by MUHAMMED COMEN on 1/13/18.
//  Copyright © 2018 MUHAMMED COMEN. All rights reserved.
//

import UIKit
import Cards

class AboutViewController: UIViewController {
    
    // MARK: - Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Data source for CardGroupSliding
        let icons: [UIImage] = [
            UIImage(named: "Aftenposten")!,
            UIImage(named: "agraam")!,
            UIImage(named: "al-jazeera-english")!,
            UIImage(named: "ansa")!,
            UIImage(named: "ars-technica")!,
            UIImage(named: "AssociatedPress")!,
            UIImage(named: "australian-financial-review")!,
            UIImage(named: "axios")!,
            UIImage(named: "bbc-sport")!,
            UIImage(named: "bbc")!,
            UIImage(named: "bild")!,
            UIImage(named: "blasting-news-br")!,
            UIImage(named: "bleacher-report")!,
            UIImage(named: "Bloomberg")!,
            UIImage(named: "breitbart-news")!,
            UIImage(named: "businessInsider")!,
            UIImage(named: "buzzfeed")!,
            UIImage(named: "CBC")!,
            UIImage(named: "CBS News")!,
            UIImage(named: "CNBC")!,
            UIImage(named: "Crypto Coins News")!,
            UIImage(named: "DailyMail")!,
            UIImage(named: "der-tagesspiegel")!,
            UIImage(named: "die-zeit")!,
            UIImage(named: "el-mundo")!,
            UIImage(named: "Engadget")!,
            UIImage(named: "entertainment-weekly")!,
            UIImage(named: "espn")!,
            UIImage(named: "financial-times")!,
            UIImage(named: "Fortune")!,
            UIImage(named: "fox")!,
            UIImage(named: "Göteborgs-Posten")!,
            UIImage(named: "hacker-news")!,
            UIImage(named: "huffpost")!,
            UIImage(named: "IGN")!,
            UIImage(named: "Independent")!,
            UIImage(named: "info-money")!,
            UIImage(named: "la-gaceta")!,
            UIImage(named: "Le Monde")!,
            UIImage(named: "lequipe")!,
            UIImage(named: "liberation")!,
            UIImage(named: "metro")!,
            UIImage(named: "Mirror")!,
            UIImage(named: "msnbc")!,
            UIImage(named: "MTV News")!,
            UIImage(named: "National Geographic")!,
            UIImage(named: "Next Big Future")!,
            UIImage(named: "nhl-news")!,
            UIImage(named: "nrk")!,
            UIImage(named: "NYT")!,
            UIImage(named: "politico")!,
            UIImage(named: "Polygon")!,
            UIImage(named: "Recode")!,
            UIImage(named: "reddit-r-all")!,
            UIImage(named: "Reuters")!,
            UIImage(named: "Spiegel Online")!,
            UIImage(named: "t3n")!,
            UIImage(named: "talksport")!,
            UIImage(named: "TechCrunch")!,
            UIImage(named: "TechRadar")!,
            UIImage(named: "The Telegraph")!,
            UIImage(named: "TheEconomist")!,
            UIImage(named: "TheGuardian")!,
            UIImage(named: "TheVerge")!,
            UIImage(named: "Time")!,
            UIImage(named: "TNW")!,
            UIImage(named: "UsaToday")!,
            UIImage(named: "Vice")!,
            UIImage(named: "Wired")!,
            UIImage(named: "wirtschafts-woche")!,
            UIImage(named: "wp")!,
            UIImage(named: "WSJ")!
            ]
        
        let card = CardGroupSliding(frame: CGRect(x: 0, y: 60, width: self.view.frame.size.width, height: self.view.frame.size.height))
        card.textColor = #colorLiteral(red: 0, green: 0.6889899373, blue: 0.4470640421, alpha: 1)
        card.icons = icons
        card.iconsSize = 60
        card.iconsRadius = 0
        // Title
        card.title = "from 75 Different News Sources"
        card.subtitle = "Welcome to Beewz!"
        // Add to View
        view.addSubview(card)
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
