# Define version and build info
$version = "2.0.1"
$build = "2024.09.26.1"
$scriptName = "DMD GHRunner Provisioner"
$scriptAuthr = "  by Blinky"

# Create a startup screen
$screenWidth = 60
$separator = "=" * $screenWidth
$header = @"
$separator
            $scriptName
            $scriptAuthr
            Version: $version
            Build: $build
$separator
"@

# Display the startup screen
Write-Host $header -ForegroundColor Cyan

# Add a pause to let the user read it before proceeding
Start-Sleep -Seconds 2

# Create a folder under the drive root if not exist
# Define the folder name
$folderName = "actions-runner"

# Check if the folder exists or if we are already in it
if (-not (Test-Path $folderName)) {
    # Create the folder if it does not exist
    mkdir $folderName
    Write-Host "[info] Created folder: $folderName" -ForegroundColor Green
} else {
    Write-Host "[error] Folder '$folderName' already exists." -ForegroundColor Yellow
    Write-Host "[info] Preparing to enter directory: '$folderName'" -ForegroundColor Green
}

# Change to the actions-runner directory
cd $folderName
 # Download the latest runner package
Write-Host "[info] Preparing to download required Github Runner files..." -ForegroundColor Gray
Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.319.1/actions-runner-win-x64-2.319.1.zip -OutFile actions-runner-win-x64-2.319.1.zip
# Optional: Validate the hash
Write-Host "[info] Validating checksum of download files..." -ForegroundColor Yellow
if((Get-FileHash -Path actions-runner-win-x64-2.319.1.zip -Algorithm SHA256).Hash.ToUpper() -ne '1c78c51d20b817fb639e0b0ab564cf0469d083ad543ca3d0d7a2cdad5723f3a7'.ToUpper()){ throw 'Computed checksum did not match!' }
# Extract the installer
Write-Host "[info] Attempting to extract installer..." -ForegroundColor Gray
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD/actions-runner-win-x64-2.319.1.zip", "$PWD")
Write-Host "[info] Provisioner is cleaning up before exit please wait..." -ForegroundColor Orange
Start-Sleep -Seconds 5
Write-Host "[info] Closing Provisioner service..." -ForegroundColor Orange
Start-Sleep -Seconds 2
Write-Host "[info] Provisioner has completed the job." -ForegroundColor Green
