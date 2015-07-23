//
//  NewViewController.swift
//  TableViewButtons
//
//  Created by Charles Hsu on 7/23/15.
//  Copyright (c) 2015 Pro Andy. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  var titleString:String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.titleLabel.text = self.titleString
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
