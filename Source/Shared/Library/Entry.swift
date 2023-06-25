import Foundation

public enum KVCacheKeyType: Equatable, Hashable {
    /// A key that is a string value
    case stringValue(key: String)
    
    /// A key that is derived through it's constant hash value
    case derivedValue(resolved: String, key: AnyHashable)
    
    public var key: String {
        switch self {
        case .stringValue(let key):
            return key
        case .derivedValue(let resolved, _):
            return resolved
        }
    }
}


public struct KVCacheStoreEntryId: Equatable, Hashable {
    
    //The LMDB database that this entry is associated with
    public let storeName: String
    //The key that this entry is associated with
    public let keyType: KVCacheKeyType
    
    public init(storeName: String, keyType: KVCacheKeyType) {
        self.storeName = storeName
        self.keyType = keyType
    }
    
    public var cacheKey: String { keyType.key }
}


/// A wrapper around cached object and its expiry date.
public struct Entry<T> {
  /// Cached object
  public let object: T
  /// Expiry date
  public let expiry: Expiry
  /// File path to the cached object
  public let filePath: String?
    
    public let kvId: KVCacheStoreEntryId?

  public init(object: T,
              expiry: Expiry,
              filePath: String? = nil,
              kvId: KVCacheStoreEntryId? = nil
  ) {
    self.object = object
    self.expiry = expiry
    self.filePath = filePath
      self.kvId = kvId
  }
}
