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
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var aboutText: UILabel!
    
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
            UIImage(named: "AssociatedPress")!]
        
        let card = CardGroupSliding(frame: CGRect(x: 20, y: 20, width: self.view.frame.size.width - 10, height: self.view.frame.size.height - 10))
        card.textColor = #colorLiteral(red: 0, green: 0.6889899373, blue: 0.4470640421, alpha: 1)
        
        card.icons = icons
        card.iconsSize = 50
        card.iconsRadius = 0
        
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
