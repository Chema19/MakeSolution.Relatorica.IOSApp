
import Foundation


class AddChildViewModel:ObservableObject {
    
    @Published var addChildResponse:AddChildResponseViewModel!
    
    func postChild(child:ChildModel,token:String?, completion: @escaping(AddChildResponseViewModel?)->()){
        ApiNetworking().postChild(child:child,token:token){
            childDataResponse in
            let childResponse = AddChildResponseViewModel.init(addChildResponse: childDataResponse)
            DispatchQueue.main.async{
                completion(childResponse)
            }
        }
    }
}

struct AddChildResponseViewModel{
    var addChildResponse: AddChildResponse
    init(addChildResponse:AddChildResponse?){
        self.addChildResponse = addChildResponse!
    }
    var data: ChildModel {
        return self.addChildResponse.Data
    }
    var message: String {
        return self.addChildResponse.Message
    }
    
    var error: Bool {
        return self.addChildResponse.Error
    }
}
