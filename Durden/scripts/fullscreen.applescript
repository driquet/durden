tell application "Finder"
	set screenSize to bounds of window of desktop
	set screen_width to item 3 of screenSize
	set screen_height to item 4 of screenSize
	-- display dialog "width " & screen_width & " height " & screen_height
end tell

set activeApp to (path to frontmost application as Unicode text)

tell application activeApp
	activate
	set bounds of window 1 to {0, 0, screen_width, screen_height}
end tell


