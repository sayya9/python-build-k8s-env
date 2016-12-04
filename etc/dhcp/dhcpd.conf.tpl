ddns-update-style none;
option domain-name "example.org";
option domain-name-servers 8.8.8.8;
default-lease-time 600;
max-lease-time 7200;
log-facility local7;

subnet 192.168.108.0 netmask 255.255.255.0 {
  range 192.168.108.181 192.168.108.190;
  option routers 192.168.108.1;
  option broadcast-address 192.168.108.255;
  next-server 192.168.108.90;
  if exists user-class and option user-class = "iPXE" {
    filename = "ClientMACAddr.ipxe";
  } else {
    filename = "undionly.kpxe";
  }
}

host station {
      hardware ethernet ClientMACAddr;
      fixed-address ClientIPAddr;
}
