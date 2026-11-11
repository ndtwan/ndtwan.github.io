param([string]$DocumentPath = 'D:/Downloads/Son_Ha_Con_Do_Nguoi_Da_Qua.docx')
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [IO.Compression.ZipFile]::OpenRead($DocumentPath)
try {
    $reader = [IO.StreamReader]::new($zip.GetEntry('word/document.xml').Open())
    [xml]$xml = $reader.ReadToEnd()
    $reader.Dispose()
} finally { $zip.Dispose() }
$ns = [Xml.XmlNamespaceManager]::new($xml.NameTable)
$ns.AddNamespace('w', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main')
$utf8 = [Text.UTF8Encoding]::new($false)
$collection = 'Sơn hà còn đó, người đã qua'
$entries = [Collections.Generic.List[object]]::new()
$current = $null
$section = ''
$started = $false
foreach ($paragraph in $xml.SelectNodes('//w:body/w:p', $ns)) {
    $styleNode = $paragraph.SelectSingleNode('w:pPr/w:pStyle', $ns)
    $style = if ($styleNode) { $styleNode.GetAttribute('val', $ns.LookupNamespace('w')) } else { '' }
    $text = ($paragraph.SelectNodes('.//w:t | .//w:br | .//w:tab', $ns) | ForEach-Object {
        $node = $_
        switch ($node.LocalName) { 'br' { "  `n" }; 'tab' { '    ' }; default { $node.InnerText } }
    }) -join ''
    if ($style -eq 'Eyebrow' -and $text -eq 'PHẦN I') { $started = $true }
    if (-not $started -or -not $text.Trim()) { continue }
    if ($style -eq 'Heading1' -and -not $text.StartsWith('Vĩ thanh')) {
        $current = $null
        $section = $text
    } elseif ($style -eq 'Heading2' -or ($style -eq 'Heading1' -and $text.StartsWith('Vĩ thanh'))) {
        $current = @{ Title=$text; Section=$section; Paragraphs=[Collections.Generic.List[string]]::new(); Supplement=$false }
        $entries.Add($current)
    } elseif ($current -and $style -eq 'Eyebrow') {
        if ($text -eq 'BÀI BỔ SUNG') { $current.Supplement = $true }
    } elseif ($current) {
        $current.Paragraphs.Add($text)
    }
}
$indexLines = [Collections.Generic.List[string]]::new()
$indexLines.Add("---`ntitle: 'Tản văn'`nurl: /son-ha-con-do/`nlayout: prose-redirect`n---`n")
$indexLines.Add('Mộng cố lý · Tỉnh nhân gian · Thương một đời hữu hạn.')
$indexLines.Add('Có hứng thì viết. Có chuyện thì kể. Không hẹn ngày nào.')
$previousSection = ''
for ($i=0; $i -lt $entries.Count; $i++) {
    $entry = $entries[$i]
    $number = '{0:d2}' -f ($i+1)
    $folder = "content/posts/son-ha-con-do/$number"
    if (Test-Path "$folder/index.md") { throw "Refusing to overwrite $folder/index.md" }
    New-Item -ItemType Directory -Force $folder | Out-Null
    $safeTitle = $entry.Title.Replace("'", "''")
    $safeSection = $entry.Section.Replace("'", "''")
    $header = "---`ntitle: '$safeTitle'`ndraft: false`ncategories: ['Tản văn']`ntags: ['$safeSection']`ntoc: false`n---`n`n"
    $note = ''
    $body = $entry.Paragraphs -join "`n`n"
    [IO.File]::WriteAllText((Join-Path $PWD "$folder/index.md"), $header + $note + $body + "`n", $utf8)
    if ($entry.Section -ne $previousSection) {
        $indexLines.Add("`n## $($entry.Section)`n")
        $previousSection = $entry.Section
    }
    $indexLines.Add("- [$($entry.Title)](/posts/son-ha-con-do/$number/)")
}
New-Item -ItemType Directory -Force 'content/page/son-ha-con-do' | Out-Null
[IO.File]::WriteAllText((Join-Path $PWD 'content/page/son-ha-con-do/index.md'), $indexLines[0] + $indexLines[2] + "`n", $utf8)
Write-Output "Imported $($entries.Count) works. No publication dates were invented."
