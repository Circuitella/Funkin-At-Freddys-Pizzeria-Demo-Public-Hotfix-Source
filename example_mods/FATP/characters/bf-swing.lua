function onUpdate()
    if getProperty('boyfriend.curCharacter') == 'bf-swing' and getProperty('boyfriend.animation.curAnim.finished') == true then
        if curBeat %2 == 0 then
            characterPlayAnim('boyfriend','danceRight')
        elseif curBeat % 4 == 0 then
            characterPlayAnim('boyfriend','danceLeft')
        end
    end
end