<h1>Extension Atributes</h1>

Collection of EA's that I use in my JSS

<h4>ADPassMon.in.LaunchAgent</h4>
This will check to see if there is a LaunchAgent for the ADPassMon App (LA would be created by you.  This is not default)

<h4>ADPassMon.in.Startup</h4>
This will check to see if ADPassMon has been added to the Start Up Items for the logged in user.

<h4>BatteryCondition</h4>
This will return the Condition of the Battery as reported in the Menu Bar. (Normal, Service Battery, etc)

<h4>DHCP.Enabled.Primary</h4>
This will return if DHCP is enabled on the machines Primary Network Interface.

<h4>DHCP.Server.Primary</h4>
This will return the DHCP Server for the machines Primary Network Interface.

<h4>DNS.Domain.Primary</h4>
This will return the DNS Domain for the machines Primary Network Interface.

<h4>DNS.Servers.Auto.Pushed.Primary</h4>
This will return the DNS Servers that are auto pushed for the machines Primary Network Interface.

<h4>DNS.Servers.Staticly.Set</h4>
This will return the DNS Servers that have been staticly set for the machines Primary Network Interface.

<h4>Default.Gateway.Primary</h4>
This will return the Default Gateway for the machines Primary Network Interface.

<h4>Firewall.Enabled</h4>
This will return if Apple's Firewall is enabled.

<h4>First.Boot.Guess</h4>
This will return the best guess of when a machine was imaged or configured.  The next EA is used with a "breadcrumb" file that I put in my new imaging workflow to give exact times/dates.

<h4>Imaging.TimeStamp</h4>
This will return the date/time of when a machine was imaged with Casper Imager.

<h4>Last.Boot.Time</h4>
This will return the last time a machine was booted.

<h4>Last.DC.Used</h4>
This will return the last domain controller used by the machine.

<h4>MAC.Address.Primary</h4>
This will return the MAC Address for the machines Primary Network Interface.

<h4>MDM.Capable</h4>
This will return whether the machine is MDM Capable.  Adds some other chacaters.

<h4>Management.Account</h4>
This will return the management account set in the JSS for the machine.

<h4>Primary.Network.Service</h4>
This will return the Primary Network Interface (i.e. en0, en1, etc.).

<h4>Primary.Network.Service.Name</h4>
This will return the Primary Network Interface Name (i.e. Ethernet, Wi-Fi, Thunderbolt Ethernet, etc.).

<h4>Recovery.HD.Present</h4>
This will return if the Recovery Partitiion is present on a machine.

<h4>SIP.Status</h4>
This will return whether SIP is enabled or disabled on a machine.

<h4>Search.Domains</h4>
This will return the search domains being used on a machine.

<h4>Subnet.Mask.Primary</h4>
This will return the subnet mask for the machines Primary Network Interface.

<h4>Wireless.SSDI</h4>
This will return the SSID of the last Wireless network the machine was on when recon was run.
