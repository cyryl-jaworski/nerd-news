param (
    [string]$markdownFilePath
)

function SimulateTyping {
    param(
        [string]$Text,
        [int]$DelayMilliseconds = 20
    )
    
    $Chars = $Text.ToCharArray()
    
    foreach ($char in $Chars) {
        Write-Host -NoNewline $char
        Start-Sleep -Milliseconds $DelayMilliseconds
    }
    
    Write-Host
}

# Read the markdown file
$markdownContent = Get-Content $markdownFilePath

function WaitForSpacebar {
    SimulateTyping "..."
    $Key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown').VirtualKeyCode
    while ($Key -ne 32) {
        $Key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown').VirtualKeyCode
    }
}

# Function to display header 1
function DisplayHeader1 {
    Clear-Host
    Write-Host ""
    Write-Host ""
    SimulateTyping $args[0]#.Trim()
    Write-Host ""
    Write-Host ""
}

# Function to display header 2
function DisplayHeader2 {
    Clear-Host
    Write-Host ""
    SimulateTyping $args[0]#.Trim()
    Write-Host ""
}

# function Show-NerdNews {
#     $colors = @("Red", "Yellow", "Green", "Blue", "Magenta", "Cyan", "White")
#     $news = "NERD-NEWS"
#     $length = $news.Length
#     $delay = 200
#     $verticalStep = 2
#     $verticalDirection = 1
#     $position = 0

#     while ($true) {
#         Clear-Host

#         # Detect if spacebar is pressed
#         if ([System.Console]::KeyAvailable) {
#             $key = [System.Console]::ReadKey($true)
#             if ($key.Key -eq "Spacebar") {
#                 break
#             }
#         }

#         $color = Get-Random -InputObject $colors
#         $paddingTop = Get-Random -Minimum 1 -Maximum 10
#         $paddingBottom = 10 - $paddingTop

#         for ($i = 0; $i -lt $paddingTop; $i++) {
#             Write-Host ""
#         }

#         for ($i = 0; $i -lt $verticalStep; $i++) {
#             Write-Host (" " * $position) -NoNewline
#             Write-Host -ForegroundColor $color $news
#             $position += 1
#             Start-Sleep -Milliseconds $delay
#             Clear-Host

#             # Detect if spacebar is pressed
#             if ([System.Console]::KeyAvailable) {
#                 $key = [System.Console]::ReadKey($true)
#                 if ($key.Key -eq "Spacebar") {
#                     break
#                 }
#             }
#         }

#         for ($i = 0; $i -lt $paddingBottom; $i++) {
#             Write-Host ""
#         }

#         if ($position -ge $Host.UI.RawUI.WindowSize.Width - $length) {
#             $position = 0
#         }
#     }
# }

# Show-NerdNews

# Iterate through each line in the markdown content
foreach ($line in $markdownContent) {
    if ($line -match '^# ') {
        DisplayHeader1 $line
    }
    elseif ($line -match '^## ' ) {
        WaitForSpacebar
        DisplayHeader2 $line
    }
    # elseif ($line -eq $markdownContent[-1]) {
    #     Write-Host ""
    #     Write-Host "The End"
    #     Write-Host ""
    #     WaitForSpacebar
    # }
    else {
        SimulateTyping $line
    }
}
