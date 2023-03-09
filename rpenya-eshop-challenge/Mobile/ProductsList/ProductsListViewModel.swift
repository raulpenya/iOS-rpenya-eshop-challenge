//
//  ProductsListViewModel.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

class ProductsListViewModel: ObservableObject {
    
    @Published var listModel: BasketViewEntity?
    @Published var currentBasket: BasketViewEntity?
    @Published var errorDescription: ErrorDescription?
    let getProductsWithPromotionsUseCase: GetProductsWithPromotions
    var cancellableSet: Set<AnyCancellable> = []
    
    init(getProductsWithPromotionsUseCase: GetProductsWithPromotions) {
        self.getProductsWithPromotionsUseCase = getProductsWithPromotionsUseCase
    }
    
    func ProductsListItemButtonPressed(item: ProductsListItem, action: ProductsListItemAction) {
        switch action {
        case .add:
            print("add")
        case .remove:
            print("remove")
        }
    }
    
    func checkoutButtonPressed() {
        getProductsWithPromotions()
    }
    
    @Sendable func refreshData() {
        getProductsWithPromotions()
    }
    
    func getProductsWithPromotions() {
        getProductsWithPromotionsUseCase.execute(GetProductsWithPromotionsRequestValues()).sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                print(error)
//                let error = ErrorDescription(text: (error as? RepositoryErrors)?.localizedDescription ?? error.localizedDescription)
//                self?.errorDescription = error
            case .finished:
                print("ProductsListViewModel :: getProductsWithPromotions :: publisher finished")
            }
        } receiveValue: { [weak self] result in
            print("ProductsListViewModel :: getProductsWithPromotions :: result :: \(result)")
        }.store(in: &cancellableSet)
    }
}
