//
//  ContentView.swift
//  HallowenWeb
//
//  Created by Admin on 23/10/2025.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL?

    private let webView = WKWebView()
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.bounces = false
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url!)
        webView.load(request)
            
        }
    }

 

struct ContentView: View {
    
    let pages = [
        ("History", "https://www.history.com/topics/halloween"),
        ("Halloween Ideas", "https://www.goodhousekeeping.com/holidays/halloween-ideas/"),
        ("Disfraces", "https://www.disfrazzes.com/disfraces-halloween/"),
        ("Recetas", "https://www.abc.es/recetasderechupete/las-recetas-de-halloween-mas-terrorificas/14088/"),
        ("Juegos", "https://poki.com/es/halloween"),
        ("Wikipedia", "https://en.wikipedia.org/wiki/Halloween"),
        ("Atracciones", "https://scarecity.co.uk/"),
        ("Websites", "https://madebyshape.co.uk/web-design-blog/best-spooky-halloween-websites/"),
        ("Ideas", "https://www.goodhousekeeping.com/holidays/halloween-ideas/"),
        ("Costumes", "https://www.pinterest.com/halloweencostumes/")
    ]
    
    @State private var selectedPage = "https://scarecity.co.uk/"
    @State private var isLit = false
    
    
    
    
  //  let hallowenURL = URL(string: "https://scarecity.co.uk/")!
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                VStack(spacing: 10) {
                    Image("Halloween")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 230, height: 50)
                        .scaleEffect(isLit ? 1.5 : 0.95)
                        .animation(Animation.easeIn(duration: 5.0).repeatForever(autoreverses: true)) //  value: isLit
                        
                Text("🎃🙀 ¡Truco O Trato! 👻🤡")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .scaleEffect(isLit ? 1.5 : 0.95)
                    .animation(Animation.easeIn(duration: 5.0).repeatForever(autoreverses: true), value: isLit)
                    .foregroundColor(isLit ? Color.orange : Color(red: 0.85, green: 0.25, blue: 0.0))
                    .opacity(isLit ? 1.0 : 0.6)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                                isLit.toggle()
                            }
                        }
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(pages, id: \.1) { name, urlString in
                            Button(action: {
                                selectedPage = urlString
                            }) {
                                Text(name)
                                    .font(.callout)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(
                                        selectedPage == urlString ? Color.orange : Color.gray.opacity(0.2)
                                    )
                                    .foregroundColor(selectedPage == urlString ? .white : .primary)
                                    .cornerRadius(10)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 10)
                
                WebView(url: URL(string: selectedPage)!)
                    .edgesIgnoringSafeArea(.all)

            }
            .padding(.top, -90)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
