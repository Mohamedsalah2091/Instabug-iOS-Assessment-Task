//
//  Presenter.swift
//  Instabug iOS Assessment Task
//
//  Created by MAK on 5/18/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
protocol ViewControllerView : class {
}

class ViewControllerPresenter{
    
    private weak var view: ViewControllerView?
    
    init(view : ViewControllerView) {
        self.view = view
    }
    
    func prepareSections(key : Int , titleOfSection : inout [String]){
        if key == 0 {
            titleOfSection.reverse()
            ShareData.fristIs = 1
            ShareData.numberOfSections = 2
        }
    }
    
    func sectionCount(section : Int, frist : Int, second :  Int) -> Int {
        if section == 0 && ShareData.fristIs == 1{
            return frist
        }
        else if section == 0 && ShareData.fristIs == 0 || section == 1 && ShareData.fristIs == 1{
            return second
        }
        return 0
    }
    
    func addCell(cell : FilmDesignCell ,frist :  [cellData] , second :  [MovieData] , index : Int , section : Int ) -> FilmDesignCell {
        
        if section == 0 && ShareData.fristIs == 1{
            let item = frist[index]
            cell.filmTitle.text = item.title
            cell.date.text = item.date
            cell.filmOverview.text = item.overview
            cell.filmImage.image = item.image
        }
        else if section == 0 && ShareData.fristIs == 0 || section == 1 && ShareData.fristIs == 1{
            let item = second[index]
            cell.filmTitle.text = item.title
            cell.date.text = item.release_date
            cell.filmOverview.text = item.overview
            
            if  item.poster_path != ""{
                // downloaded Func To get the Image (Folder : Helpers -> File: UIImageView+Extensions )
                cell.filmImage.downloaded(from: ShareData.imageLink(link:item.poster_path!))
            }else {
                cell.filmImage.image = #imageLiteral(resourceName: "cellDefaultImage.png")
            }
        }
        return cell
    }
    
    func newPage(totalPages : Int) -> Bool {
        ShareData.pageNumber += 1
        if ShareData.pageNumber < totalPages{
            return true
        }
        return false
    }
    
    func cheakCountOfSection() -> Bool {
        if ShareData.countInSections == 0{
            return true
        }
        return false
    }
    
    
    
    
}
