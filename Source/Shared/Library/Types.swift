#if os(iOS) || os(tvOS)
  import UIKit
  public typealias CachePlatformImage = UIImage
#elseif os(watchOS)

#elseif os(OSX)
  import AppKit
  public typealias CachePlatformImage = NSImage
#endif
