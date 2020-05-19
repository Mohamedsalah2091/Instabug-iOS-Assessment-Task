//
//  AlertExtention.swift
//  Instabug iOS Assessment Task
//
//  Created by MAK on 5/17/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit


extension AlertService{
    
    // MARK: Image Picker
    func preparingImagePicker(){
        imagePicker.delegate = self
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageItem.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Date Picker
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonPress))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelButtonPress))
        
        toolbar.setItems([doneButton , spaceButton , cancelButton], animated: true)
        
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datapicker
        datapicker.datePickerMode = .date
        
    }
    
    @objc func doneButtonPress (){
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTextField.text = formatter.string(from: datapicker.date)
        self.view.endEditing(true)
    }
    
    
    @objc func cancelButtonPress (){
        self.view.endEditing(true)
    }
    
    
    
    // MARK: Preparing
    
    func pickImage(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker,animated: true , completion: nil)
    }
    
    func prepareAlert(){
        addButton.layer.cornerRadius = 5
        dissmissButton.layer.cornerRadius = 5
        alertView.layer.cornerRadius = 20
        imageItem.image = #imageLiteral(resourceName: "add-image")
    }
    
    
    
    // MARK: Delegate
    
    func checkImage(image: UIImage) {
        imageItem.image = image
        imageItem.layer.cornerRadius = 10
    }
    
    
}

