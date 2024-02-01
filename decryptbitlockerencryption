$BitLockerVolumes = Get-BitLockerVolume
foreach ($volume in $BitLockerVolumes) {
    Disable-BitLocker -MountPoint $volume.MountPoint
}
