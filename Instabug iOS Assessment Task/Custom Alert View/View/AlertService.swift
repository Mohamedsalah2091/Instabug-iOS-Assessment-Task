//
//  AlertService.swift
//  To Do List
//
//  Created by MAK on 5/11/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit


protocol SendData {
    func addNewData( title :String, date : String, overview : String, image : UIImage )
}
class AlertService: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AlertPresenterView {
    
    var presenter : AlertPresenter!
    
    var imagePicker = UIImagePickerController()
    
    let datapicker = UIDatePicker()
    
    var delegate: SendData?
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var imageItem: UIImageView!
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var dissmissButton: UIButton!
    
    @IBOutlet weak var overviewText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        prepareAlert()
        preparingImagePicker()
        presenter = AlertPresenter(view : self)
    }
    
    @IBAction func pressSaveButton(_ sender: Any) {
        
        let key = presenter.checkData(title: titleTextField.text! , date: dateTextField.text!, overview: overviewText.text!)
        
        if key is Bool{
            presenter.checkImage(imageItem: imageItem)
            
            self.delegate?.addNewData(title: titleTextField.text!, date: dateTextField.text!, overview: overviewText.text, image:  imageItem.image! )
            
            dismiss(animated: true)
        }else {
            present(key as! UIViewController , animated : true)
        }
        
        
    }
    
    
    
    @IBAction func pressDismissButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func pressAddImage(_ sender: Any) {
        pickImage()
    }
    
    
}

