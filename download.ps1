# Define version and build info
$version = "2.0.0"
$build = "2024.09.26"
$scriptName = "Setup Runner Script"

# Create a startup screen
$screenWidth = 60
$separator = "=" * $screenWidth
$header = @"
$separator
            $scriptName
            Version: $version
            Build: $build
$separator
"@

# Display the startup screen
Write-Host $header -ForegroundColor Cyan

# Add a pause to let the user read it before proceeding
Start-Sleep -Seconds 2

# Create a folder under the drive root
mkdir actions-runner; cd actions-runner
 # Download the latest runner package
Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.319.1/actions-runner-win-x64-2.319.1.zip -OutFile actions-runner-win-x64-2.319.1.zip
# Optional: Validate the hash
if((Get-FileHash -Path actions-runner-win-x64-2.319.1.zip -Algorithm SHA256).Hash.ToUpper() -ne '1c78c51d20b817fb639e0b0ab564cf0469d083ad543ca3d0d7a2cdad5723f3a7'.ToUpper()){ throw 'Computed checksum did not match' }
# Extract the installer
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD/actions-runner-win-x64-2.319.1.zip", "$PWD")
