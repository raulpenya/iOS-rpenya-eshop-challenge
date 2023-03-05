//
//  NetworkingDataSourceRequestTests.swift
//  DataTests
//
//  Created by raulbot on 5/3/23.
//

import XCTest
@testable import Data

final class NetworkingDataSourceRequestTests: XCTestCase {

    

}



class MockSession: Session {
    enum Response {
        case success
        case error
    }
    
    var response: Response = .success
    
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher {
        switch response {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
    }
}
