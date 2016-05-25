/// The MIT License (MIT)
///
/// Copyright (c) 2016 Monkton, Inc
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in all
/// copies or substantial portions of the Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
/// SOFTWARE.
///


import UIKit
import Rebar
import RebarSupport

@objc(RebarAppMainViewController)
class RebarAppMainViewController : RebarCoreViewController, UITableViewDataSource, UITableViewDelegate {
	
	var refreshControl: UIRefreshControl?;
	var hasLoaded: Bool = false;
	var items: [StoredAppItem]? = [];
	@IBOutlet var scheduleItemsTableView: UITableView!;
	
	// Load me
	required init() {
		super.init(nibName: "RebarAppMainViewController", bundle: NSBundle(forClass: self.dynamicType));
		
	}
	
	// Initalize
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
		
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated);
		
		if (!self.hasLoaded) {
			self.hasLoaded = true;
			delay(0.5) {
				self.syncWithServer();
			};
		}
		self.reload();
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews();
	}
	
	override func loadView() {
		super.loadView();
		
		// Initialize the refresh control.
		self.refreshControl = UIRefreshControl();
		self.refreshControl!.backgroundColor = RebarAppController.getInstance()!.getConfiguration()!.defaultColor();
		self.refreshControl!.tintColor = UIColor.whiteColor();
		self.refreshControl?.addTarget(self, action: #selector(RebarAppMainViewController.manuallyRefreshData), forControlEvents: UIControlEvents.ValueChanged);
		self.scheduleItemsTableView!.addSubview(self.refreshControl!);
		
		//
		self.scheduleItemsTableView.registerNib(UINib(nibName: "ScheduleMainTableViewCell", bundle: NSBundle(forClass: self.dynamicType)), forCellReuseIdentifier: "ScheduleMainTableViewCell");
		
		self.title = "Rebar App";
		
	}
	
}

/// Sync Methods for Network and Database
extension RebarAppMainViewController {
	
	
	/// Load the data from the database
	func reload() {
		
	}
	
	/// Call the server
	func syncWithServer() {
		
	}
	
	func manuallyRefreshData() {
		// Ask the handler to sync...
		delay(0.25) {
			self.syncWithServer();
		};
	}
}

/// UITableView implementation methods
extension RebarAppMainViewController {
	
	
	// MARK: Table Handlers
	
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 88;
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int  {
		return 1;
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items!.count;
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		// Grab a cell
		let cell = tableView.dequeueReusableCellWithIdentifier("ScheduleMainTableViewCell", forIndexPath: indexPath)
		
		// Grab the thread
		let item: StoredAppItem! = self.items![indexPath.row];
		
		// Set the text for the cell
		cell.textLabel?.text = item.text!;
		
		return cell
	}
	
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		// Grab the thread
		//		let item: StoredAppItem! = self.items![indexPath.row];
		
		let vc = UIViewController();
		self.navigationController?.pushViewController(vc, animated: true);
	}
	
}
