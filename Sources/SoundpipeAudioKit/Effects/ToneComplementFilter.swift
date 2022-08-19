// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AudioKit
import AudioKitEX
import AVFoundation
import CAudioKitEX

/// A complement to the AKLowPassFilter.
public class ToneComplementFilter: Node {
    let input: Node

    /// Connected nodes
    public var connections: [Node] { [input] }

    /// Underlying AVAudioNode
    public var avAudioNode = instantiate(effect: "aton")

    // MARK: - Parameters

    /// Specification details for halfPowerPoint
    public static let halfPowerPointDef = NodeParameterDef(
        identifier: "halfPowerPoint",
        name: "Half-Power Point (Hz)",
        address: akGetParameterAddress("ToneComplementFilterParameterHalfPowerPoint"),
        defaultValue: 1000.0,
        range: 12.0 ... 20000.0,
        unit: .hertz
    )

    /// Half-Power Point in Hertz. Half power is defined as peak power / square root of 2.
    @Parameter(halfPowerPointDef) public var halfPowerPoint: AUValue

    // MARK: - Initialization

    /// Initialize this filter node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - halfPowerPoint: Half-Power Point in Hertz. Half power is defined as peak power / square root of 2.
    ///
    public init(
        _ input: Node,
        halfPowerPoint: AUValue = halfPowerPointDef.defaultValue
    ) {
        self.input = input

        setupParameters()

        self.halfPowerPoint = halfPowerPoint
    }
}
