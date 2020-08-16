//
//  CommunitiesAllTableViewController.swift
//  yavka
//
//  Created by Сергей Журавлёв on 11.08.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CommunityTableViewCellId"

class CommunitiesAllTableViewController: UITableViewController {
    
    var communitiesAll: [Community] = []
    
    var selectedCommunity = [Community]()
    var selectedIndex: IndexPath?
    
    private func generateCommunitiesAll() {
        var community1 = Community(communityImageName: "com1", communityName: "Community 1", isAdded: true)
        var community2 = Community(communityImageName: "com2", communityName: "Community 2", isAdded: true)
        var community3 = Community(communityImageName: "com3", communityName: "Community 3", isAdded: true)
        var community4 = Community(communityImageName: "com4", communityName: "Community 4", isAdded: true)
        var community5 = Community(communityImageName: "com5", communityName: "Community 5", isAdded: true)
        var community6 = Community(communityImageName: "com6", communityName: "Community 6", isAdded: false)
        var community7 = Community(communityImageName: "com7", communityName: "Community 7", isAdded: false)
        var community8 = Community(communityImageName: "com8", communityName: "Community 8", isAdded: false)
        var community9 = Community(communityImageName: "com9", communityName: "Community 9", isAdded: false)
        communitiesAll.append(community1)
        communitiesAll.append(community2)
        communitiesAll.append(community3)
        communitiesAll.append(community4)
        communitiesAll.append(community5)
        communitiesAll.append(community6)
        communitiesAll.append(community7)
        communitiesAll.append(community8)
        communitiesAll.append(community9)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        generateCommunitiesAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return communitiesAll.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CommunityTableViewCell
        let community = communitiesAll[indexPath.row]
        cell.configure(for: community)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let selectedIndex = self.tableView.indexPathForSelectedRow?.row else { return }
        selectedCommunity.append(communitiesAll[selectedIndex])
        self.selectedIndex?.row = selectedIndex
    }
}
