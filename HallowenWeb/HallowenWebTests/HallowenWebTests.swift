//
//  HallowenWebTests.swift
//  HallowenWebTests
//
//  Created by Admin on 23/10/2025.
//

import XCTest
@testable import HallowenWeb

class HallowenWebTests: XCTestCase {

    func TestURLsValidas() throws {
        let pages = ContentView().pages
        
        for (_, urlString) in pages {
            let cleanURL = urlString.trimmingCharacters(in: .whitespaces)
            XCTAssertNotNil(URL(string: cleanURL), "URL invalida: \(urlString)")
        }
        
    }
    
    
    func testDefaultSelectedPageInList() {
        let defaultPage =  "https://scarecity.co.uk/"
        let pages = ContentView().pages
        let urls = pages.map { $0.1.trimmingCharacters(in: .whitespaces)}
        XCTAssertTrue(urls.contains(defaultPage), "La pagina por defecto no esta en la lista")
    }
    
    func testAllPageURLsAreUnique() {
        let pages = ContentView().pages
        let urls = pages.map { $0.1.trimmingCharacters(in: .whitespaces) }
        let uniqueURLs = Set(urls)
        XCTAssertEqual(urls.count, uniqueURLs.count, "Hay URLs duplicadas en la lista")
    }
    
    func testallURLsUseHTTPS() {
        let pages = ContentView().pages
        
        for (_, urlString) in pages {
            let cleanURL = urlString.trimmingCharacters(in: .whitespaces)
            XCTAssertTrue(cleanURL.hasPrefix("https://"), "La URL debe usar HTTPS: \(cleanURL)")
        }
    }
    
    func testAllButtonTitlesAreNonEmpty() {
        let pages = ContentView().pages
        for (name, _) in pages {
            XCTAssertFalse(
                name.trimmingCharacters(in: .whitespaces).isEmpty,
                "El nombre del botón no puede estar vacío"
            )
        }
    }
    
}
    
