# Mac Circle

Touch on the Power


![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)
![GitHub watchers](https://img.shields.io/github/watchers/brk-ozs11/Mac-Circle)
![GitHub stars](https://img.shields.io/github/stars/brk-ozs11/Mac-Circle)
![GitHub forks](https://img.shields.io/github/forks/brk-ozs11/Mac-Circle)
![GitHub repo size](https://img.shields.io/github/repo-size/brk-ozs11/Mac-Circle)


Mac Circle is a macOS app developed with SwiftUI 

## Overview

### Highlights

The main view provides essential information about your Mac's battery, including:

- Temperature: in Celsius
- Time Remaining: time to fully charge or time to run out
- Adapter Detail: important information about the power adapter
- Battery: remaining percentage
- Cycle Count: maximum cycle count for a battery life is 1000
- Battery Health

When your Mac starts or stops charging, the Highlights view will show or hide adapter details with smooth animations.

### Screen Saver

A visually appealing view with 100 blocks representing the current battery capacity.

### Row Data

This view displays all data from IOPSCopyPowerSourcesInfo and AppleSmartBattery without any transformation. It also supports searching, highlighting search results in green.

### Menu Bar Extra

The MenuBarExtra will always appear on the top right of your Mac's menu bar, providing quick access to Mac Battery Inspector, unless the app is quit.

### Dark Mode

Mac Battery Inspector supports dark mode. Users can select the mode in the top-right corner of the toolbar to follow the system's preference or their own preference.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Note**: Replace `your-username` with your actual GitHub username in the badge links.

![App Screenshot](screenshot.png)
