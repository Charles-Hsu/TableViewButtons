//
//  ViewController.swift
//  TableViewButtons
//
//  Created by Charles Hsu on 7/23/15.
//  Copyright (c) 2015 Pro Andy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var objects:NSMutableArray! = NSMutableArray()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.objects.addObject("iPhone")
    self.objects.addObject("Apple Watch")
    self.objects.addObject("Mac")
    
    self.tableView.reloadData()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Table View
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objects.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
    
    cell.titleLabel.text = self.objects.objectAtIndex(indexPath.row) as? String
    cell.shareButton.tag = indexPath.row
    
    cell.shareButton.addTarget(self, action: "logAction:", forControlEvents: UIControlEvents.TouchUpInside)
    
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    self.performSegueWithIdentifier("showNewView", sender: self)
  }
  
  func logAction(sender: UIButton) {
    
    let titleString = self.objects.objectAtIndex(sender.tag) as? String
    
    let firstActivityItem = "\(titleString!)"
    
    let activityViewControlle:UIActivityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
    
    self.presentViewController(activityViewControlle, animated: true, completion: nil)
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    println("\(__FUNCTION__)")
    
    if segue.identifier == "showNewView" {
      
      var upcoming: NewViewController = segue.destinationViewController as! NewViewController
      
      let indexPath = self.tableView.indexPathForSelectedRow()!
      
      let titleString = self.objects.objectAtIndex(indexPath.row) as? String
      
      upcoming.titleString = titleString
      
      self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
  }
  
}















