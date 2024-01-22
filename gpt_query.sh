my_var=$*

response=$(curl -sS https://openrouter.ai/api/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -d "{
  \"model\": \"openai/gpt-3.5-turbo\",
  \"messages\": [
    {\"role\": \"user\", \"content\": \"$my_var\"}
  ]
}")

# Extract the content using text processing with awk and remove leading whitespace/newlines
result=$(echo "$response" | python3 -c "import sys, json; print(json.load(sys.stdin)['choices'][0]['message']['content'])")

#result=$(echo -e "$response" | awk -F'"content":' '{print $2}' | awk -F'"' '{print $2}' | sed -e 's/^[[:space:]]*//' | sed '/^$/d')
