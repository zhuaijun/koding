class IDEFilesTabView extends WorkspaceTabView

  constructor: (options = {}, data) ->

    options.cssClass      = 'ide-files-tab'
    options.addPlusHandle = no

    super options, data

    filesPane  = new KDTabPaneView
      name     : 'Files'
      closable : no

    @finderPane = new FinderPane
    filesPane.addSubView @finderPane

    @tabView.addPane filesPane

    vmsPane    = new KDTabPaneView
      name     : 'VMs'
      closable : no

    vmsPane.addSubView new VMListPane
    @tabView.addPane  vmsPane

    settingsPane = new KDTabPaneView
      name       : 'Settings'
      closable   : no

    settingsPane.addSubView new SettingsPane
    @tabView.addPane settingsPane

    @on 'VMMountRequested', (vmData) =>
      @finderPane.emit 'VMMountRequested', vmData

    @on 'VMUnmountRequested', (vmData) =>
      @finderPane.emit 'VMUnmountRequested', vmData


