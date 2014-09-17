class join2ADdomain {
  $exe_name = "addcomputer.ps1"
  $location = "puppet:///modules/${module_name}/${exe_name}"
  $on_disk = 'C:\addcomputer.ps1'

  file { $on_disk:
    ensure => file,
    source => $location,
    mode   => '750',
  }
  exec { 'Adding computer to Active Directory Domain':
	command => 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy remotesigned  -file C:\addcomputer.ps1',
  }

}
