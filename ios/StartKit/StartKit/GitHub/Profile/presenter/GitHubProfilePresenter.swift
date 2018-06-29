//
//  GitHubProfilePresenter.swift
//  StartKit
//
//  Created by Xin Guo  on 2018/6/29.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

protocol GitHubProfilePresenter {
  func configureProfilePage(with userProfile: UserProfile)
  func configureEmptyPage()
}

class GitHubProfilePresenterImpl: GitHubProfilePresenter {
  func configureProfilePage(with userProfile: UserProfile) {
    
  }
  
  func configureEmptyPage() {
    
  }
}
