//
//  ViewController.swift
//  Instabug iOS Assessment Task
//
//  Created by MAK on 5/17/20.
//  Copyright © 2020 MAK. All rights reserved.


import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource, SendData , ViewControllerView{
    
    @IBOutlet weak var tableView: UITableView!
    
    var users : Movies!
    var addMovieAlert = AlertShow()
    var fristSection = [cellData]()
    let spinner = UIActivityIndicatorView()
    var presenter : ViewControllerPresenter!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.style = UIActivityIndicatorView.Style.medium
        callData(page: ShareData.pageNumber)
        prepareTableView()
        presenter = ViewControllerPresenter(view : self)
        
    }
    func callData(page : Int) {
        Networking.loadMovies(page: page) { (data) in
            let temp = data?.results
            
            if  self.presenter.cheakCountOfSection() {
                self.users = data
            }else{
                self.users.results += temp!
            }
            
            ShareData.countInSections = self.users.results.count
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.spinner.stopAnimating()
            }
        }
    }
    
    
    @IBAction func addFilmButton(_ sender: Any) {
        let show = addMovieAlert.alert()
        show.delegate = self
        present(show,animated: true)
    }
    func prepareTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        
        // I make a Generic Func To make Code made simple (Folder : Helpers -> File: UITableView+Extensions )
        tableView.registerCellNib(cellClass: FilmDesignCell.self)
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // I make a Generic Func To make Code more semple (Folder : Helpers -> File: UITableView+Extensions )
        let cell = tableView.dequeue() as FilmDesignCell
        
        return presenter.addCell(cell: cell, frist: fristSection, second: users.results, index: indexPath.row, section: indexPath.section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ShareData.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.sectionCount(section: section, frist: fristSection.count, second: ShareData.countInSections)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ShareData.titleOfSection[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            
            self.tableView.tableFooterView = spinner
            self.tableView.tableFooterView?.isHidden = false
            
            if presenter.newPage(totalPages: users.total_pages){
                callData(page: ShareData.pageNumber)
            }else{
                present(ShareData.CreateAlert(title: "Note", message: "No more pages"),animated: true)
            }
            
        }
        
        
    }
    
    func addNewData(title: String, date: String, overview: String, image: UIImage) {
        presenter.prepareSections(key: ShareData.fristIs,titleOfSection: &ShareData.titleOfSection)
        fristSection.append(cellData(title: title, date: date, overview: overview, image: image))
        tableView.reloadData()
    }
    
}

