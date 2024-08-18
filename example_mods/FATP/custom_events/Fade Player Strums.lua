function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'Fade Player Strums' then
        for i = 5,8 do
            noteTweenAlpha("byenotealpha"..i , i-1, value1, value2, "linear")
        end
    end
end