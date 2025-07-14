# Set the root path for your project
$projectRoot = "C:\You-AI"

# Create main project folder
New-Item -ItemType Directory -Path $projectRoot -Force

# Define a structured list of folders
$folders = @(
    "01_Scripts",              # Written scripts for each video
    "02_Voiceovers",           # TTS audio files
    "03_Footage\Stock",        # Downloaded stock visuals
    "03_Footage\Generated",    # AI-generated visuals (e.g., Synthesia)
    "04_EditingProjects",      # Raw project files from editors like Pictory
    "05_FinalVideos",          # Finished MP4s ready for upload
    "06_Thumbnails",           # YouTube thumbnails
    "07_MusicSFX\Music",       # Background music
    "07_MusicSFX\SFX",         # Sound effects
    "08_Research",             # Niche ideas, keyword lists, trending topics
    "09_ChannelMetadata",      # Titles, tags, descriptions, upload calendar
    "10_AutomationScripts",    # Future automation: auto-upload, SEO, etc.
    "11_BrandsAndSponsors",    # Sponsor outreach plans and affiliate links
    "12_AnalyticsAndReports",  # Watch time, RPM, CTR, retention analytics
    "Templates",               # Reusable intros/outros, font styles
    "Logs"                     # System logs for monitoring automation
)

# Create each folder
foreach ($folder in $folders) {
    $fullPath = Join-Path $projectRoot $folder
    New-Item -ItemType Directory -Path $fullPath -Force
}

# Create README.md to explain project goals and workflow
$readme = @"
# You-AI Automation Hub

Welcome to the You-AI monetization channel setup. This is a fully faceless, AI-powered YouTube automation system.

## Goals
- Reach monetization: 1,000 subscribers and 4,000 watch hours within 60 days
- Post 3+ videos weekly
- Automate video generation using AI
- Maximize CTR, engagement, and earnings

## Workflow Summary
1. Research trending topics
2. Write or generate video script
3. Convert to voiceover (TTS)
4. Assemble visuals (stock + AI-generated)
5. Edit and export video
6. Create thumbnail and upload
7. Track analytics and optimize

"@
Set-Content -Path "$projectRoot\README.md" -Value $readme
