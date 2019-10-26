import SwiftUI
import CoreLocation

struct PurchaseModel: Hashable, Identifiable, Decodable {
    var id: Int
    
    var CompraId: Int? = nil
    var PadreId: Int? = nil
    var HistoriaId: Int? = nil
    var FechaCompra: String? = nil
    var Estado: String? = nil
    var Costo: Double? = nil
    
}
		
