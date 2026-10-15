[Windows.Media.Ocr.OcrEngine, Windows.Foundation.Diagnostics, ContentType = WindowsRuntime] | Out-Null
[Windows.Graphics.Imaging.BitmapDecoder, Windows.Graphics.Imaging, ContentType = WindowsRuntime] | Out-Null
[Windows.Storage.StorageFile, Windows.Storage, ContentType = WindowsRuntime] | Out-Null

$engine = [Windows.Media.Ocr.OcrEngine]::TryCreateFromUserProfileLanguages()

function Ocr-Image($path) {
    $fileTask = [Windows.Storage.StorageFile]::GetFileFromPathAsync($path)
    $file = $fileTask.AsTask().GetAwaiter().GetResult()
    $streamTask = $file.OpenAsync([Windows.Storage.FileAccessMode]::Read)
    $stream = $streamTask.AsTask().GetAwaiter().GetResult()
    $decoderTask = [Windows.Graphics.Imaging.BitmapDecoder]::CreateAsync($stream)
    $decoder = $decoderTask.AsTask().GetAwaiter().GetResult()
    $bitmapTask = $decoder.GetSoftwareBitmapAsync()
    $bitmap = $bitmapTask.AsTask().GetAwaiter().GetResult()
    $ocrResultTask = $engine.RecognizeAsync($bitmap)
    $ocrResult = $ocrResultTask.AsTask().GetAwaiter().GetResult()
    return $ocrResult.Text
}

$allText = ""
for ($i = 1; $i -le 15; $i++) {
    $p = "D:\study\syllabus_pages\page_$i.png"
    Write-Host "Processing page $i..."
    $txt = Ocr-Image $p
    $allText += "`n`n=== PAGE $i ===`n`n" + $txt
}
[System.IO.File]::WriteAllText("D:\study\syllabus_extracted.txt", $allText, [System.Text.Encoding]::UTF8)
Write-Host "Done! Saved to D:\study\syllabus_extracted.txt"
