//
//  AppleSmartBatteryKeyType.swift
//  Mac Circle
//
//  Created by Berk Özüş on 8.09.2023.
//

import Foundation

enum AppleSmartBatteryKeyType: String, CaseIterable {
    case PostChargeWaitSeconds = "PostChargeWaitSeconds"
    case builtIn = "built-in"
    case AppleRawAdapterDetails = "AppleRawAdapterDetails"
    case CurrentCapacity = "CurrentCapacity"
    case PackReserve = "PackReserve"
    case InflowOverride = "InflowOverride"
    case DeviceName = "DeviceName"
    case PostDischargeWaitSeconds = "PostDischargeWaitSeconds"
    case CarrierMode = "CarrierMode"
    case TimeRemaining = "TimeRemaining"
    case ChargerConfiguration = "ChargerConfiguration"
    case IOGeneralInterest = "IOGeneralInterest"
    case IOReportLegend = "IOReportLegend"
    case AtCriticalLevel = "AtCriticalLevel"
    case BatteryCellDisconnectCount = "BatteryCellDisconnectCount"
    case UpdateTime = "UpdateTime"
    case Amperage = "Amperage"
    case AppleRawCurrentCapacity = "AppleRawCurrentCapacity"
    case AbsoluteCapacity = "AbsoluteCapacity"
    case AvgTimeToFull = "AvgTimeToFull"
    case ExternalConnected = "ExternalConnected"
    case ExternalChargeCapable = "ExternalChargeCapable"
    case AppleRawBatteryVoltage = "AppleRawBatteryVoltage"
    case BootVoltage = "BootVoltage"
    case BatteryData = "BatteryData"
    case BatteryInstalled = "BatteryInstalled"
    case IOReportLegendPublic = "IOReportLegendPublic"
    case Serial = "Serial"
    case AppleRawExternalConnected = "AppleRawExternalConnected"
    case KioskMode = "KioskMode"
    case NominalChargeCapacity = "NominalChargeCapacity"
    case FullyCharged = "FullyCharged"
    case ChargingOverride = "ChargingOverride"
    case ManufacturerData = "ManufacturerData"
    case FedDetails = "FedDetails"
    case FullPathUpdated = "FullPathUpdated"
    case BatteryInvalidWakeSeconds = "BatteryInvalidWakeSeconds"
    case ChargerData = "ChargerData"
    case BootPathUpdated = "BootPathUpdated"
    case DesignCycleCount9C = "DesignCycleCount9C"
    case AdapterDetails = "AdapterDetails"
    case PowerTelemetryData = "PowerTelemetryData"
    case MaxCapacity = "MaxCapacity"
    case InstantAmperage = "InstantAmperage"
    case GasGaugeFirmwareVersion = "GasGaugeFirmwareVersion"
    case AdapterInfo = "AdapterInfo"
    case Location = "Location"
    case Temperature = "Temperature"
    case AvgTimeToEmpty = "AvgTimeToEmpty"
    case BestAdapterIndex = "BestAdapterIndex"
    case DesignCapacity = "DesignCapacity"
    case IsCharging = "IsCharging"
    case PermanentFailureStatus = "PermanentFailureStatus"
    case Voltage = "Voltage"
    case UserVisiblePathUpdated = "UserVisiblePathUpdated"
    case CycleCount = "CycleCount"
    case AppleRawMaxCapacity = "AppleRawMaxCapacity"
    case VirtualTemperature = "VirtualTemperature"
}
