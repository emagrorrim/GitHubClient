//
//  GitHubProfileViewDataSource.swift
//  StartKit
//
//  Created by Xin Guo  on 2018/6/29.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

class GitHubProfileViewDataSource: NSObject, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  private let headerCellIdentifier: String = "GitHubProfileHeaderCell"
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCell(withIdentifier: headerCellIdentifier, for: indexPath)
  }
}
