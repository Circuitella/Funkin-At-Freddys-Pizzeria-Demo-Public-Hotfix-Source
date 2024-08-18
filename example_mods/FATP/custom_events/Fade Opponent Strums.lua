function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'Fade Opponent Strums' then
        for i = 0,4 do
            noteTweenAlpha("byenotealpha"..i , i-1, value1, value2, "linear")
        end
    end
end