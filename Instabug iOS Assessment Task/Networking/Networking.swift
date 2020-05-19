//
//  Networking.swift
//  Instabug iOS Assessment Task
//
//  Created by MAK on 5/18/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

class Networking{
    
   class func loadMovies(page : Int,completion: @escaping (_ movies: Movies?) -> Void){
        guard let  url = URL(string: ShareData.pageLink(page: page))  else { fatalError("Wrong URL") }
        let session = URLSession.shared
        let task  = session.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                return
            }
            do{
                let users = try JSONDecoder().decode(Movies.self, from: data)
                completion(users)
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
}
