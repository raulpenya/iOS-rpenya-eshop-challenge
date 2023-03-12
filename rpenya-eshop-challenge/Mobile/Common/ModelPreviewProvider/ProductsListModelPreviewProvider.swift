//
//  swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

#if DEBUG

import Foundation

struct ProductsListModelPreviewProvider {
    static func getProductsListItem() -> ProductsListItems {
        return ProductsListItems(items: [anyItem1(), anyItem2()])
    }
    
    static func anyItem1() -> AnyItem {
        return AnyItem(item: getProductsListItem1())
    }
    
    static func anyItem2() -> AnyItem {
        return AnyItem(item: getProductsListItem2())
    }
    
    static func getProductsListItem1() -> ProductsListItem {
        return ProductsListItem(basketProduct: getBasketProduct1(), view: .productsList) { item, action in
            print(action)
            print(action)
            print(item)
        }
    }
    
    static func getProductsListItem2() -> ProductsListItem {
        return ProductsListItem(basketProduct: getBasketProduct2(), view: .productsList) { item, action in
            print(action)
            print(action)
            print(item)
        }
    }
    
    static func getBasket() -> BasketViewEntity {
        return BasketViewEntity(products: [getBasketProduct1(), getBasketProduct2()], currency: "€")
    }
    
    static func getBasketProduct1() -> BasketProductViewEntity {
        return BasketProductViewEntity(product: getProduct(), units: 2)
    }
    
    static func getBasketProduct2() -> BasketProductViewEntity {
        return BasketProductViewEntity(product: getProductWithoutPromotion(), units: 200)
    }
    
    static func getProduct() -> ProductViewEntity {
        return ProductViewEntity(code: "TSHIRT", name: "Cabify T-Shirt", price: 20, currency: "€", promotion: getPromotion())
    }
    
    static func getProductWithoutPromotion() -> ProductViewEntity {
        return ProductViewEntity(code: "TSHIRT", name: "Cabify T-Shirt", price: 20, currency: "€", promotion: nil)
    }
    
    static func getPromotion() -> PromotionViewEntity {
        return PromotionViewEntity(productCode: "TSHIRT", name: "Pay 1 get 2", type: .percentage, unitsNeeded: 2, discount: 0.5)
    }
}

#endif
