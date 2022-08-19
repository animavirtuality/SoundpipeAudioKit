// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AudioKit
import AudioKitEX
import AVFoundation
import CAudioKitEX

/// These filters are Butterworth second-order IIR filters.
/// They offer an almost flat passband and very good precision and stopband attenuation.
///
public class BandRejectButterworthFilter: Node {
    let input: Node

    /// Connected nodes
    public var connections: [Node] { [input] }

    /// Underlying AVAudioNode
    public var avAudioNode = instantiate(effect: "btbr")

    // MARK: - Parameters

    /// Specification details for centerFrequency
    public static let centerFrequencyDef = NodeParameterDef(
        identifier: "centerFrequency",
        name: "Center Frequency (Hz)",
        address: akGetParameterAddress("BandRejectButterworthFilterParameterCenterFrequency"),
        defaultValue: 3000.0,
        range: 12.0 ... 20000.0,
        unit: .hertz
    )

    /// Center frequency. (in Hertz)
    @Parameter(centerFrequencyDef) public var centerFrequency: AUValue

    /// Specification details for bandwidth
    public static let bandwidthDef = NodeParameterDef(
        identifier: "bandwidth",
        name: "Bandwidth (Hz)",
        address: akGetParameterAddress("BandRejectButterworthFilterParameterBandwidth"),
        defaultValue: 2000.0,
        range: 0.0 ... 20000.0,
        unit: .hertz
    )

    /// Bandwidth. (in Hertz)
    @Parameter(bandwidthDef) public var bandwidth: AUValue

    // MARK: - Initialization

    /// Initialize this filter node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - centerFrequency: Center frequency. (in Hertz)
    ///   - bandwidth: Bandwidth. (in Hertz)
    ///
    public init(
        _ input: Node,
        centerFrequency: AUValue = centerFrequencyDef.defaultValue,
        bandwidth: AUValue = bandwidthDef.defaultValue
    ) {
        self.input = input

        setupParameters()

        self.centerFrequency = centerFrequency
        self.bandwidth = bandwidth
    }
}
