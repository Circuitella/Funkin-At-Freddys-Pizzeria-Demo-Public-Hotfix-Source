function onGameOver()
    setPropertyFromClass('flixel.FlxG','camera.zoom',0.8)
    runHaxeCode(
        [[
            FlxTween.tween(FlxG.camera,{zoom: 1.5},0.5,{ease: FlxEase.expoIn});
            return;
        ]]
    )
end
function onGameOverStart()
    i = getRandomInt(1, 8)
    playSound('freddygameover/gamovervoiceline_freddy'..i) 
end