import Foundation
import Cocoa
import ApplicationServices

// WARNING
// 1. You need to allow terminal app's Accessibility permissions for this script to work.
//      - In "System Preferences" > "Security & Privacy" > "Accessibility".
// 2. 🚨windowRectはメインディスプレイ左上が原点で、screen.frameはメインディスプレイ左下が原点のようです。
func moveActiveWindowToTopLeftEighth() {
    // 最前面のアプリケーション取得
    guard let frontmostAppPID = NSWorkspace.shared.frontmostApplication?.processIdentifier else {
        print("Could not find frontmost application.")
        return
    }

    let appRef = AXUIElementCreateApplication(frontmostAppPID)
    
    // フロントウィンドウを取得
    var windowRef: AnyObject?
    AXUIElementCopyAttributeValue(appRef, kAXFocusedWindowAttribute as CFString, &windowRef)
    
    guard let frontWindow = windowRef else {
        print("Could not find front window.")
        return
    }

    // ウィンドウの現在位置とサイズを取得
    var positionRef: AnyObject?
    var sizeRef: AnyObject?

    AXUIElementCopyAttributeValue(frontWindow as! AXUIElement, kAXPositionAttribute as CFString, &positionRef)
    AXUIElementCopyAttributeValue(frontWindow as! AXUIElement, kAXSizeAttribute as CFString, &sizeRef)

    var posPoint = CGPoint()
    var sizeValue = CGSize()

    if CFGetTypeID(positionRef) == AXValueGetTypeID(),
       CFGetTypeID(sizeRef) == AXValueGetTypeID(),
       let posVal = positionRef as! AXValue?,
       AXValueGetType(posVal) == .cgPoint,
       AXValueGetValue(posVal, .cgPoint, &posPoint),
       let sizeVal = sizeRef as! AXValue?,
       AXValueGetType(sizeVal) == .cgSize,
       AXValueGetValue(sizeVal, .cgSize, &sizeValue) {
        // OK
    } else {
        print("Could not extract CGPoint and CGSize from AXValue")
        return
    }

    // ウィンドウ矩形と各スクリーンの交差面積を比較して最大のスクリーンを選択
    let windowRect = CGRect(origin: posPoint, size: sizeValue)
    print("Window rect: \(windowRect)")
    for (i, screen) in NSScreen.screens.enumerated() {
        let frame = screen.frame
        let intersection = frame.intersection(windowRect)
        let area = intersection.width * intersection.height
        // frame is (x: 0.0, y: 0.0, width: 1440.0, height: 900.0)
        print("Screen \(i): \(frame), intersection area: \(area)")
    }
    let topLeftPoint = windowRect.origin
    // Adjust y to convert from AppKit (origin top-left) to CoreGraphics (origin bottom-left)
    let adjustedTopLeftPoint = CGPoint(x: topLeftPoint.x, y: NSScreen.screens[0].frame.maxY - topLeftPoint.y)
    var matchingScreen: NSScreen? = nil
    for screen in NSScreen.screens {
        let frame = screen.frame
        print("Screen frame: \(frame), topLeftPoint: \(topLeftPoint), adjustedTopLeftPoint: \(adjustedTopLeftPoint), frame minX: \(frame.minX), maxX: \(frame.maxX), minY: \(frame.minY), maxY: \(frame.maxY)")
        if adjustedTopLeftPoint.x >= frame.minX &&
           adjustedTopLeftPoint.x < frame.maxX &&
           adjustedTopLeftPoint.y >= frame.minY &&
           adjustedTopLeftPoint.y < frame.maxY {
            print("Found matching screen: \(screen)")
            matchingScreen = screen
            break
        }
    }

    guard let screen = matchingScreen else {
        print("Could not determine the screen containing the window's top-left corner.")
        return
    }

    let screenFrame = screen.frame

    // 画面を縦4列×横2行に分割 → 左下(1列目1行目)に移動
    let targetWidth = screenFrame.width / 4
    let targetHeight = screenFrame.height / 2
    let targetOrigin: CGPoint
    if topLeftPoint.y >= 0 {
        targetOrigin = CGPoint(x: screenFrame.minX,
                               y: targetHeight) // メインディスプレイの左上原点
    } else {
        targetOrigin = CGPoint(x: screenFrame.minX,
                               y: -targetHeight) // メインディスプレイの左上原点
    }
    // let targetOrigin = CGPoint(x: screenFrame.minX,
    //                            y: screenFrame.maxY - targetHeight) // macOSは左下原点なので注意

    // 移動とリサイズ
    var newOrigin = CGPoint(x: targetOrigin.x, y: targetOrigin.y)
    var newSize = CGSize(width: targetWidth, height: targetHeight)

    AXUIElementSetAttributeValue(frontWindow as! AXUIElement,
                                 kAXPositionAttribute as CFString,
                                 AXValueCreate(.cgPoint, &newOrigin)!)

    AXUIElementSetAttributeValue(frontWindow as! AXUIElement,
                                 kAXSizeAttribute as CFString,
                                 AXValueCreate(.cgSize, &newSize)!)
}

moveActiveWindowToTopLeftEighth()