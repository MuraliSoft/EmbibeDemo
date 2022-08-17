//
//  MainListVM.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//

import Combine
import Foundation

class MainListVM: BaseViewModel {
    @Published
    var apiResponse: [RepoDetailsModel]?

    func getData(searchRepo: String) {
        isLoading = true
        fetchData(searchRepo: searchRepo) { response, _ in
            self.isLoading = false
            self.apiResponse = response
        }
    }

    func fetchData(searchRepo: String, completion: @escaping ([RepoDetailsModel]?, ErrorResponse?) -> Void) {
        let endPoint = "/repos/\(searchRepo)/pulls"
        let headerParamaters = ["accept": "application/vnd.github+json"]
        let params = ["state": "closed"]
        let event = API(path: endPoint,
                        method: .get,
                        headerParamaters: headerParamaters, queryParameters: params)

        BaseNetworking.shared.request([RepoDetailsModel].self,
                                      endPoint: event, completion: completion)
    }
}
