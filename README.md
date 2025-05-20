Instructions for Applying performance_tweaks.zip
The following instructions specifically apply to the performance_tweaks.reg file included in this repository. If additional tweak files are added, please refer to the respective instructions accordingly.


Create a Backup or System Restore Point
Prior to modifying the Windows Registry, it is essential to create a backup or a system restore point. This precaution allows you to recover your system in the event of any unintended consequences resulting from registry changes.
Click On The File Name On The Repoitory Click Download Raw File
Download the performance_tweaks.reg File
Download the performance_tweaks.reg file from this repository. Ensure the file is saved to a known location on your computer.
Locate the downloaded performance_tweaks.reg file, right-click on it, Click Show More Options And and select Merge. If Smart Control Stops You Right Click On The File select properties, and click unblock. Then Try To Click Merge Again If It Works, You will receive a security prompt; confirm it by clicking Yes to proceed with importing the registry entries. This action applies the performance optimization tweaks contained within the file.

Restart Your Computer
After successfully merging the registry file, restart your computer to allow all changes to take full effect.

How to Use check_registry_tweaks.ps1 (Beko Tweaks)
This PowerShell script is part of the Beko Tweaks project. It checks whether the performance registry settings from performance_tweaks.reg were successfully applied to your system.

Steps to Run the Script
Click On The Script Name Click Download Raw File
Download the Script
Save check_registry_tweaks.ps1 to a convenient location on your PC (for example, your Desktop or a dedicated folder).
Open File Explorer and locate the downloaded ps1 file
Right-click on check_registry_tweaks.ps1.
Select Run with PowerShell from the context menu.
If Smart Control Stops You Right Click On The File select properties, and click unblock.
PowerShell will open and automatically execute the script.

Review the Output
The script will check key registry values used by Beko Tweaks and display whether each one has been correctly applied or needs to be fixed.

And If It Shows This: Registry Performance Tweaks: Verification Results
All performance tweaks were successfully applied and verified. Each registry key was checked and is set to the correct value:

Setting	Status	Value	Meaning
Win32PrioritySeparation	Applied	0x26 (38)	Foreground apps are prioritized
SystemResponsiveness	Applied	0x0A (10)	Reduced input lag (good for gaming)
PowerThrottlingOff	Applied	1	CPU throttling disabled (better performance)
CoalescingTimerInterval - Attributes	Applied	0	Hidden power setting unlocked
ProcessorIdleDemoteThreshold - Attributes	Applied	0	CPU stays in high-performance state longer
ProcessorIdleDemoteThreshold - Value	Applied	0	Immediate response when more power is needed

Summary:
All settings are correctly applied and optimized for performance.
No further action is needed — your system is now running with improved responsiveness, especially for gaming and foreground app usage.

Troubleshooting:
If Smart App Control Blocks the Files
Some versions of Windows may block check_registry_tweaks.ps1 or performance_tweaks.reg from running due to Smart App Control or other security settings. If you receive a message stating that Windows prevented the file from running, follow these steps to unblock it:

1. Unblock the File Manually
Right-click on the file (check_registry_tweaks.ps1 or performance_tweaks.reg)

Select Properties from the context menu

In the General tab, look near the bottom under Attributes

If you see a checkbox that says Unblock, check it

Click Apply, then OK to close the window

2. Run the File Again
For .reg files: Right-click > Merge to apply the registry tweaks

For .ps1 scripts: Right-click > Run with PowerShell to execute the check script
Also Keep Note You May Want To Install The Checker To Make Sure The Registry Editor Tweaks Worked.
