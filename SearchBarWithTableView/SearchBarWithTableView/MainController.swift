//
//  MainController.swift
//  SearchBarWithTableView
//
//  Created by Tim Fuqua on 4/29/16.
//  Copyright © 2016 Tim Fuqua. All rights reserved.
//

import UIKit

let shouldDebugPrint: Bool = false
let debugPrint: (()->()) -> () = { closure in
	if shouldDebugPrint {
		closure()
	}
}

// MARK: - MainController: UIViewController
/**

*/
class MainController: UIViewController {
	
	// MARK: static vars
	// MARK: private lets
	
	/// The states
	private let theStates: String = "Alabama - Montgomery, Alaska - Juneau, Arizona - Phoenix, Arkansas - Little Rock, California - Sacramento, Colorado - Denver, Connecticut - Hartford, Delaware - Dover, Florida - Tallahassee, Georgia - Atlanta, Hawaii - Honolulu, Idaho - Boise, Illinois - Springfield, Indiana - Indianapolis, Iowa - Des Moines, Kansas - Topeka, Kentucky - Frankfort, Louisiana - Baton Rouge, Maine - Augusta, Maryland - Annapolis, Massachusetts - Boston, Michigan - Lansing, Minnesota - St. Paul, Mississippi - Jackson, Missouri - Jefferson City, Montana - Helena, Nebraska - Lincoln, Nevada - Carson City, New Hampshire - Concord, New Jersey - Trenton, New Mexico - Santa Fe, New York - Albany, North Carolina - Raleigh, North Dakota - Bismarck, Ohio - Columbus, Oklahoma - Oklahoma City, Oregon - Salem, Pennsylvania - Harrisburg, Rhode Island - Providence, South Carolina - Columbia, South Dakota - Pierre, Tennessee - Nashville, Texas - Austin, Utah - Salt Lake City, Vermont - Montpelier, Virginia - Richmond, Washington - Olympia, West Virginia - Charleston, Wisconsin - Madison, Wyoming - Cheyenne"
	
	// MARK: private vars (computed)
	
	/// The section titles
	private var sectionTitles: [String] {
		var titles = Set<String>()
		
		for item in dataSource where item.name.isEmpty == false {
			titles.insert("\(item.name.characters.first!)")
		}
		
		return titles.sort()
	}
	
	// MARK: private vars
	
	/// The data source
	private var fullDataSource: [StateInfo]? = nil {
		didSet {
			updateDataSource()
		}
	}
	/// The filtered data source
	private var filteredDataSource: [StateInfo]? = nil {
		didSet {
			updateDataSource()
		}
	}
	
	/// The data source
	private var indexedFullDataSource: [String : [StateInfo]]? = nil
	/// The filtered data source
	private var indexedFilteredDataSource: [String : [StateInfo]]? = nil
	
	// MARK: private(set) vars
	
	/// The data source being used to populate the table (full list or filtered list)
	private(set) var dataSource: [StateInfo] = [] {
		didSet {
			tableView?.reloadData()
		}
	}
	
	/// The data source being used to populate the table (full list or filtered list)
	private(set) var indexedDataSource: [String : [StateInfo]] = [:] {
		didSet {
			tableView?.reloadData()
		}
	}
	
	/// The search controller
	private(set) var searchController: UISearchController!

	// MARK: lets
	// MARK: vars (computed)
	// MARK: vars
	
	// MARK: @IBOutlets
	@IBOutlet weak var searchView: UIView!
	@IBOutlet weak var tableView: UITableView!
	
	// MARK: init
	
	// MARK: vc lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		fullDataSource = theStates.componentsSeparatedByString(", ").map({ StateInfo(rawStateString: $0, delimitedBy: " - ") })
		
		debugPrint {
			print("\n\n")
			print("indexedDataSource:")
			print(self.indexedDataSource)
			print("\n\n")
		}
		
		initializeSearchController()
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		guard let stateDetailController = segue.destinationViewController as? StateDetailController else {
			print("prepareForSegue: Error getting destingationViewController as StateDetailController")
			return
		}
		
		guard let indexPath = tableView.indexPathForSelectedRow, let sectionIndexTitle = self.tableView(self.tableView, titleForHeaderInSection: indexPath.section), let sectionDataSource = indexedDataSource[sectionIndexTitle] else {
			print("prepareForSegue: indexPath is nil, or sectionIndexTitle is nil, or sectionDataSource is nil")
			return
		}
		
		stateDetailController.stateInfo = sectionDataSource[indexPath.row]
	}
	
	// MARK: @IBActions
	
	// MARK: public funcs
	
	// MARK: private funcs
	
	//	/**
	//	*/
	//	private func privateFuncTemplate() {
	//	}
	
	/**
	http://stackoverflow.com/a/29309811/4273137
	*/
	private func initializeSearchController() {
		searchController = UISearchController(searchResultsController: nil)
		
		// The object responsible for updating the contents of the search results controller.
		searchController.searchResultsUpdater = self
		
		searchController.hidesNavigationBarDuringPresentation = false

		// Determines whether the underlying content is dimmed during a search.
		// if we are presenting the display results in the same view, this should be false
		searchController.dimsBackgroundDuringPresentation = false
		
		// Make sure the that the search bar is visible within the navigation bar.
		searchController.searchBar.sizeToFit()
		
		// Include the search controller's search bar within the search view.
//		searchView = searchController.searchBar
		searchView.addSubview(searchController.searchBar)
		
		definesPresentationContext = true
	}
	
	/**
	*/
	private func updateDataSource() {
		// if the fullDataSource is nil, then the dataSource is an empty array
		// else if the filteredDataSource is non-nil, the dataSource is the filteredDataSource
		// else the dataSource is the fullDataSource
		if fullDataSource == nil {
			dataSource = []
		} else if filteredDataSource != nil {
			dataSource = filteredDataSource!
		} else {
			dataSource = fullDataSource!
		}
		
		updateIndexedDataSources()
	}
	
	/**
	*/
	private func updateIndexedDataSources() {
		updateIndexedFullDataSource()
		updateIndexedFilteredDataSource()
		
		if indexedFullDataSource == nil {
			indexedDataSource = [:]
		} else if indexedFilteredDataSource != nil {
			indexedDataSource = indexedFilteredDataSource!
		} else {
			indexedDataSource = indexedFullDataSource!
		}
	}
	
	/**
	*/
	private func updateIndexedFullDataSource() {
		updateIndexedDataSource(&indexedFullDataSource, fromDataSource: fullDataSource)
	}
	
	/**
	*/
	private func updateIndexedFilteredDataSource() {
		updateIndexedDataSource(&indexedFilteredDataSource, fromDataSource: filteredDataSource)
	}
	
	private func updateIndexedDataSource(inout indexedDataSource: [String : [StateInfo]]?, fromDataSource updateDataSource: [StateInfo]?) {
		guard let updateDataSource = updateDataSource else {
			indexedDataSource = nil
			return
		}
		
		indexedDataSource = [:]
		
		for item in updateDataSource {
			if let indexTitle = item.indexTitle {
				if let arrayAtIndex = indexedDataSource?[indexTitle] {
					let newArrayAtIndex = arrayAtIndex + [item]
					indexedDataSource?.updateValue(newArrayAtIndex, forKey: indexTitle)
				} else {
					indexedDataSource?.updateValue([item], forKey: indexTitle)
				}
				
			}
		}
	}
	
	/**
	*/
	private func filterStatesForSearchText(searchText: String) {
		if searchText.isEmpty {
			return
		}
		
		if fullDataSource == nil {
			filteredDataSource = nil
			return
		}
		
		filteredDataSource = fullDataSource?.filter { return $0.name.lowercaseString.containsString(searchText.lowercaseString) || $0.capital.lowercaseString.containsString(searchText.lowercaseString) }
		debugPrint {
			print(self.filteredDataSource)
		}
	}
	
	// MARK: static funcs
	
}

// MARK: - MainController: UITableViewDataSource
/**

*/
extension MainController: UITableViewDataSource {
	
	//  @available(iOS 2.0, *)
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let sectionIndexTitle = self.tableView(self.tableView, titleForHeaderInSection: section), let sectionDataSource = indexedDataSource[sectionIndexTitle] else {
			debugPrint {
				print("tableView(:_numberOfRowsInSection:) sectionIndexTitle was nil, or sectionDataSource was nil")
			}
			return 0
		}
		
		debugPrint {
			print("tableView(:_numberOfRowsInSection:) sectionDataSource.count: \(sectionDataSource.count)")
		}
		return sectionDataSource.count
	}
	
	//  // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
	//  // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
	//
	//  @available(iOS 2.0, *)
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let stateCellIdentifier: String = "stateCell"
		guard let cell = tableView.dequeueReusableCellWithIdentifier(stateCellIdentifier) else {
			debugPrint {
				print("tableView(_:cellForRowAtIndexPath:) Couldn't dequeue a cell with identifier: \(stateCellIdentifier)")
			}
			return UITableViewCell()
		}
		
		guard let sectionIndexTitle = self.tableView(self.tableView, titleForHeaderInSection: indexPath.section), let sectionDataSource = indexedDataSource[sectionIndexTitle] else {
			debugPrint {
				print("tableView(_:cellForRowAtIndexPath:) sectionIndexTitle was nil, or sectionDataSource was nil")
			}
			return UITableViewCell()
		}
		
		debugPrint {
			print("tableView(_:cellForRowAtIndexPath:) sectionDataSource[indexPath.row]: \(sectionDataSource[indexPath.row])")
		}
		cell.textLabel?.text = sectionDataSource[indexPath.row].name
		cell.detailTextLabel?.text = sectionDataSource[indexPath.row].capital
		
		return cell
	}
	
	// Default is 1 if not implemented
	//  @available(iOS 2.0, *)
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		debugPrint {
			print("numberOfSectionsInTableView(_:) indexedDataSource.keys.count: \(self.indexedDataSource.keys.count)")
		}
		return indexedDataSource.keys.count
	}
	
	//
	// fixed font style. use custom view (UILabel) if you want something different
	//  @available(iOS 2.0, *)
	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		guard section < indexedDataSource.keys.count else {
			debugPrint {
				print("tableView(_:titleForHeaderInSection:) section index is greater than number of sections in indexedDataSource")
			}
			return "ERROR"
		}
		
		debugPrint {
			print("tableView(_:titleForHeaderInSection:) indexedDataSource.keys.sort()[section]: \(self.indexedDataSource.keys.sort()[section])")
		}
		return indexedDataSource.keys.sort()[section]
	}
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String?
	//
	//  // Editing
	//
	//  // Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
	//
	//  // Moving/reordering
	//
	//  // Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
	//
	//  // Index
	//
	// return list of section titles to display in section index view (e.g. "ABCD...Z#")
	//  @available(iOS 2.0, *)
	func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
		debugPrint {
			print("sectionIndexTitlesForTableView(_:) indexedDataSource.keys.sort(): \(self.indexedDataSource.keys.sort())")
		}
		return indexedDataSource.keys.sort()
	}
	// tell table which section corresponds to section title/index (e.g. "B",1))
	//  @available(iOS 2.0, *)
	func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
		debugPrint {
			print("tableView(_:sectionForSectionIndexTitle:atIndex:) indexedDataSource.keys.sort().indexOf(title)!: \(self.indexedDataSource.keys.sort().indexOf(title)!)")
		}
		return indexedDataSource.keys.sort().indexOf(title)!
	}
	//
	//  // Data manipulation - insert and delete support
	//
	//  // After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
	//  // Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
	//
	//  // Data manipulation - reorder / moving support
	//
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
	
}

// MARK: - MainController: UITableViewDelegate
/**

*/
extension MainController: UITableViewDelegate {
	
	//  // Display customization
	//
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
	//  @available(iOS 6.0, *)
	//  optional public func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
	//  @available(iOS 6.0, *)
	//  optional public func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int)
	//  @available(iOS 6.0, *)
	//  optional public func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
	//  @available(iOS 6.0, *)
	//  optional public func tableView(tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int)
	//  @available(iOS 6.0, *)
	//  optional public func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int)
	//
	//  // Variable height support
	//
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
	//
	//  // Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
	//  // If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
	//  @available(iOS 7.0, *)
	//  optional public func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
	//  @available(iOS 7.0, *)
	//  optional public func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat
	//  @available(iOS 7.0, *)
	//  optional public func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat
	//
	//  // Section header & footer information. Views are preferred over title should you decide to provide both
	//
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? // custom view for header. will be adjusted to default or specified header height
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? // custom view for footer. will be adjusted to default or specified footer height
	//
	//  // Accessories (disclosures).
	//
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath)
	//
	//  // Selection
	//
	//  // -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
	//  // Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
	//  @available(iOS 6.0, *)
	//  optional public func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool
	//  @available(iOS 6.0, *)
	//  optional public func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath)
	//  @available(iOS 6.0, *)
	//  optional public func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath)
	//
	//  // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath?
	//  @available(iOS 3.0, *)
	//  optional public func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath?
	//  // Called after the user changes the selection.
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
	//  @available(iOS 3.0, *)
	//  optional public func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
	//
	//  // Editing
	//
	//  // Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle
	//  @available(iOS 3.0, *)
	//  optional public func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String?
	//  @available(iOS 8.0, *)
	//  optional public func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? // supercedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
	//
	//  // Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool
	//
	//  // The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath)
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath)
	//
	//  // Moving/reordering
	//
	//  // Allows customization of the target row for a particular row as it is being moved/reordered
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath
	//
	//  // Indentation
	//
	//  @available(iOS 2.0, *)
	//  optional public func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int // return 'depth' of row for hierarchies
	//
	//  // Copy/Paste.  All three methods must be implemented by the delegate.
	//
	//  @available(iOS 5.0, *)
	//  optional public func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool
	//  @available(iOS 5.0, *)
	//  optional public func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool
	//  @available(iOS 5.0, *)
	//  optional public func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?)
	//
	//  // Focus
	//
	//  @available(iOS 9.0, *)
	//  optional public func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool
	//  @available(iOS 9.0, *)
	//  optional public func tableView(tableView: UITableView, shouldUpdateFocusInContext context: UITableViewFocusUpdateContext) -> Bool
	//  @available(iOS 9.0, *)
	//  optional public func tableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator)
	//  @available(iOS 9.0, *)
	//  optional public func indexPathForPreferredFocusedViewInTableView(tableView: UITableView) -> NSIndexPath?
	
}

// MARK: - MainController: UISearchBarDelegate
/**

*/
extension MainController: UISearchBarDelegate {
	
	//	@available(iOS 2.0, *)
	//	optional public func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool // return NO to not become first responder
	//	@available(iOS 2.0, *)
	//	optional public func searchBarTextDidBeginEditing(searchBar: UISearchBar) // called when text starts editing
	//	@available(iOS 2.0, *)
	//	optional public func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool // return NO to not resign first responder
	//	@available(iOS 2.0, *)
	//	optional public func searchBarTextDidEndEditing(searchBar: UISearchBar) // called when text ends editing
	//	@available(iOS 2.0, *)
	//	optional public func searchBar(searchBar: UISearchBar, textDidChange searchText: String) // called when text changes (including clear)
	//	@available(iOS 3.0, *)
	//	optional public func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool // called before text changes
	//
	//	@available(iOS 2.0, *)
	//	optional public func searchBarSearchButtonClicked(searchBar: UISearchBar) // called when keyboard search button pressed
	//	@available(iOS 2.0, *)
	//	optional public func searchBarBookmarkButtonClicked(searchBar: UISearchBar) // called when bookmark button pressed
	//	@available(iOS 2.0, *)
	//	optional public func searchBarCancelButtonClicked(searchBar: UISearchBar) // called when cancel button pressed
	//	@available(iOS 3.2, *)
	//	optional public func searchBarResultsListButtonClicked(searchBar: UISearchBar) // called when search results button pressed
	//
	//	@available(iOS 3.0, *)
	//	optional public func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int)
	
}

// MARK: - MainController: UISearchDisplayDelegate
/**

*/
extension MainController: UISearchDisplayDelegate {
	
	//	// when we start/end showing the search UI
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayControllerWillBeginSearch(controller: UISearchDisplayController)
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayControllerDidBeginSearch(controller: UISearchDisplayController)
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayControllerWillEndSearch(controller: UISearchDisplayController)
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayControllerDidEndSearch(controller: UISearchDisplayController)
	//
	//	// called when the table is created destroyed, shown or hidden. configure as necessary.
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayController(controller: UISearchDisplayController, didLoadSearchResultsTableView tableView: UITableView)
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayController(controller: UISearchDisplayController, willUnloadSearchResultsTableView tableView: UITableView)
	//
	//	// called when table is shown/hidden
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayController(controller: UISearchDisplayController, willShowSearchResultsTableView tableView: UITableView)
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayController(controller: UISearchDisplayController, didShowSearchResultsTableView tableView: UITableView)
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayController(controller: UISearchDisplayController, willHideSearchResultsTableView tableView: UITableView)
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayController(controller: UISearchDisplayController, didHideSearchResultsTableView tableView: UITableView)
	//
	//	// return YES to reload table. called when search string/option changes. convenience methods on top UISearchBar delegate methods
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool
	//	@available(iOS, introduced=3.0, deprecated=8.0)
	//	optional public func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool
	
}

// MARK: - MainController: UISearchResultsUpdating
/**

*/
extension MainController: UISearchResultsUpdating {
	
	// Called when the search bar's text or scope has changed or when the search bar becomes first responder.
	//	@available(iOS 8.0, *)
	func updateSearchResultsForSearchController(searchController: UISearchController) {
		filterStatesForSearchText(searchController.searchBar.text ?? "")
	}
	
}


