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

function Draw-Plane {

    
}

function Draw-Fire-1 {
    Write-Host
    [int]$DelayMilliseconds = 50
    $FireCount = 0
    while ($FireCount -lt 15) {
            if(($FireCount -eq 3)  -or ($FireCount -eq 8) -or ($FireCount -eq 13)){
                Write-Host -NoNewline `u{1F525}
            } else {
                Write-Host -NoNewline "  "
            }
          
            Start-Sleep -Milliseconds $DelayMilliseconds
            $FireCount++
    }
}

function Draw-Fire-2 {
    Write-Host
    [int]$DelayMilliseconds = 50
    $FireCount = 0
    while ($FireCount -lt 15) {
            if(($FireCount -eq 2)  -or ($FireCount -eq 3) -or ($FireCount -eq 4) -or
            ($FireCount -eq 7)  -or ($FireCount -eq 8) -or ($FireCount -eq 9) -or
            ($FireCount -eq 12)  -or ($FireCount -eq 13) -or ($FireCount -eq 14)){
                Write-Host -NoNewline `u{1F525}
            } else {
                Write-Host -NoNewline "  "
            }
          
            Start-Sleep -Milliseconds $DelayMilliseconds
            $FireCount++
    
}
}

function Draw-Fire-3 {
    Write-Host
    [int]$DelayMilliseconds = 50
    $FireCount = 0
    while ($FireCount -lt 16) {
  
            Write-Host -NoNewline `u{1F525}
            Start-Sleep -Milliseconds $DelayMilliseconds
            $FireCount++
    }
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
    Draw-Fire-1
    Draw-Fire-2
    Draw-Fire-3
}

# Function to display header 2
function DisplayHeader2 {
    Clear-Host
    Write-Host ""
    SimulateTyping $args[0]#.Trim()
    Write-Host ""
}

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
