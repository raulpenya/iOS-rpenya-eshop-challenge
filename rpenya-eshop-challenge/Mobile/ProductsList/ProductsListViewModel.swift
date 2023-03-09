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
        var newBasket = currentBasket
        switch action {
        case .add:
            newBasket = currentBasket?.modifyProductUnits(item.basketProduct, action: .addProduct)
        case .remove:
            newBasket = currentBasket?.modifyProductUnits(item.basketProduct, action: .removeProduct)
        }
        updateView(with: newBasket!)
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
                self?.receiveError(error)
            case .finished:
                print("ProductsListViewModel :: getProductsWithPromotions :: publisher finished")
            }
        } receiveValue: { [weak self] result in
            print("ProductsListViewModel :: getProductsWithPromotions :: result :: \(result)")
            self?.receiveResult(result)
        }.store(in: &cancellableSet)
    }
    
    func receiveResult(_ result: Products) {
        updateView(with: result.transformToBasket())
    }
    
    func receiveError(_ error: Error) {
        let error = ErrorDescription(text: error.localizedDescription)
        errorDescription = error
        state = .failed(error)
    }
    
    func updateView(with basket: BasketViewEntity) {
        currentBasket = basket
        let listItems = basket.transformToProductsList(action: productsListItemButtonPressed)
        let buttonItem = basket.transformToProductListButtonItem(action: checkoutButtonPressed)
        state = .loaded(listItems, buttonItem)
    }
}
