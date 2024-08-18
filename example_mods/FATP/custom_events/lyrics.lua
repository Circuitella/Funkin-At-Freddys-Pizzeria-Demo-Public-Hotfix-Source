

function onEvent(name, value1, value2)
    if name == 'lyrics' then
        setTextString('lyric', value1)
        setTextColor('lyric', value2)
    end
end

function onCreate()
    setObjectCamera('NameShit', 'other')
    makeLuaText('NameShit', 'Name', screenWidth, 0, 510)
    addLuaText('NameShit')
    setTextFont('NameShit', 'ARIAL.TTF')
    setTextSize('NameShit', 30)
    setObjectCamera('lyric', 'camOTHER')
    makeLuaText('lyric', '', screenWidth, 0, 545)
    addLuaText('lyric')
    setTextFont('lyric', 'ARIAL.TTF')
    setTextSize('lyric', 30)

    if dadName == 'freddy' or dadName == 'freddy-flipx' or 'freddy-flipx-powerout' then
		setTextString('NameShit', 'Freddy Fazbear:')
    elseif dadName == 'bonnie' then
		setTextString('NameShit', 'Bonnie:')
    elseif dadName == 'chica' then
        setTextString('NameShit', 'Chica:')
    elseif dadName == 'foxy' then
        setTextString('NameShit', 'Foxy:')
    elseif dadName == 'bear5' then
        setTextString('NameShit', 'Bear5:')
    end
end

function onUpdate(elapsed)
    if getTextString('lyric') == '' then
        setProperty('NameShit.alpha', 0.001) --afraid to make it 0
    else 
        setProperty('NameShit.alpha', 1) --afraid to make it 0

    end     
end