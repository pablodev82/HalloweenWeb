//
//  HallowenWebUITests.swift
//  HallowenWebUITests
//
//  Created by Admin on 23/10/2025.
//

import XCTest

class HallowenWebUITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false
        XCUIApplication().launch()

    }
    
    func testTapHistoryButton_LoadView() {
        let app = XCUIApplication()
        
        // Espera a que aparezca el botón "History"
        let historyButton = app.buttons["History"]
        XCTAssertTrue(historyButton.waitForExistence(timeout: 5), "Boton 'history' no encontrado")
        
        historyButton.tap()  //Toca el botón
        
        sleep(2)
        
        XCTAssertTrue(app.exists, "La app debebia eguir activa despues de tocar el boton")
    }
    
    func testAnimatedTitle() {
        let app = XCUIApplication()
        
        let title = app.staticTexts["🎃🙀 ¡Truco O Trato! 👻🤡"]
        XCTAssertTrue(title.waitForExistence(timeout: 3), "El titulo animado no se muestra")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

     
    func testLaunchPerformance() throws {
                XCUIApplication().launch()
            }
        }
    

//  ¿Qué hace cada prueba?
//  testHistoryButton:_LoadView():
//  Simula que un usuario abre la app y toca "History".
// → Verifica que la UI responda y no crashee.
// testAnimatedTitle():
// Confirma que el título animado (con emojis) se muestre al iniciar.
// → Asegura que los elementos clave de la interfaz se rendericen.

