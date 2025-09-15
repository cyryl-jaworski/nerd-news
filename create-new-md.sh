#!/bin/zsh
# Get today's date
current_date=$(date '+%Y-%m-%d')
current_day=$(date '+%u') # 1=Monday, 5=Friday, 7=Sunday

# If today is Friday, move to next Friday
if [[ "$current_day" == "5" ]]; then
  next_friday=$(date -v+7d '+%Y-%m-%d')
else
  # Calculate days until next Friday
  days_until_friday=$(( (5 - current_day + 7) % 7 ))
  if [[ $days_until_friday -eq 0 ]]; then
    days_until_friday=7
  fi
  next_friday=$(date -v+${days_until_friday}d '+%Y-%m-%d')
fi

file_name="${next_friday}.md"

md_content="# Nerd-news ${next_friday}

## Hardware news

## AI news 

## Security news

## Cloud news

## Random news

## Interesting links
"

echo "$md_content" > "$file_name"
echo "Markdown file created with name: $file_name"
