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

# Create the Markdown file
New-Item -ItemType File -Path $fileName

Write-Host "Markdown file created with name: $fileName"