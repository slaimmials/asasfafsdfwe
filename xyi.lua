sound.PlayURL ( "https://rus.hitmotop.com/get/music/20230703/Unknown_artist_-_Little_Big_Skibidi_gay_remix_Skibidi_pidoras_raz_raz_76264814.mp3", "noblock", function( s ) 
    if not IsValid( s ) then return end
    ultimate.validsnd = s

    ultimate.validsnd:EnableLooping( true )
end )
