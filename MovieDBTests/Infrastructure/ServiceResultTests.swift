//
//  ServiceResultTests.swift
//  MovieDBTests
//
//  Created by William on 31/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest

@testable import MovieDB

private struct MockData: Decodable {
  let name: String
}

private enum ServiceDataErrorMock: Error {
  case someError
}

class ServiceResultTests: XCTestCase {
  func test_SuccessReceivedDataObject() {
    let config = MockServiceConfigurable()
    let expectation = self.expectation(description: "Return MockData")
    let json = #"{"name": "Test"}"#
    let data = json.data(using: .utf8)!
    let mockSession = MockServiceSession(response: nil,
                                         data: data,
                                         error: nil)
    let networkService = ServiceRequest(config: config, session: mockSession)
    let sut = ServiceDataResult(service: networkService)
    let endpoint = Endpoint<MockData>(path: "https://mock.com", method: .get)

    _ = sut.request(endpoint: endpoint) { (result) in
      do {
        let object = try result.get()
        XCTAssertEqual(object.name, "Test")
        expectation.fulfill()
      } catch {
        XCTFail("Invalid decoding MockData")
      }
    }

    wait(for: [expectation], timeout: 0.1)
  }

  func test_InvalidDecodeObjectResponse() {
    let config = MockServiceConfigurable()
    let expectation = self.expectation(description: "Return not decode mock object")
    let json = #"{"id": "001"}"#
    let data = json.data(using: .utf8)!
    let mockSession = MockServiceSession(response: nil,
                                         data: data,
                                         error: nil)
    let networkService = ServiceRequest(config: config, session: mockSession)
    let sut = ServiceDataResult(service: networkService)
    let endpoint = Endpoint<MockData>(path: "https://mock.com", method: .get)

    _ = sut.request(endpoint: endpoint, completion: { (result) in
      do {
        _ = try result.get()
        XCTFail("Should invalid mock data")
      } catch {
        expectation.fulfill()
      }
    })

    wait(for: [expectation], timeout: 0.1)
  }

  func test_BadRequestResponseError() {
    let config = MockServiceConfigurable()
    let expectation = self.expectation(description: "Return network error")
    let json = #"{"error": "Invalid connection request"}"#
    let data = json.data(using: .utf8)!
    let response = HTTPURLResponse(url: URL(string: "url")!,
                                   statusCode: 500,
                                   httpVersion: "1.0",
                                   headerFields: [:])
    let mockSession = MockServiceSession(response: response,
                                         data: data,
                                         error: ServiceDataErrorMock.someError)
    let networkService = ServiceRequest(config: config, session: mockSession)
    let sut = ServiceDataResult(service: networkService)
    let endpoint = Endpoint<MockData>(path: "https://mock.com", method: .get)

    _ = sut.request(endpoint: endpoint, completion: { (result) in
      do {
        _ = try result.get()
        XCTFail("Should got error")
      } catch {
        if case ServiceDataError.invalidNetwork(NetworkError.error(statusCode: 500, _)) = error {
          expectation.fulfill()
        } else {
          XCTFail("Another Error")
        }
      }
    })

    wait(for: [expectation], timeout: 0.1)
  }

  func test_NoDataErrorServiceRequest() {
    let config = MockServiceConfigurable()
    let expectation = self.expectation(description: "Return no data error")
    let response = HTTPURLResponse(url: URL(string: "url")!,
                                   statusCode: 200,
                                   httpVersion: "1.0",
                                   headerFields: [:])
    let mockSession = MockServiceSession(response: response,
                                         data: nil,
                                         error: nil)
    
    let networkService = ServiceRequest(config: config, session: mockSession)
    let sut = ServiceDataResult(service: networkService)
    let endpoint = Endpoint<MockData>(path: "https://mock.com", method: .get)
    
    _ = sut.request(endpoint: endpoint, completion: { (result) in
      do {
        _ = try result.get()
        XCTFail("Should got error")
      } catch {
        if case ServiceDataError.noResponse = error {
          expectation.fulfill()
        } else {
          XCTFail("Another Error")
        }
      }
    })

    wait(for: [expectation], timeout: 0.1)
  }
}
