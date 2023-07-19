Get-ChildItem "Webm" -Filter *.webm | 
Foreach-Object {
    $basename = [io.path]::GetFileNameWithoutExtension($_.FullName)
    Write-Host "$basename.wav"
    ffmpeg -i $_.FullName -acodec pcm_s16le -ac 1 -ar 16000 "$basename.wav"
}