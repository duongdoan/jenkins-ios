//
//  BuildsTableViewController.swift
//  JenkinsiOS
//
//  Created by Robert on 29.09.16.
//  Copyright © 2016 MobiLab Solutions. All rights reserved.
//

import UIKit

class BuildsTableViewController: UITableViewController {

    var builds: [Build]?
    var account: Account?
    
    override func viewDidLoad() {
        print(builds)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return builds?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.buildCell, for: indexPath)
        cell.textLabel?.text = "#\(builds![indexPath.row].number)"
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(sender)
        if let s = sender as? UITableViewCell, let dest = segue.destination as? BuildViewController, segue.identifier == Constants.Identifiers.showBuildSegue, let indexPath = tableView.indexPath(for: s){
            dest.build = builds?[indexPath.row]
            dest.account = account
        }
    }

}