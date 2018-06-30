//
//  GitHubProfileViewController.swift
//  StartKit
//
//  Created by Xin Guo  on 2018/6/28.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

enum GitHubProfileViewSection: Int {
  case user
  case menu
}

protocol GitHubProfileView: class {
  func configure(with dataSource: GitHubProfileViewDataSource)
}

class GitHubProfileViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  var interactor: (GitHubProfileInteractor & UITableViewDelegate)!
  
  private var dataSource: GitHubProfileViewDataSource!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    GitHubProfileConfiguration.configure(viewController: self)
    
    self.setupTableView()
    self.loadData()
  }
  
  private func setupTableView() {
    self.tableView.delegate = self.interactor
    self.tableView.backgroundColor = UIColor.groupTableViewBackground
    self.tableView.estimatedRowHeight = 200
    self.tableView.tableFooterView = UIView()
  }
  
  private func loadData() {
    self.interactor.loadUserProfile()
  }
}

extension GitHubProfileViewController: GitHubProfileView {
  func configure(with dataSource: GitHubProfileViewDataSource) {
    self.dataSource = dataSource
    self.tableView.dataSource = dataSource
    self.tableView.reloadData()
  }
}
