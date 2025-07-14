param(
    [string]$Topic = "Top 5 AI Tools That Save You Time",
    [string]$OutputFile = "01_Scripts/video_001.txt"
)

# Load your secret
$apiKey = $env:OPENAI_API_KEY
if (-not $apiKey) { throw "OPENAI_API_KEY not set" }

# Build request body
$body = @{
    model = "gpt-3.5-turbo"
    messages = @(
        @{ role = "system"; content = "You are a crisp, engaging YouTube scriptwriter." },
        @{ role = "user"; content = "Write me a full 400-word video script about '$Topic' with hook, intro, 5 segments, and outro." }
    )
    max_tokens = 1000
    temperature = 0.7
} | ConvertTo-Json

# Call OpenAI API
$response = Invoke-RestMethod `
    -Uri "https://api.openai.com/v1/chat/completions" `
    -Headers @{ "Authorization" = "Bearer $apiKey" } `
    -Method Post `
    -Body $body `
    -ContentType "application/json"

# Extract and save content
$scriptText = $response.choices[0].message.content
$scriptText | Out-File -FilePath $OutputFile -Encoding utf8

Write-Output "Generated script saved to $OutputFile"
