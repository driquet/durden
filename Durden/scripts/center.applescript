tell application "Finder"
	set screenSize to bounds of window of desktop
	set screen_width to item 3 of screenSize
	set screen_height to item 4 of screenSize
	set screen_half_width to (screen_width / 2)
	set screen_half_height to (screen_height / 2)
end tell

set activeApp to (path to frontmost application as Unicode text)

tell application activeApp
	activate
	set appBounds to bounds of window 1
	set app_left_x to item 1 of appBounds
	set app_left_y to item 2 of appBounds
	set app_right_x to item 3 of appBounds
	set app_right_y to item 4 of appBounds
	set app_width to (app_right_x - app_left_x)
	set app_height to (app_right_y - app_left_y)
	set app_half_width to (app_width / 2)
	set app_half_height to (app_height / 2)
	
	-- display dialog "Left (" & app_left_x & "," & app_left_y & ") - Right (" & app_right_x & "," & app_right_y & ")" & app_width & "x" & app_height & " half " & app_half_width & "x" & app_half_height
	
	set bounds of window 1 to {(screen_half_width - app_half_width), (screen_half_height - app_half_height), (screen_half_width - app_half_width + app_width), (screen_half_height - app_half_height + app_height)}
end tell


