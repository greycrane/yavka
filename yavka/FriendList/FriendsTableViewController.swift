//
//  FriendsTableViewController.swift
//  yavka
//
//  Created by Сергей Журавлёв on 11.08.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FriendTableViewCellId"

@IBDesignable class FriendsTableViewController: UITableViewController {
    
    var friendsAdded: [Friend] = []
    var friendsDictionary = [String: [String]]()
    var friendsSectionTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        generateFriends()
        
        for friend in friendsAdded {
            let friendKey = String(friend.friendName.prefix(1))
            if var friendsValues = friendsDictionary[friendKey] {
                friendsValues.append(friend.friendName)
                friendsDictionary[friendKey] = friendsValues
            } else {
                friendsDictionary[friendKey] = [friend.friendName]
            }
        }
        
        friendsSectionTitles = [String](friendsDictionary.keys)
        friendsSectionTitles = friendsSectionTitles.sorted(by: { $0 < $1 })
    }
    
    private func generateFriends() {
        let friend01 = Friend(friendAvatarName: "ava01", friendName: "Alexa Stones", friendPhotosName: ["pic01", "pic02", "pic03"])
        let friend02 = Friend(friendAvatarName: "ava02", friendName: "Bob Wood", friendPhotosName: ["pic04", "pic05", "pic06", "pic07"])
        let friend03 = Friend(friendAvatarName: "ava03", friendName: "Christian Willis", friendPhotosName: ["pic8", "pic9", "pic10", "pic11", "pic12"])
        let friend04 = Friend(friendAvatarName: "ava04", friendName: "Cameron Smith", friendPhotosName: ["pic13", "pic14"])
        let friend05 = Friend(friendAvatarName: "ava05", friendName: "Carla Smithson", friendPhotosName: ["pic15", "pic16", "pic17", "pic18", "pic19", "pic20"])
        let friend06 = Friend(friendAvatarName: "ava06", friendName: "Andy Powers", friendPhotosName: ["pic01", "pic02", "pic03"])
        let friend07 = Friend(friendAvatarName: "ava07", friendName: "Carl McFly", friendPhotosName: ["pic04", "pic05", "pic06", "pic07"])
        let friend08 = Friend(friendAvatarName: "ava08", friendName: "Richard Katz", friendPhotosName: ["pic8", "pic9", "pic10", "pic11", "pic12"])
        let friend09 = Friend(friendAvatarName: "ava09", friendName: "Kate Washington-Brown", friendPhotosName: ["pic13", "pic14"])
        let friend10 = Friend(friendAvatarName: "ava10", friendName: "Mike Porter", friendPhotosName: ["pic15", "pic16", "pic17", "pic18", "pic19", "pic20"])
        friendsAdded.append(friend01)
        friendsAdded.append(friend02)
        friendsAdded.append(friend03)
        friendsAdded.append(friend04)
        friendsAdded.append(friend05)
        friendsAdded.append(friend06)
        friendsAdded.append(friend07)
        friendsAdded.append(friend08)
        friendsAdded.append(friend09)
        friendsAdded.append(friend10)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let friendKey = friendsSectionTitles[section]
        if let friendsValues = friendsDictionary[friendKey] {
            return friendsValues.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FriendTableViewCell
        let sectionLetter = friendsSectionTitles[indexPath.section]
        let friend = friendsAdded[indexPath.row]
        cell.configure(for: friend)
        
        if let friendName = friendsDictionary[sectionLetter] {
            cell.nameLabel.text = friendName[indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFriend = friendsAdded[indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: "FriendPhotosCollectionViewControllerId") as! FriendPhotosCollectionViewController
        vc.selectedModel = selectedFriend
        vc.friendPhotosNames = selectedFriend.friendPhotosName
        self.show(vc, sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsSectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSectionTitles
    }
}
