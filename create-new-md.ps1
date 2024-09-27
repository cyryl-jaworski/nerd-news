# Get the current date
$currentDate = Get-Date

# Check if today is Friday
if ($currentDate.DayOfWeek -eq 'Friday') {
    $currentDate = $currentDate.AddDays(7) # Move to next Friday
}

# Calculate the nearest Friday
$daysUntilFriday = (5 - $currentDate.DayOfWeek.value__)
if ($daysUntilFriday -lt 0) { $daysUntilFriday += 7 }
$nearestFriday = $currentDate.AddDays($daysUntilFriday)

# Create the file name in the format [year]-[month]-[day-of-the-nearest-Friday].md
$fileName = "{0:yyyy-MM-dd}.md" -f $nearestFriday

# Create the content for the Markdown file
$mdContent = @"
# Nerd-news $($nearestFriday.ToString("yyyy-MM-dd"))

## AI news 

## Security news

## Cloud news

## Random news

## Interesting links
"@

# Create the Markdown file and add content
Set-Content -Path $fileName -Value $mdContent

Write-Host "Markdown file created with name: $fileName"
