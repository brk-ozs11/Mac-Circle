//
//  ContentView.swift
//  Mac Circle
//
//  Created by Berk Özüş on 8.09.2023.
//

import SwiftUI

struct contentView: View {
    
    @ObservedObject var batteryHelper = AppleSmartBatteryHelper()
    @ObservedObject var powerSources = PowerSourcesHelper()
    
    @State private var scale: CGFloat = 1.0
    private let scaleValues: [CGFloat] = [0.4, 0.7]
    
    @State private var isPopoverVisible = false
    @State private var isPopoverVisible1 = false
   
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        VStack {
            
            Spacer().frame(height: 10)
                
                HStack {
                    
                    Text("Mac Circle")
                        .font(.headline)
                        .frame(alignment: .center)
                    
                    Image(systemName: "circle.fill")
                    
                }
                
            GroupBox {
                
                HStack {
                    
                    Group {
                        
                        HStack {
                            
                            Divider().frame(height: 110)
                            
                            Spacer(minLength: -10)
                            
                            if let currentCapacity = batteryHelper.currentCapacity {
                                Text("Battery Percentage")
                                
                                Gauge(value: Double(currentCapacity), in: 0...100) {
                                    Text("%\(currentCapacity)")
                                }.gaugeStyle(.accessoryCircularCapacity)
                                    .tint(.blue)
                                    .scaleEffect(1)
                                    .frame(width: 50, height: 50)
                                
                            }
                            
                        }.frame(width: 140, height: 100)
                        

                        Divider().frame(height: 110)
                        
                        Spacer().frame(width: 10)
                        
                        
                        HStack {
                            
                            VStack {
                                
                                Image(systemName: "battery.25")
                                
                                Text("Low Power Mode")
                                
                            }.frame(width: 70, height: 50)
                            
                            if let lpmActive = powerSources.powerSource.first(where: { $0.key == "LPM Active" })?.value as? Int {
                                
                                VStack {
                                    
                                    if lpmActive == 0 {
                                        
                                        Image(systemName: "power.circle")
                                        
                                        Text("OFF")
                                            .foregroundColor(.blue)
                                        
                                    } else {
                                        
                                        Image(systemName: "power.circle.fill")
                                        
                                        Text("ON")
                                            .foregroundColor(.blue)
                                        
                                    }
                                    
                                }

                            }

                        }.frame(width: 140, height: 100)
                        
                        
                        Divider().frame(height: 110)
                        
                        Spacer().frame(width: 10)
                        
                        
                        VStack {
                            
                            Image(systemName: "info.circle.fill")
                                .onTapGesture {
                                    isPopoverVisible1.toggle()
                                }
                                .popover(isPresented: $isPopoverVisible1, attachmentAnchor: .rect(.bounds), arrowEdge: .top) {
                                    
                                    VStack {
                                        
                                            
                                            HStack {
                                                
                                                Image(systemName: "checkmark.circle.fill")
                                                Text("Good")
                                                    .frame(width: 40, height: 20)
                                                Spacer().frame(width: 10)
                                            }
                                            
                                            Text("Good Performance Battery")
                                                .frame(width: 170, height: 13)
                                                .foregroundColor(.blue)
                                            Spacer().frame(height: 15)
                                            
                                            HStack {
                                                Image(systemName: "exclamationmark.circle.fill")
                                                Text("Fair")
                                                    .frame(width: 40, height: 20)
                                                Spacer().frame(width: 10)
                                            }
                                            
                                            Text("Limited Capacity Battery")
                                                .frame(width: 150, height: 20)
                                                .foregroundColor(.blue)
                                            
                                            Spacer().frame(height: 15)
                                        
                                            HStack {
                                                Image(systemName: "xmark.circle.fill")
                                                Text("Poor")
                                                    .frame(width: 40, height: 20)
                                                Spacer().frame(width: 10)
                                            }
                                            Text("Battery That Cannot Provide Power")
                                                .frame(width: 220, height: 20)
                                                .foregroundColor(.blue)
                                        
                                    }.frame(width: 230, height: 180)
                                }
                            
                            Spacer().frame(height: 10)
                            
                            
                            Image(systemName: "heart.fill")
                            
                            Text("Battery Health")
                            
                            Spacer().frame(height: 10)
                            
                            if let batteryHealth = powerSources.powerSource.first(where: { $0.key == "BatteryHealth" })?.value as? String {
                                
                                Text("\(batteryHealth)")
                                    .foregroundColor(.blue)
                                
                            }
                            
                            Spacer().frame(height: 20)
                            
                        }.frame(width: 140, height: 100)
                        
                      
                        Divider().frame(height: 110)
                        
                        Spacer().frame(width: 10)
                        
                        
                    }
                    
                    HStack {
                        
                        if let timeRemaining = batteryHelper.timeRemaining {
                            
                            VStack {
                                
                                Image(systemName: "clock.badge.fill")
                                
                                Text("Time Remaining")
                                
                            }.frame(width: 70)

                            if timeRemaining >= 2000 {
                                Text("Calculating")
                                    .frame(width: 70)
                                    .foregroundColor(.blue)
                            } else {
                                
                                
                                let hours = timeRemaining / 60
                                let minutes = timeRemaining % 60
                                
                                // Sonucu ekrana yazdır
                                if hours > 0 {
                                    Text("\(hours) h : \(minutes) m")
                                        .frame(width: 75, height: 20)
                                        .foregroundColor(.blue)
                                } else {
                                    Text("\(minutes) m")
                                        .frame(width: 75, height: 20)
                                        .foregroundColor(.blue)
                                }
                                
                            }
                            
                        }
                        
                        
                        Spacer().frame(height: 10)
                        
                    }.frame(width: 140, height: 100)
                    
                    
                    Divider().frame(height: 110)
                    
                    Spacer().frame(width: 10)
                    
                    
                    Group {
                        
                        HStack {
                            
                            if let temperature = batteryHelper.temperature {
                                
                                let formattedTemperature = String(format: "%.2f", Double(temperature)/100)
                                
                                VStack {
                                    
                                    Image(systemName: "info.circle.fill")
                                        .onTapGesture {
                                            isPopoverVisible.toggle()
                                        }
                                        .popover(isPresented: $isPopoverVisible, attachmentAnchor: .rect(.bounds), arrowEdge: .top) {
                                            
                                            VStack {
                                                
                                                HStack {
                                                    
                                                    Image(systemName: "snow")
                                                    Text("Below 10°C / 50°F")
                                                        .frame(width: 120, height: 20)
                                                    
                                                }
                                                
                                                Text("Low Temperature")
                                                    .frame(width: 130, height: 10)
                                                    .foregroundColor(.blue)
                                                
                                                Spacer().frame(height: 15)
                                                
                                                HStack {
                                                    
                                                    Image(systemName: "checkmark.circle.fill")
                                                    
                                                    Text("10-35°C / 50-95°F")
                                                        .frame(width: 120, height: 20)
                                                    
                                                }
                                                
                                                Text("Perfect Temperature")
                                                    .frame(width: 130, height: 10)
                                                    .foregroundColor(.blue)
                                                
                                                Spacer().frame(height: 15)
                                                
                                                HStack {
                                                    
                                                    Image(systemName: "flame.fill")
                                                    Text("Above 35°C / 95°F")
                                                        .frame(width: 120, height: 20)
                                                    
                                                }
                                                Text("High Temperature")
                                                    .frame(width: 130, height: 10)
                                                    .foregroundColor(.blue)
                                                
                                                HStack {
                                                    
                                                    Spacer().frame(width: 150, height: 30)
                                                    
                                                    VStack {
                                                        
                                                        Spacer().frame(height: 20)
                                                        
                                                        Button("Learn More") {
                                                            openURL(URL(string: "https://www.apple.com/batteries/maximizing-performance/")!)
                                                            
                                                        }.frame(width: 70, height: 15)
                                                            .font(.system(size: 10))
                                                            .controlSize(.mini)
                                                    }
                                                    
                                                }
                                                
                                            }.frame(width: 230, height: 180)
                                        }
                                
                                    
                                    
                                    Spacer().frame(height: 4)
                                    
                                    Image(systemName: "thermometer.medium")
                                    
                                    Text("Temperature")
                                    
                                    Spacer().frame(height: 10)
                                    
                                    VStack {
                                        
                                        if Double(formattedTemperature) ?? 0 < 10.00 {
                                            
                                            Text("Low Temperature")
                                                .foregroundColor(.blue)
                                            
                                            
                                        } else if Double(formattedTemperature) ?? 0 <= 35.00 {
                                            
                                            Text("Perfect Temperature")
                                                .frame(width: 80, height: 32)
                                                .foregroundColor(.blue)
                                            
                                        } else {
                                            
                                            Text("High Temperature")
                                                .foregroundColor(.blue)
                                            
                                        }
                                    }.frame(width: 90)
                                    
                                    Spacer().frame(height: 10)
                                    
                                }.frame(width: 80)
                                
                                VStack {
                                    
                                    Spacer().frame(height: 10)
                                    
                                    Gauge(value: Double(formattedTemperature)!, in: 0...40) {
                                        
                                        Text("\(formattedTemperature) ◦C")
                                        
                                    }.gaugeStyle(.accessoryCircularCapacity)
                                        .tint(.blue)
                                        .scaleEffect(1)
                                        .frame(width: 50, height: 50)
                                    
                                    Spacer().frame(height: 10)

                                    let fahrenheit = (Double(formattedTemperature) ?? 0) * 1.8 + 32
                                    let formattedFahrenheit = String(format: "%0.2f °F", fahrenheit)
                                    Text(formattedFahrenheit)
                                        .frame(width: 70)

                                }
                            }
                            
                        }.frame(width: 140, height: 100)
                        
                        
                        Divider().frame(height: 110)
                        
                        Spacer().frame(width: 10)
                        
                        
                        HStack {
                            
                            if let designCycle = batteryHelper.designCycleCount9C {
                                
                                if let batteryCycle = batteryHelper.cycleCount {
                                    
                                    VStack {
                                        
                                        Image(systemName: "clock.arrow.2.circlepath")
                                        
                                        Text("Battery Cycle")
                                        
                                        Spacer().frame(height: 10)
                                        
                                        Text("Design Cycle:")
                                        
                                        Text("\(String(designCycle))")
                                            .foregroundColor(.blue)
                                        
                                    }.frame(width: 100)
                                    
                                    Gauge(value: Double(batteryCycle), in: 0...Double(designCycle)) {
                                        Text("\(batteryCycle)")
                                            .font(.system(size: 17))
                                    }.gaugeStyle(.accessoryCircularCapacity)
                                        .tint(.blue)
                                        .scaleEffect(1)
                                        .frame(width: 50, height: 50)
                                    
                                }
                                
                                }
                            }.frame(width: 180, height: 100)
                        
                        
                        Divider().frame(height: 110)
                        
                        Spacer().frame(width: 0)
                        
                        
                        HStack {
                            
                            if let batteryHealthCondition = powerSources.powerSource.first(where: { $0.key == "BatteryHealthCondition" })?.value as? String {
                                Text("\(batteryHealthCondition)")
                                    .foregroundColor(.blue)
                            }
                            
                        }
                        
                    }
                    
                }.frame(width: 1000, height: 100)
                
                Spacer(minLength: -20)
                
                VStack {
                    
                    Divider().frame(width: 984)
                    
                }
               
                HStack {
                    
                    HStack {
                        
                        HStack {
                            
                            Group {
                                
                                Divider().frame(height: 146)
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Image(systemName: "battery.100")
                                            .frame(width: 15, height: 15)
                                        
                                        Text("Capacity")
                                        
                                    }
                                    
                                    if let maxCapacity = batteryHelper.appleRawMaxCapacity {
                                        
                                        HStack {
                                            
                                            if let designCapacity = batteryHelper.designCapacity {
                                                
                                                Gauge(value: Double(maxCapacity), in: 0...Double(designCapacity)) {
                                                    Text("\(maxCapacity) mAh")
                                                }.gaugeStyle(.accessoryCircularCapacity)
                                                    .tint(.blue)
                                                    .scaleEffect(1)
                                                    .frame(width: 50, height: 50)
                                                
                                                Spacer().frame(width: 15, height: 10)
                                                
                                                GroupBox {
                                                    
                                                    Text("Design Capacity")
                                                    
                                                    Spacer().frame(width: 15, height: 10)
                                                    
                                                    Text("\(designCapacity) mAh")
                                                        .foregroundColor(.blue)
                                                    
                                                }
                                                
                                            }
                                        }
                                        
                                    }
                                    
                                }.frame(width: 200, height: 100)
                                
                                Spacer().frame(width: 10)
                                

                                Divider().frame(height: 146)
                                
                                Spacer().frame(width: 10)
                                
                                
                                Spacer().frame(width: 10)
                                
                            }
                            
                            Group {
                                
                                GroupBox {
                                    
                                    VStack {
                                        
                                        if let isCharging = batteryHelper.isCharging {
                                            
                                            HStack {
                                                
                                                VStack {
                                                    
                                                    if let powerSourceState = powerSources.powerSource.first(where: { $0.key == "Power Source State" })?.value as? String {
                                                        
                                                        Text("Power Source State")
                                                        
                                                        Spacer().frame(height: 15)
                                                        
                                                        Image(systemName: "rays")
                                                            .frame(width: 5, height: 5)
                                                        
                                                        Spacer().frame(height: 20)
                                                        
                                                        Text("\(powerSourceState)")
                                                            .foregroundColor(.blue)
                                                        
                                                        Spacer().frame(height: 15)
                                                        
                                                    }
                                                    
                                                }.frame(width: 100, height: 110)
                                                
                                                
                                                Spacer().frame(width: 10)
                                                
                                                Divider().frame(height: 130)
                                                
                                        
                                                VStack {
                                                       
                                                    Spacer().frame(height: 10)
                                                    if isCharging  {
                                                        Text("Charging")
                                                            .foregroundColor(.blue)
                                                        
                                                        Spacer().frame(height: 4)
                                                        
                                                        Image(systemName: "bolt.circle.fill")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .scaleEffect(scale)
                                                            .onAppear() {
                                                                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
                                                                    let randomScale = scaleValues.randomElement() ?? 1.0
                                                                    withAnimation(Animation.easeInOut(duration: 1.0)) {
                                                                        self.scale = randomScale
                                                                    }
                                                                }
                                                            }
                                                            .frame(width: 50, height: 50)
                                                        
                                                    } else {
                                                        
                                                        Text("Not Charging")
                                                            .foregroundColor(.blue)
                                                        
                                                        Spacer().frame(height: 4)
                                                        
    
                                                        Image(systemName: "bolt.slash.circle.fill")

                                                    }
                                                    
                                                    if let fullyCharged = batteryHelper.fullyCharged {
                                                        
                                                        if fullyCharged == 1 {
                                                            
                                                            VStack {
                                                                
                                                                Image(systemName: "battery.100")
                                                                Text("Fully Charged")
                                                                    .frame(width: 90, height: 15)
                                                                    .foregroundColor(.blue)
                                                                
                                                            }.frame(width: 50, height: 50)
                                                            
                                                        }
                                                        
                                                    }
                                                
                                                }
                                                
                                                
                                                Spacer().frame(width: 10)
                                                
                                                Divider().frame(height: 130)
                                                
                                                
                                                    VStack {
                                                        
                                                        HStack {
                                                            
                                                            VStack {
                                                                if let adapterDetails = batteryHelper.appleRawAdapterDetails,
                                                                   adapterDetails.count > 0,
                                                                   let adapterDetailsDic = adapterDetails[0] as? Dictionary<String, Any> {
                                                                    
                                                                    
                                                                    if let manufacturer = adapterDetailsDic["Manufacturer"] as? String {
                                                                        HStack {
                                                                            
                                                                            VStack {
                                                                                
                                                                                Spacer().frame(height: 8)
                                                                                    
                                                                                
                                                                                Image(systemName: "cable.connector")
                                                                                
                                                                            }
                                                                            
                                                                            Spacer().frame(width: 50)
                                                                                
                                                                            
                                                                            Text("Manufacturer:")
                                                                            Text(manufacturer)
                                                                                .foregroundColor(.blue)
                                                                            
                                                                            Spacer().frame(width: 60)
                                                                        }
                                                                    }
                                                                    
                                                                    Spacer().frame(height: 3)
                                                                    
                                                                    if let name = adapterDetailsDic["Name"] as? String {
                                                                        HStack {
                                                                            Text("Name:")
                                                                            Text(name)
                                                                                .foregroundColor(.blue)
                                                                        }
                                                                    }
                                                                    
                                                                    Spacer().frame(height: 4)
                                                                    
                                                                    if let description = adapterDetailsDic["Description"] as? String {
                                                                        HStack {
                                                                            Text("Description:")
                                                                            Text(description)
                                                                                .foregroundColor(.blue)
                                                                        }
                                                                    }
                                                                    
                                                                    Spacer().frame(height: 4)
                                                                    
                                                                    if let watts = adapterDetailsDic["Watts"] as? Int {
                                                                        HStack {
                                                                            Text("Watts:")
                                                                            Text("\(watts) W")
                                                                                .foregroundColor(.blue)
                                                                        }
                                                                    }
                                                                    
                                                                    Spacer().frame(height: 4)
                                                                    
                                                                    HStack {
                                                                        if let isWireless = adapterDetailsDic["IsWireless"] as? Int, isWireless == 1 {
                                                                            Text("Is Wireless:")
                                                                            Text("True")
                                                                                .foregroundColor(.blue)
                                                                        } else {
                                                                            Text("Is Wireless:")
                                                                            Text("False")
                                                                                .foregroundColor(.blue)
                                                                        }
                                                                    }
                                                                    
                                                                    HStack {
                                                                        
                                                                        if let timeToFullCharge = powerSources.powerSource.first(where: { $0.key == "Time to Full Charge" })?.value as? Int {
                                                                            
                                                                            let hours = timeToFullCharge / 60
                                                                            let minutes = timeToFullCharge % 60
                                                                            
                                                                            if timeToFullCharge != -1 {
                                                                                
                                                                                if hours > 0 {
                                                                                    Text("Time to Full Charge:")
                                                                                    Text("\(hours) h : \(minutes) m")
                                                                                        .frame(width: 65, height: 20)
                                                                                        .foregroundColor(.blue)
                                                                                } else {
                                                                                    Text("Time to Full Charge:")
                                                                                    Text("\(minutes) m")
                                                                                        .frame(width: 65, height: 20)
                                                                                        .foregroundColor(.blue)
                                                                                }
                                                                                
                                                                            } else {
                                                                                Text("Time to Full Charge:")
                                                                                Text("Calculating")
                                                                                    .frame(width: 70, height: 10)
                                                                                    .foregroundColor(.blue)
                                                                            }
                                                                        }
                                                                    }
                                                                    
                                                                } else {
                                                                    Text("Charger Informations")
                                                                    
                                                                    Spacer().frame(height: 10)
                                                                    
                                                                    Image(systemName: "info.circle.fill")
                                                                }
                                                            }
                                                            .frame(width: 290, height: 120)
                                                            
                                                        }
                                                        
                                                    }.frame(width: 280, height: 120)
                                                    
                                            }
                                            
                                        }
                                        
                                    }.frame(width: 510, height: 120)
                                        
                                }
                                
    
                                Spacer().frame(width: 20)
                                
                                Divider().frame(height: 146)
                                
                                Spacer().frame(width: 0)
                                
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Image(systemName: "battery.100")
                                            .frame(width: 15, height: 15)
                                        
                                        Text("Power")
                                        
                                    }
                                    
                                    GroupBox {
                                        
                                        if let amper = batteryHelper.amperage {
                                            
                                            Text("Current")
                                            
                                            Text("\(amper) mA")
                                                .foregroundColor(.blue)
                                        }
                                        
                                        if let voltage = batteryHelper.voltage {
                                            
                                            Text("Voltage")
                                            
                                            Text("\(voltage) mV")
                                                .foregroundColor(.blue)
                                            
                                        }
                                        
                                    }.frame(width: 80)
                                    
                                }.frame(width: 140, height: 100)
                                
                                Divider().frame(height: 146)
                                
                            }
                            
                        }.frame(width: 1000, height: 200)
                        
                    }.frame(width: 1000, height: 130)
                    
                }
                
            }
            Spacer().frame(height: 10)
                    
        }.frame(width: 1000, height: 300)
            .background(Color.clear)

            }
        }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            contentView()
        }
    }
