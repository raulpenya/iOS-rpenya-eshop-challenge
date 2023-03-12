//
//  ShoppingBasketDetailUITests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 12/3/23.
//

import XCTest

final class ShoppingBasketDetailUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func waitForShoppingBasketList() {
        let predicate = NSPredicate(format: "identifier == 'products_list'")
        let list = app.collectionViews.containing(predicate).element(boundBy: 0)
        XCTAssertTrue(list.waitForExistence(timeout: 5))
        XCTAssertEqual(list.children(matching: .cell).count, 3)
        let predicateButton = NSPredicate(format: "identifier == 'product_list_complete_button'")
        let button = app.buttons.containing(predicateButton).element(boundBy: 0)
        let buttonAdd = app.collectionViews.children(matching: .cell).element(boundBy: 0).buttons["+"]
        buttonAdd.tap()
        button.tap()
        let predicate3 = NSPredicate(format: "identifier == 'shopping_basket_list'")
        let shoppingBasketList = app.collectionViews.containing(predicate3).element(boundBy: 0)
        XCTAssertTrue(shoppingBasketList.waitForExistence(timeout: 2))
    }
    
    func test_cancelButton() {
        waitForShoppingBasketList()
        let predicateButton = NSPredicate(format: "identifier == 'cancel_button'")
        let button = app.buttons.containing(predicateButton).element(boundBy: 0)
        button.tap()
        let predicateShoppingbasket = NSPredicate(format: "identifier == 'shopping_basket_list'")
        let shoppingBasketList = app.collectionViews.containing(predicateShoppingbasket).element(boundBy: 0)
        XCTAssertFalse(shoppingBasketList.waitForExistence(timeout: 2))
    }
    
    func test_completebutton() {
        waitForShoppingBasketList()
        let predicateButton = NSPredicate(format: "identifier == 'shopping_basket_complete_button'")
        let button = app.buttons.containing(predicateButton).element(boundBy: 0)
        button.tap()
        let alert = app.otherElements.children(matching: .alert).element(boundBy: 0)
        alert.buttons.element(boundBy: 0).tap()
        let predicateShoppingbasket = NSPredicate(format: "identifier == 'shopping_basket_list'")
        let shoppingBasketList = app.collectionViews.containing(predicateShoppingbasket).element(boundBy: 0)
        XCTAssertFalse(shoppingBasketList.waitForExistence(timeout: 2))
    }
}
