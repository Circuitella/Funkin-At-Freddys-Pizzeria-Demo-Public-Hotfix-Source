function onCreate()
	makeLuaSprite('powerbg','stages/Office/MainBG',-800,-200)
	addLuaSprite('powerbg')

	makeLuaSprite('powerbgtop','stages/Office/Light',-1200,-900)
	addLuaSprite('powerbgtop')
	setObjectOrder('powerbgtop', 9)
	screenCenter('powerbgtop')

	makeLuaSprite('darkbg','stages/Office/DarkBG',-800,-200)
	addLuaSprite('darkbg')
	setProperty("darkbg.alpha", 0)


	makeLuaSprite('darklight','stages/Office/DarkLight',-800,-200)
	addLuaSprite('darklight')
	setObjectOrder('darklight', 9)
	setProperty("darklight.alpha", 0)
end
function onEvent(eventName)
	if eventName == 'powerout' then
		doTweenAlpha("hi darkness1", "powerbg", 0, 2)
		doTweenAlpha("hi darkness3", "powerbgtop", 0, 2)
		doTweenAlpha("hi darkness2", "darkbg", 1, 2)
		doTweenAlpha("hi darkness2", "darklight", 1, 2)

	elseif eventName == 'freddyeatthisguysass' then
		doTweenAlpha("freddy bout to stuff this mf", "game.camGame.alpha", 0, 0.5)
	end
end