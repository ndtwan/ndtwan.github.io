param([string]$SourceRoot = 'D:/Twan/Blog/twandesu')
$ErrorActionPreference = 'Stop'
$utf8 = [Text.UTF8Encoding]::new($false)
$entries = @(
    @{ File='2025-07-11-Oyasumi-punpun.md'; Slug='oyasumi-punpun'; Title='Punpun – Giấc mơ chết trong lòng mỗi chúng ta'; Date='2025-07-11'; Categories='["Manga", "Tản văn"]'; Tags='["Inio Asano", "Punpun", "tuổi trẻ"]'; Image='/assets/img/blog/pyasumi.jpg'; Draft='false' },
    @{ File='2024-12-31-Anthropocene.md'; Slug='chung-ta-da-bat-dau'; Title='Chúng ta đã bắt đầu từ những gì rất khác'; Date='2024-12-31'; Categories='["Lịch sử", "Khoa học"]'; Tags='["nhân loại", "tiến hóa", "lịch sử"]'; Image='/assets/img/blog/history.png'; Draft='false' },
    @{ File='2025-01-03-SoC.md'; Slug='giai-ngo-thiet-ke-chip'; Title='Giải ngố thiết kế chip'; Date='2025-01-03'; Categories='["Khoa học"]'; Tags='["bán dẫn", "SoC", "công nghệ"]'; Image='/assets/img/blog/jeremy-bishop@0,5x.jpg'; Draft='true' }
)
foreach ($entry in $entries) {
    $target = Join-Path "content/posts" ($entry.Slug + '.md')
    if (Test-Path $target) { throw "Refusing to overwrite $target" }
    $source = [IO.File]::ReadAllText((Join-Path $SourceRoot "blog/_posts/$($entry.File)"))
    $body = [regex]::Replace($source, '(?s)\A---\r?\n.*?\r?\n---\r?\n', '')
    $body = [regex]::Replace($body, '(?m)^# .+\r?\n', '')
    $front = "---`ntitle: '$($entry.Title)'`ndate: $($entry.Date)`ndraft: $($entry.Draft)`ncategories: $($entry.Categories)`ntags: $($entry.Tags)`nimage: '$($entry.Image)'`n---`n"
    [IO.File]::WriteAllText((Join-Path $PWD $target), $front + $body, $utf8)
    $images = [regex]::Matches($source + $entry.Image, '/assets/img/blog/[^\s"''<>\)]+') | ForEach-Object Value | Select-Object -Unique
    foreach ($image in $images) {
        $inputPath = Join-Path $SourceRoot $image.TrimStart('/')
        $outputPath = Join-Path 'static' $image.TrimStart('/')
        if (Test-Path $inputPath) {
            New-Item -ItemType Directory -Force (Split-Path $outputPath) | Out-Null
            Copy-Item -LiteralPath $inputPath -Destination $outputPath
        } else { Write-Warning "Missing image: $image" }
    }
}
Copy-Item "$SourceRoot/assets/img/about/solanin-chapter1.png" static/images/posts/solanin/cover.png
