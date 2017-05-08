---
title: Visual Studio Code Shortcuts
author: Adron Hall
date: 2016-08-25:13:47:15
template: doc.jade
---
For more on keyboard shortcuts and binding checkout the [Key Bindings for Visual Studio Code](https://code.visualstudio.com/docs/customization/keybindings).

## Basic Editing

* ⌘X	Cut line (empty selection)	editor.action.clipboardCutAction
* ⌘C	Copy line (empty selection)	editor.action.clipboardCopyAction
* ⇧⌘K	Delete Line	editor.action.deleteLines
* ⌘Enter	Insert Line Below	editor.action.insertLineAfter
* ⇧⌘Enter	Insert Line Above	editor.action.insertLineBefore
* ⌥↓	Move Line Down	editor.action.moveLinesDownAction
* ⌥↑	Move Line Up	editor.action.moveLinesUpAction
* ⇧⌥↓	Copy Line Down	editor.action.copyLinesDownAction
* ⇧⌥↑	Copy Line Up	editor.action.copyLinesUpAction
* ⌘D	Add Selection To Next Find Match	editor.action.addSelectionToNextFindMatch
* ⌘K ⌘D	Move Last Selection To Next Find Match	editor.action.moveSelectionToNextFindMatch
* ⌘U	Undo last cursor operation	cursorUndo
* ⇧⌥I	Insert cursor at end of each line selected	editor.action.insertCursorAtEndOfEachLineSelected
* ⇧⌘L	Select all occurrences of current selection	editor.action.selectHighlights
* ⌘F2	Select all occurrences of current word	editor.action.changeAll
* ⌘I	Select current line	expandLineSelection
* ⌥⌘↓	Insert Cursor Below	editor.action.insertCursorBelow
* ⌥⌘↑	Insert Cursor Above	editor.action.insertCursorAbove
* ⇧⌘\	Jump to matching bracket	editor.action.jumpToBracket
* ⌘]	Indent Line	editor.action.indentLines
* ⌘[	Outdent Line	editor.action.outdentLines
* Home	Go to Beginning of Line	cursorHome
* End	Go to End of Line	cursorEnd
* ⌘↓	Go to End of File	cursorBottom
* ⌘↑	Go to Beginning of File	cursorTop
* ⌃PageDown	Scroll Line Down	scrollLineDown
* ⌃PageUp	Scroll Line Up	scrollLineUp
* ⌘PageDown	Scroll Page Down	scrollPageDown
* ⌘PageUp	Scroll Page Up	scrollPageUp
* ⇧⌘[	Fold (collapse) region	editor.fold
* ⇧⌘]	Unfold (uncollapse) region	editor.unfold
* ⌘K ⌘[	Fold (collapse) all subregions	editor.foldRecursively
* ⌘K ⌘]	Unfold (uncollapse) all subregions	editor.unfoldRecursively
* ⌘K ⌘0	Fold (collapse) all regions	editor.foldAll
* ⌘K ⌘J	Unfold (uncollapse) all regions	editor.unfoldAll
* ⌘K ⌘C	Add Line Comment	editor.action.addCommentLine
* ⌘K ⌘U	Remove Line Comment	editor.action.removeCommentLine
* ⌘/	Toggle Line Comment	editor.action.commentLine
* ⇧⌥A	Toggle Block Comment	editor.action.blockComment
* ⌘F	Find	actions.find
* ⌥⌘F	Replace	editor.action.startFindReplaceAction
* ⌘G	Find Next	editor.action.nextMatchFindAction
* ⇧⌘G	Find Previous	editor.action.previousMatchFindAction
* ⌥Enter	Select All Occurences of Find Match	editor.action.selectAllMatches
* ⌥⌘C	Toggle Find Case Sensitive	toggleFindCaseSensitive
* ⌥⌘R	Toggle Find Regex	toggleFindRegex
* ⌥⌘W	Toggle Find Whole Word	toggleFindWholeWord
* ⌃⇧M	Toggle Use of Tab Key for Setting Focus	editor.action.toggleTabFocusMode
* unassigned	Toggle Render Whitespace	toggleRenderWhitespace

## Rich Languages Editing

* ⌃Space	Trigger Suggest	editor.action.triggerSuggest
* ⇧⌘Space	Trigger Parameter Hints	editor.action.triggerParameterHints
* ⇧⌥F	Format Code	editor.action.format
* F12	Go to Definition	editor.action.goToDeclaration
* ⌥F12	Peek Definition	editor.action.previewDeclaration
* ⌘K F12	Open Definition to the Side	editor.action.openDeclarationToTheSide
* ⌘.	Quick Fix	editor.action.quickFix
* ⇧F12	Show References	editor.action.referenceSearch.trigger
* F2	Rename Symbol	editor.action.rename
* ⇧⌘.	Replace with Next Value	editor.action.inPlaceReplace.down
* ⇧⌘,	Replace with Previous Value	editor.action.inPlaceReplace.up
* ⌃⇧⌘→	Expand AST Select	editor.action.smartSelect.grow
* ⌃⇧⌘←	Shrink AST Select	editor.action.smartSelect.shrink
* ⌘K ⌘X	Trim Trailing Whitespace	editor.action.trimTrailingWhitespace
* ⌘K M	Change Language Mode	workbench.action.editor.changeLanguageMode

## Navigation

* ⌘T	Show All Symbols	workbench.action.showAllSymbols
* ⌃G	Go to Line...	workbench.action.gotoLine
* ⌘P	Go to File..., Quick Open	workbench.action.quickOpen
* ⇧⌘O	Go to Symbol...	workbench.action.gotoSymbol
* ⇧⌘M	Show Problems	workbench.actions.view.problems
* F8	Go to Next Error or Warning	editor.action.marker.next
* ⇧F8	Go to Previous Error or Warning	editor.action.marker.prev
* ⇧⌘P	Show All Commands	workbench.action.showCommands
* ⌃⇧Tab	Navigate Editor Group History	workbench.action.openPreviousRecentlyUsedEditorInGroup
* ⌃-	Go Back	workbench.action.navigateBack
* ⌃⇧-	Go Forward	workbench.action.navigateForward

## Editor/Window Management

* ⇧⌘N	New Window	workbench.action.newWindow
* ⌘W	Close Window	workbench.action.closeWindow
* ⌘W	Close Editor	workbench.action.closeActiveEditor
* ⌘K F	Close Folder	workbench.action.closeFolder
* unassigned	Cycle Between Editor Groups	workbench.action.navigateEditorGroups
* ⌘ (forward slash)	Split Editor	workbench.action.splitEditor
* ⌘1	Focus into Left Editor Group	workbench.action.focusFirstEditorGroup
* ⌘2	Focus into Side Editor Group	workbench.action.focusSecondEditorGroup
* ⌘3	Focus into Right Editor Group	workbench.action.focusThirdEditorGroup
* ⌘K ⌘←	Focus into Editor Group on the Left	workbench.action.focusPreviousGroup
* ⌘K ⌘→	Focus into Editor Group on the Right	workbench.action.focusNextGroup
* ⌘K ←	Move Active Editor Group Left	workbench.action.moveActiveEditorGroupLeft
* ⌘K →	Move Active Editor Group Right	workbench.action.moveActiveEditorGroupRight

## File Management

* ⌘N	New File	workbench.action.files.newUntitledFile
* unassigned	Open File...	workbench.action.files.openFile
* ⌘S	Save	workbench.action.files.save
* unassigned	Save All	workbench.action.files.saveAll
* ⇧⌘S	Save As...	workbench.action.files.saveAs
* ⌘W	Close	workbench.action.closeActiveEditor
* ⌥⌘T	Close Others	workbench.action.closeOtherEditors
* ⌘K W	Close Group	workbench.action.closeEditorsInGroup
* unassigned	Close Other Groups	workbench.action.closeEditorsInOtherGroups
* unassigned	Close Group to Left	workbench.action.closeEditorsToTheLeft
* unassigned	Close Group to Right	workbench.action.closeEditorsToTheRight
* ⌘K ⌘W	Close All	workbench.action.closeAllEditors
* ⌘K Enter	Keep Open	workbench.action.keepEditor
* ⌃Tab	Open Next	workbench.action.openNextRecentlyUsedEditorInGroup
* ⌃⇧Tab	Open Previous	workbench.action.openPreviousRecentlyUsedEditorInGroup
* ⌘K P	Copy Path of Active File	workbench.action.files.copyPathOfActiveFile
* ⌘K R	Reveal Active File in Windows	workbench.action.files.revealActiveFileInWindows
* ⌘K O	Show Opened File in New Window	workbench.action.files.showOpenedFileInNewWindow
* unassigned	Compare Opened File With	workbench.files.action.compareFileWith

## Display

* ⌃⌘F	Toggle Full Screen	workbench.action.toggleFullScreen
* ⌘=	Zoom in	workbench.action.zoomIn
* ⌘-	Zoom out	workbench.action.zoomOut
* ⌘B	Toggle Sidebar Visibility	workbench.action.toggleSidebarVisibility
* ⇧⌘D	Show Debug	workbench.view.debug
* ⇧⌘E	Show Explorer / Toggle Focus	workbench.view.explorer
* ⌃⇧G	Show Git	workbench.view.git
* ⇧⌘F	Show Search	workbench.view.search
* ⇧⌘H	Replace in Files	workbench.action.replaceInFiles
* ⇧⌘X	Show Extensions	workbench.view.extensions
* ⇧⌘J	Toggle Search Details	workbench.action.search.toggleQueryDetails
* ⇧⌘C	Open New Command Prompt	workbench.action.terminal.openNativeConsole
* ⇧⌘U	Show Output	workbench.action.output.toggleOutput
* ⇧⌘V	Toggle Markdown Preview	markdown.showPreview
* ⌘K V	Open Preview to the Side	markdown.showPreviewToSide
* ⌃ (tick)	Toggle Integrated Terminal	workbench.action.terminal.toggleTerminal

## Preferences

* ⌘,	Open User Settings	workbench.action.openGlobalSettings
* unassigned	Open Workspace Settings	workbench.action.openWorkspaceSettings
* unassigned	Open Keyboard Shortcuts	workbench.action.openGlobalKeybindings
* unassigned	Open User Snippets	workbench.action.openSnippets
* unassigned	Select Color Theme	workbench.action.selectTheme
* unassigned	Configure Display Language	workbench.action.configureLocale
* Debug
* Key	Command	Command id
* F9	Toggle Breakpoint	editor.debug.action.toggleBreakpoint
* F5	Continue	workbench.action.debug.continue
* F5	Pause	workbench.action.debug.start
* F11	Step Into	workbench.action.debug.stepInto
* ⇧F11	Step Out	workbench.action.debug.stepOut
* F10	Step Over	workbench.action.debug.stepOver
* ⇧F5	Stop	workbench.action.debug.stop
* ⌘K ⌘I	Show Hover	editor.action.showHover
* Tasks
* Key	Command	Command id
* ⇧⌘B	Run Build Task	workbench.action.tasks.build
* unassigned	Run Test Task	workbench.action.tasks.test
* Extensions
* Key	Command	Command id
* unassigned	Install Extension	workbench.extensions.action.installExtension
* unassigned	Show Installed Extensions	workbench.extensions.action.showInstalledExtensions
* unassigned	Show Outdated Extensions	workbench.extensions.action.listOutdatedExtensions
* unassigned	Show Recommended Extensions	workbench.extensions.action.showRecommendedExtensions
* unassigned	Show Popular Extensions	workbench.extensions.action.showPopularExtensions
