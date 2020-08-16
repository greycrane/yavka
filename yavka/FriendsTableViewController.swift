//
//  FriendsTableViewController.swift
//  yavka
//
//  Created by Сергей Журавлёв on 11.08.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FriendTableViewCellId"

class FriendsTableViewController: UITableViewController {
    
    var friendsAdded: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        generateFriends()
    }
    
    private func generateFriends() {
        let friend1 = Friend(friendAvatarName: "ava1", friendName: "Alex Stones", friendPhotosName: ["pic1", "pic2", "pic3"])
        let friend2 = Friend(friendAvatarName: "ava2", friendName: "Jack Wood", friendPhotosName: ["pic2", "pic3", "pic4"])
        let friend3 = Friend(friendAvatarName: "ava3", friendName: "Christian Willis", friendPhotosName: ["pic3", "pic4", "pic5"])
        let friend4 = Friend(friendAvatarName: "ava4", friendName: "John Smith", friendPhotosName: ["pic4", "pic5"])
        let friend5 = Friend(friendAvatarName: "ava5", friendName: "Jane Smithson", friendPhotosName: ["pic5", "pic2", "pic3", "pic1"])
        friendsAdded.append(friend1)
        friendsAdded.append(friend2)
        friendsAdded.append(friend3)
        friendsAdded.append(friend4)
        friendsAdded.append(friend5)
        friendsAdded.append(friend1)
        friendsAdded.append(friend2)
        friendsAdded.append(friend3)
        friendsAdded.append(friend4)
        friendsAdded.append(friend5)
        friendsAdded.append(friend1)
        friendsAdded.append(friend2)
        friendsAdded.append(friend3)
        friendsAdded.append(friend4)
        friendsAdded.append(friend5)
        friendsAdded.append(friend1)
        friendsAdded.append(friend2)
        friendsAdded.append(friend3)
        friendsAdded.append(friend4)
        friendsAdded.append(friend5)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsAdded.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FriendTableViewCell
        let friend = friendsAdded[indexPath.row]
        cell.configure(for: friend)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFriend = friendsAdded[indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: "FriendPhotosCollectionViewControllerId") as! FriendPhotosCollectionViewController
        vc.selectedModel = selectedFriend
        vc.friendPhotosNames = selectedFriend.friendPhotosName
        self.show(vc, sender: nil)
    }
}
