//
//  MeteorLoaderAPIHandler.swift
//  Amazing meteor
//
//  Created by venus on 9/21/21.
//

import SwiftUI
import Alamofire

class MeteorViewModel: ObservableObject {
    
    @Published var meteors = [MeteorModel]()
    @State var isLoading = false
    func meteorLandingsAPI()
    {
        let urlRequest = "https://data.nasa.gov/resource/y77d-th95.json"
        AF.request(urlRequest).response { response in
            guard
            let data = response.data
            else { return }
            do {
                let response = try JSONDecoder().decode([MeteorModel].self, from: data)
                for info in response {
                    let checkYear = info.year ?? "0000"
                    let year4 = String(checkYear.prefix(4))
                    if Int(year4)! >= 1900 {
                        self.meteors.append(info)
                    }
                }
            } catch {
                print("Rest API error")
            }
        }
    }
}
