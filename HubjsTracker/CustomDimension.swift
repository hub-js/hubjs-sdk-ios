import Foundation

public struct CustomDimension: Codable {
    /// The index of the dimension. A dimension with this index must be setup in the Hubjs backend.
    let index: Int
    
    /// The value you want to set for this dimension.
    let value: String
    
    public init(index: Int, value: String) {
      self.index = index
      self.value = value
    }
}
