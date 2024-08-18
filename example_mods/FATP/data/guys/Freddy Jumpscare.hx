import hxcodec.flixel.FlxVideo;

function onCreatePost(){
     //cache the video
    var video:FlxVideo = new FlxVideo();
    video.play(Paths.video('FredrickFazbearingJumpscare'));
    video.stop();
}

function onEvent(eventName, v1, v2){
    if (eventName == 'Freddy Jumpscare'){
        var freddyballsfaz:FlxVideo = new FlxVideo();
        freddyballsfaz.play(Paths.video('FredrickFazbearingJumpscare'));
    }
}