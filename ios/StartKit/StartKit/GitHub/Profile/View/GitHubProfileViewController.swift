//
//  GitHubProfileViewController.swift
//  StartKit
//
//  Created by Xin Guo  on 2018/6/28.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

protocol GitHubProfileView {
  func configure(with dataSource: GitHubProfileViewDataSource)
}

class GitHubProfileViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  var interactor: GitHubProfileInteractor!
  
  private var dataSource: GitHubProfileViewDataSource!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.tableFooterView = UIView()
  }
}

extension GitHubProfileViewController: GitHubProfileView {
  func configure(with dataSource: GitHubProfileViewDataSource) {
    self.dataSource = dataSource
    self.tableView.dataSource = dataSource
    self.tableView.reloadData()
  }
}
