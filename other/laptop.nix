{ config, lib, pkgs, ... }: {


services.logind.settings.Login = {
  HandleLidSwitch = "ignore"; # if lid just lock
  HandleLidSwitchExternalPower = "hibernate"; # if lid lockd and laptop on power
  HandleLidSwitchDocked = "ignore"; # of lid lock and laptop have dock-station
};

# one of "ignore", "poweroff", "reboot", "halt", "kexec", "suspend", "hibernate", "hybrid-sleep", "suspend-then-hibernate", "lock"

services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
	
	#minimal/maximal boost cpu on power charging
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
	#minimal/maximal boost cpu on battery
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 40;

       #Optional helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 60; # 40 and below it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 90; # 80 and above it stops charging

      };
};
}
