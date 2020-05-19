//
//  Constants.swift
//  Instabug iOS Assessment Task
//
//  Created by MAK on 5/18/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit



class ShareData {
    
    static var numberOfSections : Int = 1
    static var titleOfSection = ["All Movies" , "My movies"]
    static var countInSections = 0
    static var fristIs = 0
    static var pageNumber = 1
    
    static func pageLink(page : Int) -> String {
        return "https://api.themoviedb.org/3/discover/movie?api_key=2befdcff20691d92f46a24d83580ba04&page=\(page)"
    }
    
    
    static func imageLink(link : String) -> String{
        return "https://image.tmdb.org/t/p/w200/\(link)"
    }
   static func CreateAlert(title : String , message: String ) -> UIAlertController{
        
        let  alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let  action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
             alert.dismiss(animated: true, completion: nil)})
             alert.addAction(action)
        return alert
        
    }
    
}
