param (
    [string]$markdownFilePath
)

function SimulateTyping {
    param(
        [string]$Text,
        [int]$DelayMilliseconds = 50
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
