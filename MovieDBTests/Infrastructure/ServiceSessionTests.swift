//
//  ServiceSessionTests.swift
//  MovieDBTests
//
//  Created by William on 29/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

private enum NetworkErrorMock: Error {
  case someError
}

@testable import MovieDB
class ServiceSessionTests: XCTestCase {

  func test_SuccessRequest() {
    let mockDataTask = MockURLSessionDataTask()
    let config = MockServiceConfigurable()
    let expectation = self.expectation(description: "Return data")
    let mockData = "Response Data".data(using: .utf8)!

    let mockSession = MockServiceSession(response: nil, data: mockData, error: nil)
    mockSession.dataTask = mockDataTask
    let sut = ServiceRequest(config: config, session: mockSession)

    let endpoint = MockServiceEndpoint(path: "Https://mock.com", method: .get)
    
    _ = sut.request(endpoint: endpoint, completion: { (result) in
      guard let responseData = try? result.get() else {
        XCTFail("Should return response data")
        return
      }
      
      XCTAssertEqual(responseData, mockData)
      expectation.fulfill()
    })

    wait(for: [expectation], timeout: 0.1)
  }

  func test_NetworkURLRequestCancelledError() {
    let config = MockServiceConfigurable()
    let expectation = self.expectation(description: "Return status code error")
    let mockError = NSError(domain: "network",
                            code: NSURLErrorCancelled,
                            userInfo: nil)

    let mockSession = MockServiceSession(response: nil,
                                         data: nil,
                                         error: (mockError as Error))
    let sut = ServiceRequest(config: config, session: mockSession)
    let endpoint = MockServiceEndpoint(path: "Https://mock.com", method: .get)

    _ = sut.request(endpoint: endpoint, completion: { (result) in
      do {
        _ = try result.get()
        XCTFail("Should got error")
      } catch {
        guard case NetworkError.cancelled = error else {
          XCTFail("NetworkError.cancelled not found")
          return
        }

        expectation.fulfill()
      }
    })

    wait(for: [expectation], timeout: 0.1)
  }

  func test_MalformedNetworkURLGeneration() {
    let config = MockServiceConfigurable()
    let expectation = self.expectation(description: "Return data")
    let mockData = "Response Data".data(using: .utf8)!

    let mockSession = MockServiceSession(response: nil, data: mockData, error: nil)
    let sut = ServiceRequest(config: config, session: mockSession)

    let endpoint = MockServiceEndpoint(path: ":-80q=א/", method: .get)

    _ = sut.request(endpoint: endpoint, completion: { (result) in
      do {
        _ = try result.get()
        XCTFail("Throw url generation error")
      } catch {
        guard case NetworkError.urlGeneration = error else {
          XCTFail("Throw url generation error")
          return
        }

        expectation.fulfill()
      }
    })

    wait(for: [expectation], timeout: 0.1)
  }

  func test_NetworkURLWithStatusCode() {
    let config = MockServiceConfigurable()
    let expectation = self.expectation(description: "Return data")
    let response = HTTPURLResponse(url: URL(string: "url")!,
                                   statusCode: 500,
                                   httpVersion: "1.0",
                                   headerFields: [:])
    let mockSession = MockServiceSession(response: response,
                                         data: nil,
                                         error: NetworkErrorMock.someError)
    
    let sut = ServiceRequest(config: config, session: mockSession)
    let endpoint = MockServiceEndpoint(path: "https://mock.com", method: .get)
    
    _ = sut.request(endpoint: endpoint, completion: { (result) in
      do {
        _ = try result.get()
        XCTFail("Throw url generation error")
      } catch {
        if case NetworkError.error(let statusCode, _) = error {
          XCTAssertEqual(statusCode, 500)
          expectation.fulfill()
        }
      }
    })

    wait(for: [expectation], timeout: 0.1)
  }

  func test_NetworkInternetNotConnected() {
    let config = MockServiceConfigurable()
    let expectation = self.expectation(description: "Return status code error")
    let mockError = NSError(domain: "network",
                            code: NSURLErrorNotConnectedToInternet,
                            userInfo: nil)

    let mockSession = MockServiceSession(response: nil,
                                         data: nil,
                                         error: (mockError as Error))
    let sut = ServiceRequest(config: config, session: mockSession)
    let endpoint = MockServiceEndpoint(path: "Https://mock.com", method: .get)

    _ = sut.request(endpoint: endpoint, completion: { (result) in
      do {
        _ = try result.get()
        XCTFail("Should not happend")
      } catch {
        guard case NetworkError.notConnected = error else {
          XCTFail("NetworkError.notConnected not found")
          return
        }

        expectation.fulfill()
      }
    })

    wait(for: [expectation], timeout: 0.1)
  }

  func test_NetworkReturnStatusCode() {
    let statusCode = NetworkError.error(statusCode: 400, data: nil)
    XCTAssertTrue(statusCode.hasStatusCode(400))
    XCTAssertFalse(statusCode.hasStatusCode(401))
  }  
}
