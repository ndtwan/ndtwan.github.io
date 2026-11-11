$ErrorActionPreference = 'Stop'
$utf8 = [Text.UTF8Encoding]::new($false)
$ids = @('02', '03', '04', '06', '07', '08', '10', '11', '14', '17', '19')
$target = Join-Path $PWD 'content/posts/may-dong-vun/index.md'
if (Test-Path $target) { throw 'Grouped post already exists.' }
$parts = [Collections.Generic.List[string]]::new()
$front = "---`ntitle: 'Mấy dòng vụn'`ndraft: false`ncategories: ['Tản văn']`ntags: ['mưa', 'cố nhân', 'giang hồ', 'nhân gian']`ntoc: false`n---`n`n"
foreach ($id in $ids) {
    $file = Join-Path $PWD "content/posts/son-ha-con-do/$id/index.md"
    $text = [IO.File]::ReadAllText($file)
    $title = [regex]::Match($text, "(?m)^title: '(.+)'" ).Groups[1].Value
    $body = [regex]::Replace($text, '(?s)\A---\r?\n.*?\r?\n---\r?\n', '').Trim()
    $parts.Add("## $title`n`n$body")
    $text = $text.Replace("draft: false", "draft: false`nbuild:`n  list: never`n  render: always`nshortProseGroup: /posts/may-dong-vun/")
    [IO.File]::WriteAllText($file, $text, $utf8)
}
New-Item -ItemType Directory -Force (Split-Path $target) | Out-Null
[IO.File]::WriteAllText($target, $front + ($parts -join "`n`n---`n`n") + "`n", $utf8)
Write-Output "Grouped $($ids.Count) short posts. Original URLs remain rendered."
