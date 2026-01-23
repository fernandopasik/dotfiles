$hyperVdir = "D:\Hiper-V"
$ubuntuImage = "https://partner-images.canonical.com/hyper-v/desktop/focal/current/ubuntu-focal-hyperv-amd64-ubuntu-desktop-hyperv.vhdx.zip"

$vmName = "linux-pc"
$vmPath = Join-Path $hyperVdir $vmName
$vhdx   = Join-Path $vmPath "$vmName.vhdx"
$vmCpus = 2
$vmMemory = 4GB

New-Item -Path $vmPath -ItemType Directory -Force

$hasVHDX = Test-Path -Path $vhdx
if (!$hasVHDX) {
  Write-Host "Downloading Linux image"
  $vhdxZip = "$vhdx.zip"
  Invoke-WebRequest -Uri $ubuntuImage -OutFile $vhdxZip
  Expand-Archive -Path $vhdxZip -Destination $vmPath -Force
  Get-ChildItem -Path $vmPath -Filter *.vhdx | Rename-Item -NewName { "$vmName.vhdx" }

  Remove-Item -Path $vhdxZip
  Write-Host "Downloaded Linux image"
}

if (-not (Get-VM -Name $vmName -ErrorAction SilentlyContinue)) {
  Write-Host "Creating VM '$vmName'"
  New-VM `
    -Generation 2 `
    -Name $vmName `
    -Path $hyperVdir `
    -VHDPath $vhdx
  New-VMSwitch -Name "InternalSwitch" -SwitchType Internal
  Connect-VMNetworkAdapter -VMName $vmName -SwitchName "InternalSwitch"
}

Stop-VM -Name $vmName -Force
Set-VMProcessor -VMName $vmName -Count $vmCpus
Set-VMMemory -VMName $vmName -DynamicMemoryEnabled $false -StartupBytes $vmMemory
Set-VMFirmware -VMName $vmName -EnableSecureBoot On -SecureBootTemplate "MicrosoftUEFICertificateAuthority"
$mac = "00-15-5D-{0:X2}-{1:X2}-{2:X2}" -f (Get-Random -Maximum 256), (Get-Random -Maximum 256), (Get-Random -Maximum 256)
Set-VMNetworkAdapter -VMName $vmName -StaticMacAddress $mac
