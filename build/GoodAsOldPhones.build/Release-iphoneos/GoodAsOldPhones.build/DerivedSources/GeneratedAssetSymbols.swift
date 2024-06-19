import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "button-addtocart" asset catalog image resource.
    static let buttonAddtocart = ImageResource(name: "button-addtocart", bundle: resourceBundle)

    /// The "header-contact" asset catalog image resource.
    static let headerContact = ImageResource(name: "header-contact", bundle: resourceBundle)

    /// The "icon-about-email" asset catalog image resource.
    static let iconAboutEmail = ImageResource(name: "icon-about-email", bundle: resourceBundle)

    /// The "icon-about-phone" asset catalog image resource.
    static let iconAboutPhone = ImageResource(name: "icon-about-phone", bundle: resourceBundle)

    /// The "icon-about-website" asset catalog image resource.
    static let iconAboutWebsite = ImageResource(name: "icon-about-website", bundle: resourceBundle)

    /// The "image-cell1" asset catalog image resource.
    static let imageCell1 = ImageResource(name: "image-cell1", bundle: resourceBundle)

    /// The "image-cell2" asset catalog image resource.
    static let imageCell2 = ImageResource(name: "image-cell2", bundle: resourceBundle)

    /// The "image-cell3" asset catalog image resource.
    static let imageCell3 = ImageResource(name: "image-cell3", bundle: resourceBundle)

    /// The "image-cell4" asset catalog image resource.
    static let imageCell4 = ImageResource(name: "image-cell4", bundle: resourceBundle)

    /// The "phone-fullscreen1" asset catalog image resource.
    static let phoneFullscreen1 = ImageResource(name: "phone-fullscreen1", bundle: resourceBundle)

    /// The "phone-fullscreen2" asset catalog image resource.
    static let phoneFullscreen2 = ImageResource(name: "phone-fullscreen2", bundle: resourceBundle)

    /// The "phone-fullscreen3" asset catalog image resource.
    static let phoneFullscreen3 = ImageResource(name: "phone-fullscreen3", bundle: resourceBundle)

    /// The "phone-fullscreen4" asset catalog image resource.
    static let phoneFullscreen4 = ImageResource(name: "phone-fullscreen4", bundle: resourceBundle)

}

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Swift.Hashable, Swift.Sendable {

    /// An asset catalog color resource name.
    fileprivate let name: Swift.String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Foundation.Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: Swift.String, bundle: Foundation.Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Swift.Hashable, Swift.Sendable {

    /// An asset catalog image resource name.
    fileprivate let name: Swift.String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Foundation.Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: Swift.String, bundle: Foundation.Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif