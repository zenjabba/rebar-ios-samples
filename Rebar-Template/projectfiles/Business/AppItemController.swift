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

import Foundation
import Rebar

class AppItemController<T: AppItem> {
	
	func getDatabase() -> FMDatabaseQueue? {
		preconditionFailure("You must define a database");
	}
	
	/**
	* Parses and stores raw data from the service
	*/
	func parseAndStore(items: [String:AnyObject]) {
		
	}
	
	/**
	* Stores a set of items in the database
	*/
	func store(items: [T]) {
		
		getDatabase()?.inDatabase({ (database: FMDatabase!) -> Void in
			for item in items {
				self.sync(item, database: database);
			}
		});
	}
	
	/**
	* Process an item to store into the database
	*/
	func sync(item: T, database: FMDatabase!) {
		
		// Grab the item id
		item.itemId = self.getItemId(item.itemRefId, database: database);
		
		// Save now
		self.commit(item, database: database);
	}
	
	/**
	* Commits a possibly identified item to the database
	*/
	func commit(item: T, database: FMDatabase!) {
		if (item.deleted != nil && item.deleted!) {
			delete(item, database: database);
		}
		else if (item.itemId > 0) {
			update(item, database: database);
		}
		else {
			add(item, database: database);
		}
	}
	
	/**
	* Adds an item to the database
	*/
	func add(item: T, database: FMDatabase!) {
		
	}
	
	/**
	* updates an item in the database
	*/
	func update(item: T, database: FMDatabase!) {
		
	}
	
	/**
	* Deletes an item from the database
	*/
	func delete(item: T, database: FMDatabase!) {
		delete(item.itemId!, database: database);
	}
	
	/**
	* Deletes an item from the database
	*/
	func delete(itemRefId: String, database: FMDatabase!) {
		delete(getItemId(itemRefId, database: database), database: database);
	}
	
	func delete(itemId: Int, database: FMDatabase!) {
		
	}
	
	/**
	* Reads an item from the database
	*/
	func read(resultSet: FMResultSet) -> T? {
		return nil;
	}
	
	
	/**
	* Retrieves all the items from the database
	*/
	func getAll() -> [T] {
		return [];
	}
	
	/**
	* Get an item id
	*/
	func getItemId(refId: String!, database: FMDatabase) -> Int {
		return -1;
	}
	
	/**
	* Retrieves a single item
	*/
	func get(refId: String!) -> T? {
		return nil;
	}
	
	/**
	* Retrieves a single item
	*/
	func get(refId: String!, database: FMDatabase) -> T? {
		return nil;
	}
	
	/**
	* Retrieves a single item
	*/
	func get(itemId: Int) -> T? {
		return nil;
	}
	
	/**
	* Retrieves a single item
	*/
	func get(itemId: Int, database: FMDatabase) -> T? {
		return nil;
	}

	
}