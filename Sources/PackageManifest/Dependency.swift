import Foundation

public struct Dependency {
    public let gitPath: String
    public let version: VersionSpecifier

    func packageManifestEntry() -> String {
        return """
            .package(url: "\(gitPath)", \(version.packageManifestSpecifier()),
            """
    }
}
