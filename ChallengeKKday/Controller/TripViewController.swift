//
//  ViewController.swift
//  ChallengeKKday
//
//  Created by Sihan Fang on 2019/2/28.
//  Copyright © 2019 Sihan Fang. All rights reserved.
//

import UIKit

class TripViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        addSearchController()
        registerNib()
        tableView.separatorStyle = .none

        
    }
    
    fileprivate func registerNib() {
        let homeCellNib = UINib(nibName: "TripTableViewCell", bundle: nil)
        tableView.register(homeCellNib, forCellReuseIdentifier: "homeCell")
        
        let popDestCellNib = UINib(nibName: "PopularDestTableViewCell", bundle: nil)
        tableView.register(popDestCellNib, forCellReuseIdentifier: "PopCell")
    }
    
    fileprivate func addSearchController() {
//        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchBar.placeholder = "Destination, activity or interest"
//        searchController.definesPresentationContext = true
//        navigationItem.hidesSearchBarWhenScrolling = false
//        navigationItem.searchController = searchController
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "notification-30"), style: .plain, target: self, action: #selector(tapBtn))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "Destination, activity or interest"
        navigationItem.titleView = searchBar
        
    }
    
    @objc func tapBtn() {
        print("tap")
    }
    





}

extension TripViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionArray[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {

            let cell = tableView.dequeueReusableCell(withIdentifier: "PopCell", for: indexPath) as! PopularDestTableViewCell

            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! TripTableViewCell

            return cell

        }

        
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 240
        } else {
            return 330
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLabel: UILabel = {
           let label = UILabel()
            label.text = sectionArray[section]
            label.frame = CGRect(x: 16, y: 8, width: view.frame.width, height: 20)
            label.adjustsFontSizeToFitWidth = true
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 18)
            return label
        }()
        
        let headerView: UIView = {
            let view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.9039036632, green: 0.9001372457, blue: 0.9208526015, alpha: 1)

            view.addSubview(titleLabel)
            return view
        }()
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height: CGFloat = 35
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }

    
}
