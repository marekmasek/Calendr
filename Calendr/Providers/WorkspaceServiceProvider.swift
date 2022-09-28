//
//  WorkspaceServiceProvider.swift
//  Calendr
//
//  Created by Paker on 21/02/2021.
//

import AppKit.NSWorkspace

protocol WorkspaceServiceProviding {

    var notificationCenter: NotificationCenter { get }

    func urlForApplication(toOpen url: URL) -> URL?
    func supports(scheme: String) -> Bool
    func open(_ url: URL)
}

class WorkspaceServiceProvider: WorkspaceServiceProviding {

    let notificationCenter: NotificationCenter = NSWorkspace.shared.notificationCenter

    func urlForApplication(toOpen url: URL) -> URL? {
        NSWorkspace.shared.urlForApplication(toOpen: url)
    }

    func supports(scheme: String) -> Bool {
        URL(string: scheme).map(urlForApplication(toOpen:)) != nil
    }

    func open(_ url: URL) {
        NSWorkspace.shared.open(url)
    }
}
