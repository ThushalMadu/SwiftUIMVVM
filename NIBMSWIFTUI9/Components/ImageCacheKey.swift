//
//  ImageCacheKey.swift
//  NIBMSWIFTUI9
//
//  Created by Thushal Madhushankha on 2021-09-27.
//

import Foundation
import SwiftUI
import Combine

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
