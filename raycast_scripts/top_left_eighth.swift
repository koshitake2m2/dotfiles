import Foundation
import Cocoa
import ApplicationServices

func moveActiveWindowToTopLeftEighth() {
    guard let frontmostAppPID = NSWorkspace.shared.frontmostApplication?.processIdentifier else {
        print("Could not find frontmost application.")
        return
    }

    let appRef = AXUIElementCreateApplication(frontmostAppPID)
    
    var windowRef: AnyObject?
    AXUIElementCopyAttributeValue(appRef, kAXFocusedWindowAttribute as CFString, &windowRef)
    
    guard let frontWindow = windowRef else {
        print("Could not find front window.")
        return
    }

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
    } else {
        print("Could not extract CGPoint and CGSize from AXValue")
        return
    }

    let windowRect = CGRect(origin: posPoint, size: sizeValue)
    print("Window rect: \(windowRect)")
    for (i, screen) in NSScreen.screens.enumerated() {
        let frame = screen.frame
        let intersection = frame.intersection(windowRect)
        let area = intersection.width * intersection.height
        print("Screen \(i): \(frame), intersection area: \(area)")
    }
    let topLeftPoint = windowRect.origin
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

    let targetWidth = screenFrame.width / 4
    let titleBarHeight: CGFloat = 24
    let targetHeight = screenFrame.height / 2 - titleBarHeight / 2

    let targetOrigin: CGPoint
    if topLeftPoint.y >= 0 {
        targetOrigin = CGPoint(x: screenFrame.minX,
                               y: 0)
    } else {
        targetOrigin = CGPoint(x: screenFrame.minX,
                               y: -screenFrame.height)
    }

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