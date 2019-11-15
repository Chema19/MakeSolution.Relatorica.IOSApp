import Foundation

class PurchaseListViewModel:ObservableObject {
    
    @Published var purchasesResponseData = [PurchaseResponseViewModel]()
    
    init(padreId: Int?, token: String?){
        PurchaseApiNetworking().getPurchasesByFather(idPadre: padreId, token: token) {
            purchasesResponseData in
            for item in purchasesResponseData!.Data{
                PurchaseApiNetworking().getHistoryById(idHistory: item.HistoriaId, token: token) {
                    historyResponseData in
                    let history = PurchaseResponseViewModel.init(historyModel: historyResponseData!)
                    self.purchasesResponseData.append(history)
                }
            }
        }
    }
}

struct PurchaseResponseViewModel{

    
    var historyModel: HistoryModel
    
    init(historyModel:HistoryModel){
        self.historyModel = historyModel
    }
    
    var historiaId: Int {
        return self.historyModel.HistoriaId
    }
    var nombre: String {
        return self.historyModel.Nombre
    }
    var usuarioId: Int {
        return self.historyModel.UsuarioId
    }
    var nombreUsuario: String {
        return self.historyModel.NombreUsuario
    }
    var argumento: String {
        return self.historyModel.Argumento
    }
    var fechaRegistro: String {
        return self.historyModel.FechaRegistro
    }
    var estado: String {
        return self.historyModel.Estado
    }
    var precio: Double {
        return self.historyModel.Precio
    }
    var editorial: String {
        return self.historyModel.Editorial
    }
    var imagen: String {
        return self.historyModel.Imagen
    }
    
}

