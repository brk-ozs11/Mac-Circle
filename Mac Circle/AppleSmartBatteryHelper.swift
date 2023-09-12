//
//  AppleSmartBatteryHelper.swift
//  Mac Circle
//
//  Created by Berk Özüş on 8.09.2023.
//

import Foundation
import SwiftUI

class AppleSmartBatteryHelper: ObservableObject {
    

        @Published var postChargeWaitSeconds: Int?
        @Published var builtIn: Int?
        @Published var appleRawAdapterDetails: NSMutableArray?
        @Published var currentCapacity: Int?
        @Published var packReserve: Int?
        @Published var inflowOverride: Int?
        @Published var deviceName: Int?
        @Published var postDischargeWaitSeconds: Int?
        @Published var carrierMode: Int?
        @Published var timeRemaining: Int?
        @Published var chargerConfiguration: Int?
        @Published var ioGeneralInterest: Int?
        @Published var ioReportLegend: Int?
        @Published var atCriticalLevel: Int?
        @Published var batteryCellDisconnectCount: Int?
        @Published var updateTime: Int?
        @Published var amperage: Int?
        @Published var appleRawCurrentCapacity: Int?
        @Published var absoluteCapacity: Int?
        @Published var avgTimeToFull: Int?
        @Published var externalConnected: Int?
        @Published var externalChargeCapable: Int?
        @Published var appleRawBatteryVoltage: Int?
        @Published var bootVoltage: Int?
        @Published var batteryData: Int?
        @Published var batteryInstalled: Int?
        @Published var ioReportLegendPublic: Int?
        @Published var serial: Int?
        @Published var appleRawExternalConnected: Int?
        @Published var kioskMode: Int?
        @Published var nominalChargeCapacity: Int?
        @Published var fullyCharged: Int?
        @Published var chargingOverride: Int?
        @Published var manufacturerData: Int?
        @Published var fedDetails: Int?
        @Published var fullPathUpdated: Int?
        @Published var batteryInvalidWakeSeconds: Int?
        @Published var chargerData: Int?
        @Published var bootPathUpdated: Int?
        @Published var designCycleCount9C: Int?
        @Published var adapterDetails: Int?
        @Published var powerTelemetryData: Int?
        @Published var maxCapacity: Int?
        @Published var instantAmperage: Int?
        @Published var gasGaugeFirmwareVersion: Int?
        @Published var adapterInfo: Int?
        @Published var location: Int?
        @Published var temperature: Int?
        @Published var avgTimeToEmpty: Int?
        @Published var bestAdapterIndex: Int?
        @Published var designCapacity: Int?
        @Published var isCharging: Bool?
        @Published var permanentFailureStatus: Int?
        @Published var voltage: Int?
        @Published var userVisiblePathUpdated: Int?
        @Published var cycleCount: Int?
        @Published var appleRawMaxCapacity: Int?
        @Published var virtualTemperature: Int?

    let service = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceNameMatching("AppleSmartBattery"))
    
    init() {
        getData()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            DispatchQueue.main.async {
                withAnimation(.spring().speed(0.8)) {
                    self.getData()
                   // self.getInformation()
              
                }
            }
        }
    }
    
    func getData() {
        isCharging = getRegistryProperty(forKey: .IsCharging) as? Bool
        currentCapacity = getRegistryProperty(forKey: .CurrentCapacity) as? Int
        appleRawAdapterDetails = getRegistryProperty(forKey: .AppleRawAdapterDetails) as? NSMutableArray
        packReserve = getRegistryProperty(forKey: .PackReserve) as? Int
        inflowOverride = getRegistryProperty(forKey: .InflowOverride) as? Int
        deviceName = getRegistryProperty(forKey: .DeviceName) as? Int
        postDischargeWaitSeconds = getRegistryProperty(forKey: .PostDischargeWaitSeconds) as? Int
        carrierMode = getRegistryProperty(forKey: .CarrierMode) as? Int
        timeRemaining = getRegistryProperty(forKey: .TimeRemaining) as? Int
        chargerConfiguration = getRegistryProperty(forKey: .ChargerConfiguration) as? Int
        ioGeneralInterest = getRegistryProperty(forKey: .IOGeneralInterest) as? Int
        ioReportLegend = getRegistryProperty(forKey: .IOReportLegend) as? Int
        atCriticalLevel = getRegistryProperty(forKey: .AtCriticalLevel) as? Int
        batteryCellDisconnectCount = getRegistryProperty(forKey: .BatteryCellDisconnectCount) as? Int
        updateTime = getRegistryProperty(forKey: .UpdateTime) as? Int
        amperage = getRegistryProperty(forKey: .Amperage) as? Int
        appleRawCurrentCapacity = getRegistryProperty(forKey: .AppleRawCurrentCapacity) as? Int
        absoluteCapacity = getRegistryProperty(forKey: .AbsoluteCapacity) as? Int
        avgTimeToFull = getRegistryProperty(forKey: .AvgTimeToFull) as? Int
        externalConnected = getRegistryProperty(forKey: .ExternalConnected) as? Int
        externalChargeCapable = getRegistryProperty(forKey: .ExternalChargeCapable) as? Int
        appleRawBatteryVoltage = getRegistryProperty(forKey: .AppleRawBatteryVoltage) as? Int
        bootVoltage = getRegistryProperty(forKey: .BootVoltage) as? Int
        batteryData = getRegistryProperty(forKey: .BatteryData) as? Int
        batteryInstalled = getRegistryProperty(forKey: .BatteryInstalled) as? Int
        ioReportLegendPublic = getRegistryProperty(forKey: .IOReportLegendPublic) as? Int
        serial = getRegistryProperty(forKey: .Serial) as? Int
        appleRawExternalConnected = getRegistryProperty(forKey: .AppleRawExternalConnected) as? Int
        kioskMode = getRegistryProperty(forKey: .KioskMode) as? Int
        nominalChargeCapacity = getRegistryProperty(forKey: .NominalChargeCapacity) as? Int
        fullyCharged = getRegistryProperty(forKey: .FullyCharged) as? Int
        chargingOverride = getRegistryProperty(forKey: .ChargingOverride) as? Int
        manufacturerData = getRegistryProperty(forKey: .ManufacturerData) as? Int
        fedDetails = getRegistryProperty(forKey: .FedDetails) as? Int
        fullPathUpdated = getRegistryProperty(forKey: .FullPathUpdated) as? Int
        batteryInvalidWakeSeconds = getRegistryProperty(forKey: .BatteryInvalidWakeSeconds) as? Int
        chargerData = getRegistryProperty(forKey: .ChargerData) as? Int
        bootPathUpdated = getRegistryProperty(forKey: .BootPathUpdated) as? Int
        designCycleCount9C = getRegistryProperty(forKey: .DesignCycleCount9C) as? Int
        adapterDetails = getRegistryProperty(forKey: .AdapterDetails) as? Int
        powerTelemetryData = getRegistryProperty(forKey: .PowerTelemetryData) as? Int
        maxCapacity = getRegistryProperty(forKey: .MaxCapacity) as? Int
        instantAmperage = getRegistryProperty(forKey: .InstantAmperage) as? Int
        gasGaugeFirmwareVersion = getRegistryProperty(forKey: .GasGaugeFirmwareVersion) as? Int
        adapterInfo = getRegistryProperty(forKey: .AdapterInfo) as? Int
        location = getRegistryProperty(forKey: .Location) as? Int
        temperature = getRegistryProperty(forKey: .Temperature) as? Int
        avgTimeToEmpty = getRegistryProperty(forKey: .AvgTimeToEmpty) as? Int
        bestAdapterIndex = getRegistryProperty(forKey: .BestAdapterIndex) as? Int
        designCapacity = getRegistryProperty(forKey: .DesignCapacity) as? Int
        permanentFailureStatus = getRegistryProperty(forKey: .PermanentFailureStatus) as? Int
        voltage = getRegistryProperty(forKey: .Voltage) as? Int
        userVisiblePathUpdated = getRegistryProperty(forKey: .UserVisiblePathUpdated) as? Int
        cycleCount = getRegistryProperty(forKey: .CycleCount) as? Int
        appleRawMaxCapacity = getRegistryProperty(forKey: .AppleRawMaxCapacity) as? Int
        virtualTemperature = getRegistryProperty(forKey: .VirtualTemperature) as? Int
        postChargeWaitSeconds = getRegistryProperty(forKey: .PostChargeWaitSeconds) as? Int
       
    }
    
    func getRegistryProperty(forKey key: AppleSmartBatteryKeyType) -> Any? {
        if let property = IORegistryEntryCreateCFProperty(service, key.rawValue as CFString?, nil, 0)?.takeRetainedValue() {
            return property
        } else {
            return nil
        }
    }

    
    func getInformation() {
        print("isCharging: \(isCharging ?? false)")
        print("currentCapacity: \(currentCapacity ?? 0)")
        print("postChargeWaitSeconds: \(postChargeWaitSeconds ?? 0)")
        print("builtIn: \(builtIn ?? 0)")
        print("appleRawAdapterDetails: \(appleRawAdapterDetails ?? [])")
        print("packReserve: \(packReserve ?? 0)")
        print("inflowOverride: \(inflowOverride ?? 0)")
        print("deviceName: \(deviceName ?? 0)")
        print("postDischargeWaitSeconds: \(postDischargeWaitSeconds ?? 0)")
        print("carrierMode: \(carrierMode ?? 0)")
        print("timeRemaining: \(timeRemaining ?? 0)")
        print("chargerConfiguration: \(chargerConfiguration ?? 0)")
        print("ioGeneralInterest: \(ioGeneralInterest ?? 0)")
        print("ioReportLegend: \(ioReportLegend ?? 0)")
        print("atCriticalLevel: \(atCriticalLevel ?? 0)")
        print("batteryCellDisconnectCount: \(batteryCellDisconnectCount ?? 0)")
        print("updateTime: \(updateTime ?? 0)")
        print("amperage: \(amperage ?? 0)")
        print("appleRawCurrentCapacity: \(appleRawCurrentCapacity ?? 0)")
        print("absoluteCapacity: \(absoluteCapacity ?? 0)")
        print("avgTimeToFull: \(avgTimeToFull ?? 0)")
        print("externalConnected: \(externalConnected ?? 0)")
        print("externalChargeCapable: \(externalChargeCapable ?? 0)")
        print("appleRawBatteryVoltage: \(appleRawBatteryVoltage ?? 0)")
        print("bootVoltage: \(bootVoltage ?? 0)")
        print("batteryData: \(batteryData ?? 0)")
        print("batteryInstalled: \(batteryInstalled ?? 0)")
        print("ioReportLegendPublic: \(ioReportLegendPublic ?? 0)")
        print("serial: \(serial ?? 0)")
        print("appleRawExternalConnected: \(appleRawExternalConnected ?? 0)")
        print("kioskMode: \(kioskMode ?? 0)")
        print("nominalChargeCapacity: \(nominalChargeCapacity ?? 0)")
        print("fullyCharged: \(fullyCharged ?? 0)")
        print("chargingOverride: \(chargingOverride ?? 0)")
        print("manufacturerData: \(manufacturerData ?? 0)")
        print("fedDetails: \(fedDetails ?? 0)")
        print("fullPathUpdated: \(fullPathUpdated ?? 0)")
        print("batteryInvalidWakeSeconds: \(batteryInvalidWakeSeconds ?? 0)")
        print("chargerData: \(chargerData ?? 0)")
        print("bootPathUpdated: \(bootPathUpdated ?? 0)")
        print("designCycleCount9C: \(designCycleCount9C ?? 0)")
        print("adapterDetails: \(adapterDetails ?? 0)")
        print("powerTelemetryData: \(powerTelemetryData ?? 0)")
        print("maxCapacity: \(maxCapacity ?? 0)")
        print("instantAmperage: \(instantAmperage ?? 0)")
        print("gasGaugeFirmwareVersion: \(gasGaugeFirmwareVersion ?? 0)")
        print("adapterInfo: \(adapterInfo ?? 0)")
        print("location: \(location ?? 0)")
        print("temperature: \(temperature ?? 0)")
        print("avgTimeToEmpty: \(avgTimeToEmpty ?? 0)")
        print("bestAdapterIndex: \(bestAdapterIndex ?? 0)")
        print("designCapacity: \(designCapacity ?? 0)")
        print("permanentFailureStatus: \(permanentFailureStatus ?? 0)")
        print("voltage: \(voltage ?? 0)")
        print("userVisiblePathUpdated: \(userVisiblePathUpdated ?? 0)")
        print("cycleCount: \(cycleCount ?? 0)")
        print("appleRawMaxCapacity: \(appleRawMaxCapacity ?? 0)")
        print("virtualTemperature: \(virtualTemperature ?? 0)")
     
    }
    
}
