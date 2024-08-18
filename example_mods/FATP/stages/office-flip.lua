

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

	makeLuaSprite('darklight','stages/Office/DarkLight',-1200,-900)
	addLuaSprite('darklight')
	setObjectOrder('darklight', 9)
	screenCenter("darklight")
	setProperty("darklight.alpha", 0)
end
function onEvent(eventName, value1)
	if eventName == 'power' then
		if value1 == 'powerout' then
			doTweenAlpha("bye Bg", "powerbg", 0, 2)
			doTweenAlpha("bye Top", "powerbgtop", 0, 2)
			doTweenAlpha("TURN TURN TURN TURN IT", "darkbg", 1, 2)
			doTweenAlpha("TURN IT TO SIX GO TO SIX3", "darklight", 1, 2)
		elseif value1 == 'blackout' then
			doTweenAlpha("Warning: Vital Signs Critical", "darkbg", 0, 0.9)
			doTweenAlpha("Your All Alone", "gf", 0, 0.9)
			doTweenAlpha("I'm Dead", "dad", 0, 1, 'bounceInOut')
		end
	end
end