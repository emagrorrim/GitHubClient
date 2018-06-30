//
//  GitHubProfileViewDataSource.swift
//  StartKit
//
//  Created by Xin Guo  on 2018/6/29.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

class GitHubProfileViewDataSource: NSObject, UITableViewDataSource {  
  struct MenuItem {
    var accessory: UITableViewCellAccessoryType
    var title: String
    var color: UIColor
    var alignment: NSTextAlignment
    var action: (() -> Void)?
  }
  
  private let userProfile: UserProfile
  private let tableViewSections: [GitHubProfileViewSection] = [.user, .menu]
  
  private let headerCellIdentifier: String = "GitHubProfileHeaderCell"
  private let gitHubProfileMenuCellIdentifier: String = "GitHubProfileMenuCellIdentifier"
  private let menus: [MenuItem]
  
  init(userProfile: UserProfile, menus: [MenuItem]) {
    self.userProfile = userProfile
    self.menus = menus
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let listSection = GitHubProfileViewSection(rawValue: section) else {
      return 0
    }
    switch listSection {
    case .user:
      return 1
    case .menu:
      return menus.count
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return tableViewSections.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let section = GitHubProfileViewSection(rawValue: indexPath.section) else {
      return UITableViewCell()
    }
    switch section {
    case .user:
      guard
        let cell = tableView.dequeueReusableCell(withIdentifier: headerCellIdentifier, for: indexPath) as? GitHubProfileHeaderCell,
        let avatorURL = URL(string: self.userProfile.avatar_url) else {
          return UITableViewCell()
      }
      cell.avatorImageView.configureImage(withURL: avatorURL)
      cell.usernameLabel.text = self.userProfile.login
      return cell
    case .menu:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: gitHubProfileMenuCellIdentifier, for: indexPath) as? MenuItemCell else {
        return UITableViewCell()
      }
      let item = menus[indexPath.row]
      cell.accessoryType = item.accessory
      cell.textLabel?.text = item.title
      cell.textLabel?.textColor = item.color
      cell.textLabel?.textAlignment = item.alignment
      cell.action = item.action
      
      return cell
    }
  }
}
