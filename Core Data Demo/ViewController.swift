//
//  ViewController.swift
//  TokerTask
//
//  Created by Zap.Danish on 24/05/19.
//  Copyright © 2019 Zap.Danish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var discoverTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discoverTableView.register(UINib(nibName: "DiscoverCBDTableViewCell", bundle: nil), forCellReuseIdentifier: "discoverCBDTableViewCell")
        }
    }

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let discoverCBDTableViewCell = discoverTableView.dequeueReusableCell(withIdentifier: "discoverCBDTableViewCell") as! DiscoverCBDTableViewCell
        return discoverCBDTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }
    
    
}

