param([string]$SourcePath = 'D:/Downloads/Tan_Van_Bon_Thien_Moi.md')
$ErrorActionPreference = 'Stop'
$utf8 = [Text.UTF8Encoding]::new($false)
$source = [IO.File]::ReadAllText($SourcePath)
$sections = [regex]::Matches($source, '(?ms)^## (?:I|II|III|IV)\. (.+?)\r?\n(.*?)(?=^## (?:I|II|III|IV)\. |\z)')
if ($sections.Count -ne 4) { throw 'Expected four prose posts in the source.' }
$slugs = @('thanh-cu-khong-nguoi-doi', 'den-nha-ai-con-sang', 'xuan-chua-tung-loi-hen', 'dai-ngan-bat-ngu')
$tags = @('["cố nhân", "hoài niệm"]', '["nhà", "gia đình"]', '["mùa xuân", "hy vọng"]', '["thiên nhiên", "nhân sinh"]')
for ($i = 0; $i -lt $sections.Count; $i++) {
    $target = Join-Path $PWD "content/posts/$($slugs[$i])/index.md"
    if (Test-Path $target) { throw "Refusing to overwrite $target" }
}
foreach ($file in Get-ChildItem 'content/posts/son-ha-con-do' -Recurse -Filter '*.md') {
    $text = [IO.File]::ReadAllText($file.FullName)
    $text = [regex]::Replace($text, '(?m)^(series|collection|collectionPart|sequence):[^\r\n]*\r?\n', '')
    $text = [regex]::Replace($text, '(?m)^\*Bài bổ sung trong bản biên tập 2026\.\*\r?\n\r?\n?', '')
    [IO.File]::WriteAllText($file.FullName, $text, $utf8)
}
for ($i = 0; $i -lt $sections.Count; $i++) {
    $title = $sections[$i].Groups[1].Value.Trim().Replace("'", "''")
    $body = $sections[$i].Groups[2].Value.Trim()
    $body = [regex]::Replace($body, '\r?\n---\s*\z', '').Trim()
    $folder = Join-Path $PWD "content/posts/$($slugs[$i])"
    New-Item -ItemType Directory -Force $folder | Out-Null
    $front = "---`ntitle: '$title'`ndate: 2026-11-11`ndraft: false`ncategories: ['Tản văn']`ntags: $($tags[$i])`ntoc: false`n---`n`n"
    [IO.File]::WriteAllText((Join-Path $folder 'index.md'), $front + $body + "`n", $utf8)
}
$legacyPage = Join-Path $PWD 'content/page/son-ha-con-do/index.md'
[IO.File]::WriteAllText($legacyPage, "---`ntitle: Tản văn`nurl: /son-ha-con-do/`nlayout: prose-redirect`n---`n", $utf8)
Write-Output 'Added four prose posts; removed editorial labels from older posts. New dates are publication dates.'
