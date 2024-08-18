function onCreate()	
	makeLuaSprite('blackscreen1', 'blackscreen', -500, -500)
    scaleObject('blackscreen1', 5, 5);
    addLuaSprite('blackscreen1', true)
    setObjectCamera('blackscreen1','camHUD')
    setObjectOrder('blackscreen1', 0)
    runHaxeCode('game.skipArrowStartTween = true; game.skipCountdown = true;') --i swear to god this is the only way i could make it work -Circuitella

end
function onSongStart()
    doTweenAlpha('blackscreenFADE', 'blackscreen1', 0, 10)
    onTweenCompleted('blackscreenFADE')
    removeLuaSprite('blackscreen1', true)
end