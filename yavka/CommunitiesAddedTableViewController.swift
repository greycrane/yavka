//
//  CommunitiesAddedTableViewController.swift
//  yavka
//
//  Created by Сергей Журавлёв on 11.08.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CommunityTableViewCellId"

class CommunitiesAddedTableViewController: UITableViewController {
    
    var communitiesAdded: [Community] = []
    var selectedIndex: Int = 0
    
    private func generateCommunitiesAdded() {
        let community1 = Community(communityImageName: "com1", communityName: "Community 1", isAdded: true)
        let community2 = Community(communityImageName: "com2", communityName: "Community 2", isAdded: true)
        let community3 = Community(communityImageName: "com3", communityName: "Community 3", isAdded: true)
        let community4 = Community(communityImageName: "com4", communityName: "Community 4", isAdded: true)
        let community5 = Community(communityImageName: "com5", communityName: "Community 5", isAdded: true)
        communitiesAdded.append(community1)
        communitiesAdded.append(community2)
        communitiesAdded.append(community3)
        communitiesAdded.append(community4)
        communitiesAdded.append(community5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        generateCommunitiesAdded()
        print("Added did load")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return communitiesAdded.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CommunityTableViewCell
        let community = communitiesAdded[indexPath.row]
        cell.configure(for: community)
        return cell
    }
    
    @IBAction func addButtonDidpressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "CommunitiesAllTableViewControllerId") as! CommunitiesAllTableViewController
        self.show(vc, sender: nil)
    }
    
    
    
    @IBAction func unwindToCommunitiesAdded(sender: UIStoryboardSegue) {
        if let source = sender.source as? CommunitiesAllTableViewController {
            guard let selectedIndex = source.tableView.indexPathForSelectedRow?.row else { return }
            self.selectedIndex = selectedIndex
            let selectedCommunity = source.communitiesAll[self.selectedIndex]
            if selectedCommunity.isAdded { return }
            else {
                communitiesAdded.append(Community(communityImageName: selectedCommunity.communityImageName, communityName: selectedCommunity.communityName, isAdded: true))
                source.communitiesAll[selectedIndex] = Community(communityImageName: selectedCommunity.communityImageName, communityName: selectedCommunity.communityName, isAdded: false)
                source.tableView.reloadData()
                tableView.reloadData()
            }
        }
    }
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
