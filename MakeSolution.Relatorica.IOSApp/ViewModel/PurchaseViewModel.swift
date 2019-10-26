import SwiftUI
import Combine

final class PurchaseViewModel: ObservableObject {
    
    @Published private(set) var purchases = [PurchaseModel]()
    
    private var purchaseCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    deinit {
        purchaseCancellable?.cancel()
    }
    
    func listPurchases() {
        //guard !name.isEmpty else {
        //    return users = []
        //}
        let apiNetworking = ApiNetworking()
        let urlComponents = URLComponents(string: apiNetworking.getPurchasesByFather(padreId: 5))!
        //urlComponents.queryItems = [
        //    URLQueryItem(name: "q", value: name)
        //]

        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkFkbWluIiwibmJmIjoxNTcxODkxNDY2LCJleHAiOjE1NzE4OTg2NjYsImlhdCI6MTU3MTg5MTQ2NiwiaXNzIjoiaHR0cDovLzE4LjE4OC4xMDIuMjMwL1JlbGF0b3JpY2EvIiwiYXVkIjoiaHR0cDovLzE4LjE4OC4xMDIuMjMwL1JlbGF0b3JpY2EvIn0.pVXGh3E9F1iGe6GFAHflzPteVbY7lIensiR-SOxf_DE", forHTTPHeaderField: "Authorization")

        purchaseCancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: PurchaseResponse.self, decoder: JSONDecoder())
            .map { $0.Data! }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.purchases, on: self)
    }
    
}
