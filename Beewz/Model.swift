//
//  Model.swift
//  Beews
//
//  Created by MUHAMMED COMEN on 12/18/17.
//  Copyright © 2017 MUHAMMED COMEN. All rights reserved.
//

import Foundation

extension MasterViewController {
    
    class News {
        // Properties
        let source: String!
        let sourceRealName: String!
        let logo: String!
        let category: String!
        let language: String!
        let country: String!
        
        // Init
        init(source: String, sourceRealName: String, logo: String, category: String, language: String, country: String) {
            self.source = source
            self.sourceRealName = sourceRealName
            self.logo = logo
            self.category = category
            self.language = language
            self.country = country
        }
    }
    
    // Categories
    enum NewsCategory: String {
        case Business
        case Entertainment
        case Gaming
        case General
        case Health
        case Music
        case Politics
        case Science
        case Sport
        case Technology
    }
    
    // Language
    enum Languages: String {
        case Arabic
        case Chinese
        case Dutch
        case English
        case French
        case German
        case Hebrew
        case Italian
        case Norwegian
        case Portuguese
        case Spanish
        case Swedish
        case Urdu
    }
    
    // Country
    enum Country: String {
        case Argentina
        case Australia
        case Brazil
        case Canada
        case China
        case France
        case Germany
        case HongKong
        case India
        case Ireland
        case Israel
        case Italy
        case Netherlands
        case Norway
        case Pakistan
        case Russia
        case Arabia
        case SouthAfrica
        case Spain
        case Sweden
        case UK
        case USA
    }
}
