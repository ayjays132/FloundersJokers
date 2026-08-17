$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

$workspace = Split-Path -Parent $PSScriptRoot
$legacy = Get-Content -Raw (Join-Path $workspace 'FloundersJokers.lua')
$suite = Get-Content -Raw (Join-Path $workspace 'modules/dice_suite.lua')
$slugs = @(
    [regex]::Matches($legacy, 'slug\s*=\s*"([^"]+)"') | ForEach-Object { $_.Groups[1].Value }
) + @('loaded_stone','brass_cup','payout_gem','house_edge','double_down','croupier')
$slugs = $slugs | Sort-Object -Unique

$columns = 10
$cardW, $cardH = 142, 190
$cellW, $cellH = 158, 222
$rows = [Math]::Ceiling($slugs.Count / $columns)
$canvas = [System.Drawing.Bitmap]::new($columns * $cellW, $rows * $cellH)
$graphics = [System.Drawing.Graphics]::FromImage($canvas)
try {
    $graphics.Clear([System.Drawing.Color]::FromArgb(16, 16, 23))
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
    $font = [System.Drawing.Font]::new('Consolas', 10, [System.Drawing.FontStyle]::Regular)
    $brush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(235, 235, 242))
    try {
        for ($index = 0; $index -lt $slugs.Count; $index++) {
            $slug = $slugs[$index]
            $x = ($index % $columns) * $cellW + 8
            $y = [Math]::Floor($index / $columns) * $cellH + 6
            $image = [System.Drawing.Image]::FromFile((Join-Path $workspace "assets/2x/j_$slug.png"))
            try { $graphics.DrawImage($image, $x, $y, $cardW, $cardH) }
            finally { $image.Dispose() }
            $graphics.DrawString($slug, $font, $brush, $x, $y + $cardH + 5)
        }
    }
    finally { $brush.Dispose(); $font.Dispose() }
}
finally { $graphics.Dispose() }

$output = Join-Path $workspace 'docs/remaster-gallery.png'
try { $canvas.Save($output, [System.Drawing.Imaging.ImageFormat]::Png) }
finally { $canvas.Dispose() }
Write-Output "Wrote $output with $($slugs.Count) Jokers."
