//
//  AlertPresenter.swift
//  Instabug iOS Assessment Task
//
//  Created by MAK on 5/18/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

protocol AlertPresenterView : class {
    func checkImage(image:UIImage)
}


class AlertPresenter{
    
    private weak var view: AlertPresenterView?
    
    init(view : AlertPresenterView) {
        self.view = view
    }
    
    func checkImage(imageItem: UIImageView){
        
        view?.checkImage(image: ( imageItem.image == #imageLiteral(resourceName: "add-image.png")  ? #imageLiteral(resourceName: "cellDefaultImage.png") : imageItem.image)!)
    }
    
    func checkData(title: String , date: String , overview : String ) -> Any{
        guard  !title.isEmpty , !date.isEmpty ,  !overview.isEmpty else{
            return ShareData.CreateAlert(title: "Erore", message: "All data required")
        }
        return true
    }
    
    
}
