// swift-linter-tools-version: 0.1
// ===----------------------------------------------------------------------===//
//
// This source file is part of the swift-carrier-primitives open source project
//
// Copyright (c) 2026 Coen ten Thije Boonkkamp and the swift-carrier-primitives project authors
// Licensed under Apache License v2.0
//
// See LICENSE for license information
//
// ===----------------------------------------------------------------------===//

// Shape-γ unified consumer manifest. Replaces the prior nested-package
// Lint/{Package.swift, Sources/Lint/main.swift} pair with a single
// Lint.swift declaring both SwiftPM dependencies and rule activations.
//
// Canary for the unified-single-file pattern per
// swift-institute/Research/2026-05-12-swift-linter-unified-consumer-manifest.md.
//
// Also exercises the inline-custom-rule path: the rule below is defined
// at file scope (backtick natural-English form per the institute rule-
// naming convention) and activated alongside the primitives-tier bundle.
// Demonstrates that consumers can author domain-aware rules directly in
// `Lint.swift` without requiring a separate rule package — the
// swift-syntax dep is declared inline.
//
// **Domain predicate (2026-05-17 refinement, RCQT Tier B.1)**: the
// inline rule enforces a real carrier convention — Standard Library
// Integration (SLI) source files MUST use `public import
// Carrier_Primitives` so consumers of the SLI module see Carrier
// conformances on the stdlib types (per SE-0409 import visibility).
// Bare `import` or `internal import` in an SLI file would publish the
// extension declarations without exposing the Carrier brand they
// extend — a real surface defect, not a stylistic preference.
//
// Brand-newtype-owner recognizer (per [API-BRAND-001] in code-surface
// skill). swift-carrier-primitives owns the `Carrier.\`Protocol\`` brand
// under the `Carrier` namespace root. The `int public parameter` rule —
// which fires on the in-package `Carrier.\`Protocol\`` conformers whose
// `Underlying == Int` (their public initializers take `Int` directly
// because `Int` IS the Underlying being wrapped) — self-suppresses on
// the owner's own surface via the engine's §A brand pre-pass
// (`Lint.Brand.owned`), so no per-package `.excluding(rules:)` stopgap is
// needed; cross-package strict-superset firing on external consumers is
// preserved.

import Linter
import Linter_Primitives_Rules
import SwiftSyntax

extension Lint.Rule {
    /// SLI source files MUST use `public import Carrier_Primitives`.
    ///
    /// SLI = Standard Library Integration. Files under
    /// `Sources/.../Standard Library Integration/` extend stdlib types
    /// with `Carrier.\`Protocol\`` conformances. The `public import`
    /// modifier is required so consumers of the SLI module see the
    /// Carrier brand surfaced through the conformances they import
    /// (SE-0409 import visibility).
    ///
    /// Bare `import Carrier_Primitives` (or `internal import`) in an
    /// SLI file publishes the conformance extensions without exposing
    /// the Carrier brand — extension members would surface their
    /// underlying types (e.g., `UInt`, `Span<Element>`) but the
    /// `Carrier.\`Protocol\`` conformance itself would not be visible
    /// to downstream consumers. Real defect.
    ///
    /// Inline-custom-rule canary for Shape γ: demonstrates that
    /// consumers can author domain-aware rules directly in Lint.swift
    /// without a separate rule pack. Zero current firings on carrier
    /// (the package is compliant); fires on regressions.
    static let `sli public carrier import` = Lint.Rule(
        id: "sli public carrier import",
        default: .warning,
        findings: { source, severity in
            var findings: [Diagnostic.Record] = []
            // Scope: only SLI files (Sources/.../Standard Library Integration/).
            let pathString = source.file.filePath.description
            guard pathString.contains("Standard Library Integration") else {
                return findings
            }
            for statement in source.tree.statements {
                guard let importDecl = statement.item.as(ImportDeclSyntax.self) else { continue }
                let pathText = importDecl.path.trimmedDescription
                guard pathText == "Carrier_Primitives" else { continue }
                // Allowlist: `public import` (and `@_exported public import`).
                let hasPublic = importDecl.modifiers.contains { modifier in
                    modifier.name.tokenKind == .keyword(.public)
                }
                guard !hasPublic else { continue }
                let location = source.converter.location(
                    for: importDecl.positionAfterSkippingLeadingTrivia
                )
                findings.append(
                    Diagnostic.Record(
                        location: Source.Location(
                            fileID: source.file.fileID,
                            filePath: source.file.filePath,
                            line: location.line,
                            column: location.column
                        ),
                        severity: severity,
                        identifier: "sli public carrier import",
                        message: "[sli public carrier import] SLI source files MUST use `public import Carrier_Primitives` so consumers of the SLI module see the `Carrier.\\`Protocol\\`` conformances on stdlib types (SE-0409 import visibility). Found `import Carrier_Primitives` without `public` modifier — the conformance extensions would publish but the brand they extend would not be visible downstream. Add `public` to the import statement."
                    )
                )
            }
            return findings
        }
    )
}

Lint.run(dependencies: [
    .package(
        url: "https://github.com/swift-primitives/swift-primitives-linter-rules.git",
        branch: "main",
        products: ["Linter Primitives Rules"]
    ),
    .package(
        url: "https://github.com/swiftlang/swift-syntax.git",
        "602.0.0"..<"603.0.0",
        products: ["SwiftSyntax"]
    ),
]) {
    Lint.Rule.Bundle.primitives
    Lint.Rule.Configuration.enable(.`sli public carrier import`)
}
