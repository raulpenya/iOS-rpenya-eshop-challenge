//
//  ProductsListViewModel.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

enum State {
    case idle
    case loading
    case failed(ErrorDescription)
    case loaded(ListItems, ButtonItem)
}

class ProductsListViewModel: ObservableObject {
    @Published private(set) var state = State.idle
    let getProductsWithPromotionsUseCase: GetProductsWithPromotions
    var cancellableSet: Set<AnyCancellable> = []
    var currentBasket: BasketViewEntity?
//    var listModel: ListItems?
//    var buttonModel: ButtonItem?
    var errorDescription: ErrorDescription?
    
    init(getProductsWithPromotionsUseCase: GetProductsWithPromotions) {
        self.getProductsWithPromotionsUseCase = getProductsWithPromotionsUseCase
    }
    
    func loadData() {
        getProductsWithPromotions()
    }
    
    @Sendable func refreshData() {
        getProductsWithPromotions()
    }
    
    func productsListItemButtonPressed(item: ProductsListItem, action: ProductsListItemAction) {
        print(item.basketProduct.product.name)
        switch action {
        case .add:
            print("add")
        case .remove:
            print("remove")
        }
    }
    
    func checkoutButtonPressed(item: ButtonItem) {
        print(item.title)
    }
    
    func getProductsWithPromotions() {
        state = .loading
        getProductsWithPromotionsUseCase.execute(GetProductsWithPromotionsRequestValues()).receive(on: RunLoop.main).sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
                self?.handleError(error)
            case .finished:
                print("ProductsListViewModel :: getProductsWithPromotions :: publisher finished")
            }
        } receiveValue: { [weak self] result in
            print("ProductsListViewModel :: getProductsWithPromotions :: result :: \(result)")
            self?.handleResult(result)
        }.store(in: &cancellableSet)
    }
    
    func handleResult(_ result: Products) {
        let basket = result.transformToBasket()
        currentBasket = basket
        let listItems = basket.transformToProductsList(action: productsListItemButtonPressed)
//        listModel = listItems
        let buttonItem = basket.transformToProductListButtonItem(action: checkoutButtonPressed)
//        buttonModel = buttonItem
        state = .loaded(listItems, buttonItem)
    }
    
    func handleError(_ error: Error) {
        let error = ErrorDescription(text: error.localizedDescription)
        errorDescription = error
        state = .failed(error)
    }
}
