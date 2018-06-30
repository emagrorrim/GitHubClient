//
//  MenuItemCell.swift
//  StartKit
//
//  Created by Xin Guo  on 2018/6/30.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

class MenuItemCell: UITableViewCell {

  var action: (() -> Void)?
  
  override func awakeFromNib() {
    self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
  }
  
  @objc private func tapAction() {
    self.action?()
  }
}
