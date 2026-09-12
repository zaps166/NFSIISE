# Nix Instructions

You can run or install **NFSIISE** using the Nix package manager. 

> ⚠️ **System Requirements:** This is a 32-bit build (`i686-linux`). It runs perfectly on standard 64-bit Linux computers (`x86_64-linux`), but it **does not support macOS or ARM architectures** (like Raspberry Pi or Apple Silicon M-series).

---

### 💡 Prerequisites (For Beginners)

To use these commands, you must have Nix installed. If you don't have it yet, follow the [Official Nix Installation Guide](https://nixos.org/download/#download-nix).

#### Enabling Flakes (Highly Recommended)
Most modern Nix commands require **Flakes** enabled. If you haven't enabled them yet, choose one of these two options:

1. **Temporary Method:** Append this flag to the end of any `nix` command:
   ```sh
   --extra-experimental-features 'nix-command flakes'
   ```
   
  	*EXAMPLE: instead of running a normal command, you paste the flag at the very end like this:*
  
   ```sh
   nix run "git+https://github.com/zaps166/NFSIISE" --extra-experimental-features 'nix-command flakes'
   ```
   
2. **Permanent Method (Recommended):** Add this to your NixOS `configuration.nix` or system `~/.config/nix/nix.conf`:
   ```nix
   nix.settings.experimental-features = [ "nix-command" "flakes" ];
   ```

---

### Run Without Installing (Temporary Use)

Use this if you just want to launch and play the game immediately without modifying your system configuration permanently.

* **Using Flakes:**
  ```sh
  nix run "git+https://github.com/zaps166/NFSIISE"
  ```

---

### 📦 Standalone Package Management

Use this if you are using Nix as a package manager on top of a non-NixOS Linux distribution (like Ubuntu, Debian, or Fedora) and want the game instantly available in your terminal.

####  ❄️ Using Flakes (Modern)
* **Install:**
  ```sh
  nix profile install "git+https://github.com/zaps166/NFSIISE"
  ```
* **Uninstall:**
  ```sh
  nix profile remove "git+https://github.com/zaps166/NFSIISE"
  ```

#### Using `nix-env` (Legacy / Non-Flake)
* **Install:**
  ```sh
  nix-env -f "https://github.com/zaps166/NFSIISE/tarball/master" -iA nfs2se
  ```
* **Uninstall:**
  ```sh
  nix-env -e nfs2se
  ```

---

### ❄️ NixOS System Configuration

Use this if you run NixOS and want the game globally installed for all users on your machine via your system rebuilds.

#### Using Flakes (Modern)
First, add the repository to your `flake.nix` inputs:
```nix
# flake.nix
{
  inputs.nfs2se.url = "git+https://github.com/zaps166/NFSIISE";

  outputs = { self, nixpkgs, nfs2se, ... }@inputs: {
    nixosConfigurations.mysystem = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; }; # Passes inputs down to configuration.nix
      modules = [ ./configuration.nix ];
    };
  };
}
```

Then add next to your configuration.nix

```nix
# configuration.nix
{ pkgs, inputs, ... }: {
  ...
  environment.systemPackages = [
    ...
    inputs.nfs2se.packages.${pkgs.stdenv.hostPlatform.system}.default
    ...
  ];
  ...
}
```

#### Without Flakes (Legacy `configuration.nix`)
Add this block directly into your standard configuration file to automatically download and build the project during system rebuilds:

```nix
# configuration.nix
{ pkgs, ... }:
let
  nfs2se-src = builtins.fetchTarball "https://github.com/zaps166/NFSIISE/tarball/master";
  nfs2se-pkg = (import nfs2se-src { inherit pkgs; }).nfs2se;
in {
  ...
  environment.systemPackages = [
    ...
    nfs2se-pkg
    ...
  ];
  ...
}
```

---

### 🏠 Home Manager Configuration

Use this if you use Home Manager to declaratively control your user environment and dotfiles separately from the base system.

#### Using Flakes (Modern)

Ensure your system/home-manager flake passes `inputs` down to your modules, then include the package:

```nix
# home.nix
{ pkgs, inputs, ... }: {
  ...
  home.packages = [
    ...
    inputs.nfs2se.packages.${pkgs.stdenv.hostPlatform.system}.default
    ...
  ];
  ...
}
```

#### Option B: Without Flakes (Legacy `home.nix`)

Add this evaluation block to your traditional, standalone `home.nix` profile:

```nix
# home.nix
{ pkgs, ... }:
let
  nfs2se-src = builtins.fetchTarball "https://github.com/zaps166/NFSIISE/tarball/master";
  nfs2se-pkg = (import nfs2se-src { inherit pkgs; }).nfs2se;
in {
  ...
  home.packages = [
    ...
    nfs2se-pkg
    ...
  ];
  ...
}
```
