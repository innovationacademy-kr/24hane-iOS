//
//  AccumulationViewModel.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/16/24.
//

import Foundation

protocol AccumulationDataProtocol {
    var accumulation: AccumulationModel { get set }
}

protocol AccumulationApiProtocol {
    func fetchAccumulationData()
}

protocol AccumulationViewModelProtocol: ObservableObject {
    var data: AccumulationDataProtocol { get }
    var api: AccumulationApiProtocol { get }
}

class AccumulationViewModel: AccumulationViewModelProtocol {
    let data: AccumulationDataProtocol
    let api: AccumulationApiProtocol
    
    init(data: AccumulationData, api: AccumulationApi) {
        self.data = data
        self.api = api
    }
}

class AccumulationData: AccumulationDataProtocol {
    @Published var accumulation: AccumulationModel = AccumulationModel()
}

class AccumulationApi: AccumulationApiProtocol {
    func fetchAccumulationData() {
        NetworkModel.shared.apiRequest("", .get, type: String.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { value in
                print(value)
            })
    }
}
