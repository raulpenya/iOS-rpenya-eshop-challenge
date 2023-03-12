//
//  ProductsListUITests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 12/3/23.
//

import XCTest

final class ProductsListUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func waitForProductList() {
        let predicate = NSPredicate(format: "identifier == 'products_list'")
        let list = app.collectionViews.containing(predicate).element(boundBy: 0)
        XCTAssertTrue(list.waitForExistence(timeout: 5))
        XCTAssertEqual(list.children(matching: .cell).count, 3)
    }
    
    func test_initialLoad_success() {
        let predicate = NSPredicate(format: "identifier == 'products_list'")
        let list = app.collectionViews.containing(predicate).element(boundBy: 0)
        XCTAssertTrue(list.waitForExistence(timeout: 5))
        XCTAssertEqual(list.children(matching: .cell).count, 3)
    }
    
    func test_productsList_addRemoveItems() throws {
        waitForProductList()
        let predicate = NSPredicate(format: "identifier == 'unit_text'")
        let text = app.staticTexts.containing(predicate).element(boundBy: 0)
        XCTAssertEqual(text.label, "0")
        let buttonAdd = app.collectionViews.children(matching: .cell).element(boundBy: 0).buttons["+"]
        buttonAdd.tap()
        buttonAdd.tap()
        buttonAdd.tap()
        buttonAdd.tap()
        XCTAssertEqual(text.label, "4")
        let buttonRemove = XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 0).buttons["-"]
        buttonRemove.tap()
        buttonRemove.tap()
        buttonRemove.tap()
        buttonRemove.tap()
        XCTAssertEqual(text.label, "0")
    }
    
    func test_productsList_remove_notpossible() throws {
        waitForProductList()
        let predicate = NSPredicate(format: "identifier == 'unit_text'")
        let text = app.staticTexts.containing(predicate).element(boundBy: 0)
        XCTAssertEqual(text.label, "0")
        let buttonRemove = XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 0).buttons["-"]
        buttonRemove.tap()
        buttonRemove.tap()
        buttonRemove.tap()
        buttonRemove.tap()
        XCTAssertEqual(text.label, "0")
    }
    
    func test_proceedcheckout_navigation_success() {
        waitForProductList()
        let predicateButton = NSPredicate(format: "identifier == 'product_list_complete_button'")
        let button = app.buttons.containing(predicateButton).element(boundBy: 0)
        let buttonAdd = app.collectionViews.children(matching: .cell).element(boundBy: 0).buttons["+"]
        buttonAdd.tap()
        button.tap()
        let predicate3 = NSPredicate(format: "identifier == 'shopping_basket_list'")
        let shoppingBasketList = app.collectionViews.containing(predicate3).element(boundBy: 0)
        XCTAssertTrue(shoppingBasketList.waitForExistence(timeout: 5))
        XCTAssertEqual(shoppingBasketList.children(matching: .cell).count, 1)
    }
    
    func test_proceedcheckout_navigation_unsuccess() {
        waitForProductList()
        let predicateButton = NSPredicate(format: "identifier == 'product_list_complete_button'")
        let button = app.buttons.containing(predicateButton).element(boundBy: 0)
        button.tap()
        let predicate3 = NSPredicate(format: "identifier == 'shopping_basket_list'")
        let shoppingBasketList = app.collectionViews.containing(predicate3).element(boundBy: 0)
        XCTAssertFalse(shoppingBasketList.waitForExistence(timeout: 5))
    }
}
